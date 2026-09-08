const fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
const acorn=require('/opt/homebrew/lib/node_modules/@google/gemini-cli/node_modules/acorn/dist/acorn.js');
const {normalize}=require('./normalize_js_bindings.cjs'),out=__dirname;
const clean=n=>Array.isArray(n)?n.map(clean):n&&typeof n==='object'?Object.fromEntries(Object.entries(n).filter(([k])=>!['start','end','raw'].includes(k)).map(([k,v])=>[k,clean(v)])):n;
const hash=x=>crypto.createHash('sha256').update(JSON.stringify(x)).digest('hex');
const parse=f=>clean(acorn.parseExpressionAt(fs.readFileSync(path.join(out,'js-module-diffs',f),'utf8'),0,{ecmaVersion:'latest'}));
const previous=JSON.parse(fs.readFileSync(path.join(out,'js-binding-comparison.json'),'utf8')).results,results=[];
function imports(ast){const ids=[];function walk(n){if(!n||typeof n!=='object')return;if(n.type==='CallExpression'&&n.callee.type==='MemberExpression'&&n.callee.property.name==='i'&&typeof n.arguments[0]?.value==='number')ids.push(n.arguments[0].value);for(const v of Object.values(n)){if(Array.isArray(v))v.forEach(walk);else if(v&&typeof v==='object')walk(v);}}walk(ast);return ids;}
for(const r of previous.filter(r=>r.structurally_equal)){
 const g=parse(r.key+'.git.txt'),w=parse(r.key+'.wheel.txt');const gh=hash(normalize(g,false)),wh=hash(normalize(w,false));const gi=imports(g),wi=imports(w);
 results.push({key:r.key,git_alpha_only_sha256:gh,wheel_alpha_only_sha256:wh,alpha_only_equal:gh===wh,git_import_sequence:gi,wheel_import_sequence:wi,import_sequence_equal:JSON.stringify(gi)===JSON.stringify(wi)});
}
for(const r of previous.filter(r=>r.variants)){
 const variants=r.variants.map(v=>({side:v.side,original_sha256:v.raw_ast_sha256,alpha_only_sha256:hash(normalize(parse(r.key+'.'+v.side+'.'+v.raw_ast_sha256.slice(0,12)+'.txt'),false))}));
 results.push({key:r.key,variants,alpha_only_equal:new Set(variants.map(x=>x.alpha_only_sha256)).size===1});
}
const result={checked_at_utc:new Date().toISOString(),normalization:'Only lexical bindings and shorthand metadata. No import sorting or statement reordering.',results};
fs.writeFileSync(path.join(out,'js-alpha-only-comparison.json'),JSON.stringify(result,null,2));
console.log(JSON.stringify(results.map(x=>({key:x.key,equal:x.alpha_only_equal,import_sequence_equal:x.import_sequence_equal})),null,2));
