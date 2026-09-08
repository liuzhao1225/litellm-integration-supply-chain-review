"""Read wheel archives and verify their internal RECORD inventories. Never import them."""

import argparse
import base64
import collections
import csv
import datetime
import hashlib
import io
import json
from pathlib import Path, PurePosixPath
import stat
import zipfile


def audit(path):
    errors = []
    with zipfile.ZipFile(path) as archive:
        entries = archive.infolist()
        files = [entry for entry in entries if not entry.is_dir()]
        counts = collections.Counter(entry.filename for entry in entries)
        duplicates = sorted(name for name, count in counts.items() if count > 1)
        unsafe_paths = sorted(entry.filename for entry in entries if (
            PurePosixPath(entry.filename).is_absolute()
            or '..' in PurePosixPath(entry.filename).parts
            or '\\' in entry.filename
            or ':' in entry.filename.split('/')[0]
        ))
        symlinks = sorted(entry.filename for entry in entries
                          if stat.S_ISLNK(entry.external_attr >> 16))
        records = [entry.filename for entry in files
                   if entry.filename.endswith('.dist-info/RECORD')]
        if len(records) != 1:
            raise ValueError('%s: expected one RECORD, found %r' % (path.name, records))
        record = records[0]
        rows = list(csv.reader(io.StringIO(archive.read(record).decode('utf-8'))))
        names = {entry.filename for entry in files}
        row_names = []
        unhashed = []
        verified = 0
        for row in rows:
            if len(row) != 3:
                raise ValueError('%s: malformed RECORD row' % path.name)
            name, digest, size = row
            row_names.append(name)
            if name not in names:
                errors.append({'path': name, 'error': 'recorded file absent from archive'})
                continue
            data = archive.read(name)
            if size and int(size) != len(data):
                errors.append({'path': name, 'error': 'size mismatch'})
            if not digest:
                unhashed.append(name)
                continue
            algorithm, encoded = digest.split('=', 1)
            actual = base64.urlsafe_b64encode(hashlib.new(algorithm, data).digest()).decode().rstrip('=')
            if encoded != actual:
                errors.append({'path': name, 'error': 'digest mismatch'})
            else:
                verified += 1
        row_counts = collections.Counter(row_names)
        unrecorded = sorted(names - set(row_names) - {record + '.jws', record + '.p7s'})
        duplicate_rows = sorted(name for name, count in row_counts.items() if count > 1)
        unexpected_unhashed = sorted(set(unhashed) - {record})
        suspicious = bool(errors or duplicates or unsafe_paths or symlinks
                          or unrecorded or duplicate_rows or unexpected_unhashed)
        return {
            'filename': path.name,
            'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'file_count': len(files),
            'record_rows': len(rows),
            'verified_file_hashes': verified,
            'record_errors': errors,
            'unrecorded_files': unrecorded,
            'duplicate_archive_paths': duplicates,
            'duplicate_record_paths': duplicate_rows,
            'unsafe_archive_paths': unsafe_paths,
            'symlinks': symlinks,
            'unhashed_files': unhashed,
            'unexpected_unhashed_files': unexpected_unhashed,
            'startup_hook_files': sorted(name for name in names if (
                name.endswith('.pth') or PurePosixPath(name).name
                in {'sitecustomize.py', 'usercustomize.py'})),
            'internal_integrity_anomaly': suspicious,
        }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('artifact_directories', nargs='+', type=Path)
    parser.add_argument('--output', required=True, type=Path)
    args = parser.parse_args()
    paths = sorted(p for directory in args.artifact_directories for p in directory.glob('*.whl'))
    if not paths:
        raise ValueError('No wheel archives found')
    results = [audit(path) for path in paths]
    report = {
        'checked_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'method': 'Python standard library only; no extraction, installation or import of package code.',
        'limits': 'RECORD consistency does not authenticate the publisher, prove source-to-binary equivalence, or establish benign behavior.',
        'wheels': results,
    }
    args.output.write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'wheels': len(results), 'hashed_files': sum(x['verified_file_hashes'] for x in results),
                      'anomalous_wheels': [x['filename'] for x in results if x['internal_integrity_anomaly']]}))
    if any(x['internal_integrity_anomaly'] for x in results):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
