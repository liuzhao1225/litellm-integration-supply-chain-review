"""Read-only static comparison. Run with Python 3.12+ using -I -S.

No investigated module is imported or executed. Output contains only public
source snippets, source-relative paths, line numbers, and artifact hashes.
"""
import argparse
import ast
import collections
import hashlib
import json
import re
from pathlib import Path
from urllib.parse import urlsplit


def scan(source_root, output_root):
    roots = {
        version: source_root / ("wheel-python-" + version)
        for version in ("1.99.0", "1.100.0")
    }
    source = {
        version: {
            str(path.relative_to(root)): path.read_text()
            for path in root.rglob("*.py")
        }
        for version, root in roots.items()
    }
    sensitive = re.compile(
        r"(\bexec\b|\beval\b|\bcompile\b|Popen|subprocess|os\.(system|popen)|"
        r"b64decode|pickle|marshal|importlib|__import__|exec_module|load_module|"
        r"spec_from|runpy|requests\.|httpx\.|urlopen|\.send$|\.post$|"
        r"os\.environ|os\.getenv|shutil|rmtree)", re.I
    )
    records, errors, changes, domains, invalid_urls = [], [], [], {}, []
    for version, files in source.items():
        found = collections.defaultdict(list)
        for path, content in files.items():
            try:
                tree = ast.parse(content)
            except SyntaxError as exc:
                errors.append({"version": version, "file": path, "error": str(exc)})
                continue
            for node in ast.walk(tree):
                if isinstance(node, ast.Constant) and isinstance(node.value, str):
                    for url in re.findall(r"https?://[^\s\"'<>{}\\]+", node.value):
                        try:
                            host = urlsplit(url).hostname
                        except ValueError as exc:
                            invalid_urls.append({"version": version, "file": path,
                                                 "line": node.lineno, "literal": url,
                                                 "error": str(exc)})
                            continue
                        if host:
                            found[host].append({"file": path, "line": node.lineno})
        domains[version] = found
    old, new = source["1.99.0"], source["1.100.0"]
    for path in sorted(old.keys() | new.keys()):
        a, b = old.get(path, ""), new.get(path, "")
        if path in old and path in new and a == b:
            continue
        changes.append({"file": path, "status": "added" if path not in old else "deleted" if path not in new else "modified"})
        if not b:
            continue
        try:
            at, bt = ast.parse(a), ast.parse(b)
        except SyntaxError:
            continue
        old_calls = collections.Counter(
            ast.dump(node, include_attributes=False)
            for node in ast.walk(at) if isinstance(node, ast.Call)
        )
        for node in ast.walk(bt):
            if not isinstance(node, ast.Call):
                continue
            canonical = ast.dump(node, include_attributes=False)
            if old_calls[canonical]:
                old_calls[canonical] -= 1
                continue
            call = ast.unparse(node.func)
            if not sensitive.search(call):
                continue
            code = ast.unparse(node)
            records.append({"file": path, "line": node.lineno,
                            "end_line": node.end_lineno, "call": call,
                            "code": code[:3000]})
    identical_paths = [
        "litellm/secret_managers/main.py",
        "litellm/litellm_core_utils/get_model_cost_map.py",
        "litellm/anthropic_beta_headers_manager.py",
        "litellm/proxy/types_utils/utils.py",
        "litellm/secret_managers/custom_secret_manager_loader.py",
        "litellm/litellm_core_utils/secret_redaction.py",
    ]
    identity = [{"file": path, "identical": old[path] == new[path],
                 "sha256": {version: hashlib.sha256(source[version][path].encode()).hexdigest()
                            for version in roots}} for path in identical_paths]
    output = {
        "method": "AST Call multiset comparison. Candidate operations require manual review. Literal domains include docs/examples and do not prove network use.",
        "python_file_counts": {version: len(files) for version, files in source.items()},
        "change_counts": dict(collections.Counter(x["status"] for x in changes)),
        "syntax_errors": errors,
        "invalid_url_literals": invalid_urls,
        "sensitive_call_delta": records,
        "new_literal_domains": {host: domains["1.100.0"][host] for host in sorted(domains["1.100.0"].keys() - domains["1.99.0"].keys())},
        "selected_file_identity": identity,
        "changed_python_files": changes,
    }
    output_root.mkdir(parents=True, exist_ok=True)
    (output_root / "runtime-scan.json").write_text(json.dumps(output, indent=2) + "\n")
    print(json.dumps({"files": output["python_file_counts"], "changes": output["change_counts"],
                      "syntax_errors": errors, "candidate_calls": len(records),
                      "new_literal_domains": list(output["new_literal_domains"])}))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("source_root", type=Path)
    parser.add_argument("output_root", type=Path)
    args = parser.parse_args()
    scan(args.source_root, args.output_root)
