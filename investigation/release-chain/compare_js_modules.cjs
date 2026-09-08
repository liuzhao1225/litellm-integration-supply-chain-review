// Parse supplied JavaScript as data with an already-installed parser. Never evaluate it.
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const acorn = require('/opt/homebrew/lib/node_modules/@google/gemini-cli/node_modules/acorn/dist/acorn.js');
const out = __dirname;
const source = '/tmp/litellm-version-research-20260909';
const pairs = JSON.parse(fs.readFileSync(path.join(source, 'frontend-chunk-comparison.json'), 'utf8'))
  .filter(x => !x.normalized_chunk_names_equal);
const hash = s => crypto.createHash('sha256').update(s).digest('hex');
const clean = obj => {
  if (Array.isArray(obj)) return obj.map(clean);
  if (!obj || typeof obj !== 'object') return typeof obj === 'bigint' ? `${obj}n` : obj;
  return Object.fromEntries(Object.entries(obj).filter(([k]) => !['start','end','raw'].includes(k)).map(([k,v])=>[k,clean(v)]));
};
fs.mkdirSync(path.join(out, 'js-module-diffs'), {recursive:true});
function collect(side) {
  const mods = new Map();
  for (const pair of pairs) {
    const filename = path.basename(pair[side + '_path']) + (side === 'wheel' ? '.wheel.txt' : '');
    const text = fs.readFileSync(path.join(source, 'frontend-git', filename), 'utf8');
    const ast = acorn.parse(text, {ecmaVersion:'latest', sourceType:'script'});
    if (ast.body.length !== 1 || ast.body[0].expression?.type !== 'CallExpression') throw Error('unexpected wrapper '+filename);
    const call = ast.body[0].expression;
    if (call.callee.property?.name !== 'push' || call.arguments.length !== 1 || call.arguments[0].type !== 'ArrayExpression') throw Error('unexpected registration '+filename);
    const entries = call.arguments[0].elements;
    let ids = [];
    for (const node of entries.slice(1)) {
      if (node.type === 'Literal' && typeof node.value === 'number') {ids.push(node.value); continue;}
      if (node.type !== 'ArrowFunctionExpression' || !ids.length) throw Error('unexpected module '+filename);
      const key = [...ids].sort((a,b)=>a-b).join(',');
      const code = text.slice(node.start,node.end), normalized = clean(node);
      const astHash=hash(JSON.stringify(normalized));
      const variants=mods.get(key) || new Map();
      const existing=variants.get(astHash);
      if(existing) existing.occurrences.push(filename);
      else variants.set(astHash, {ids, key, filename, occurrences:[filename], source_sha256:hash(code), ast_sha256:astHash, code, ast:normalized});
      mods.set(key,variants);
      ids=[];
    }
    if(ids.length)throw Error('unbound ids '+filename);
  }
  return mods;
}
const git=collect('git'), wheel=collect('wheel');
const result={checked_at_utc:new Date().toISOString(),parser:'acorn '+acorn.version,git_modules:git.size,wheel_modules:wheel.size,unchanged:[],changed:[],added:[],removed:[],unpaired_variants:[]};
for(const [key,gv] of git) {
  const wv=wheel.get(key);
  if(!wv){result.removed.push({key,filenames:[...gv.values()].flatMap(x=>x.occurrences)});continue;}
  for(const [h,g] of gv)if(wv.has(h))result.unchanged.push({key,ast_sha256:h,git_files:g.occurrences,wheel_files:wv.get(h).occurrences});
  const grest=[...gv.values()].filter(g=>!wv.has(g.ast_sha256));
  const wrest=[...wv.values()].filter(w=>!gv.has(w.ast_sha256));
  if(grest.length===0 && wrest.length===0)continue;
  if(grest.length!==1 || wrest.length!==1){
    const variants={key,git_variants:[...gv.values()].map(x=>({hash:x.ast_sha256,files:x.occurrences})),wheel_variants:[...wv.values()].map(x=>({hash:x.ast_sha256,files:x.occurrences}))};
    result.unpaired_variants.push(variants);
    for(const [side,ms] of [['git',gv],['wheel',wv]])for(const m of ms.values()){
      fs.writeFileSync(path.join(out,'js-module-diffs',key+'.'+side+'.'+m.ast_sha256.slice(0,12)+'.txt'),m.code);
      fs.writeFileSync(path.join(out,'js-module-diffs',key+'.'+side+'.'+m.ast_sha256.slice(0,12)+'.ast.json'),JSON.stringify(m.ast,null,2));
    }
    continue;
  }
  const g=grest[0],w=wrest[0];
  const record={key,git_file:g.filename,wheel_file:w.filename,git_ast_sha256:g.ast_sha256,wheel_ast_sha256:w.ast_sha256,git_source_sha256:g.source_sha256,wheel_source_sha256:w.source_sha256};
  if(g.ast_sha256===w.ast_sha256){result.unchanged.push(record);continue;}
  result.changed.push(record);
  for(const [side,m] of [['git',g],['wheel',w]]) {
    fs.writeFileSync(path.join(out,'js-module-diffs',key+'.'+side+'.txt'),m.code);
    fs.writeFileSync(path.join(out,'js-module-diffs',key+'.'+side+'.ast.json'),JSON.stringify(m.ast,null,2));
  }
}
for(const [key,wv] of wheel)if(!git.has(key)) for(const w of wv.values()) {
  result.added.push({key,filename:w.filename,source_sha256:w.source_sha256,ast_sha256:w.ast_sha256});
  fs.writeFileSync(path.join(out,'js-module-diffs',key+'.wheel.txt'),w.code);
  fs.writeFileSync(path.join(out,'js-module-diffs',key+'.wheel.ast.json'),JSON.stringify(w.ast,null,2));
}
fs.writeFileSync(path.join(out,'js-module-comparison.json'),JSON.stringify(result,null,2));
fs.writeFileSync(path.join(out,'js-module-inventory.json'),JSON.stringify(Object.fromEntries([['git',git],['wheel',wheel]].map(([side,ms])=>[side,[...ms.values()].flatMap(v=>[...v.values()].map(m=>({key:m.key,ast_sha256:m.ast_sha256,source_sha256:m.source_sha256,files:m.occurrences})))])),null,2));
console.log(JSON.stringify({git_modules:git.size,wheel_modules:wheel.size,unchanged:result.unchanged.length,changed:result.changed.map(x=>x.key),added:result.added,removed:result.removed,unpaired_variants:result.unpaired_variants},null,2));
