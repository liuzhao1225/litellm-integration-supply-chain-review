const fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
const acorn=require('/opt/homebrew/lib/node_modules/@google/gemini-cli/node_modules/acorn/dist/acorn.js');
const out=__dirname,parse=s=>acorn.parseExpressionAt(s,0,{ecmaVersion:'latest'});
const binding=JSON.parse(fs.readFileSync(path.join(out,'js-binding-comparison.json'),'utf8')).results.filter(r=>r.structurally_equal);
const orders=[],targets=new Set();
function visitAll(n,fn){if(!n||typeof n!=='object')return;fn(n);for(const v of Object.values(n)){if(Array.isArray(v))v.forEach(x=>visitAll(x,fn));else if(v&&typeof v==='object')visitAll(v,fn);}}
function imports(ast){const groups=[];visitAll(ast,n=>{if(n.type==='VariableDeclaration'&&n.declarations.length>1&&n.declarations.every(d=>d.init?.type==='CallExpression'&&d.init.callee.type==='MemberExpression'&&d.init.callee.property.name==='i'&&typeof d.init.arguments[0]?.value==='number'))groups.push(n.declarations.map(d=>d.init.arguments[0].value));});return groups;}
for(const r of binding){
 const get=s=>imports(parse(fs.readFileSync(path.join(out,'js-module-diffs',r.key+'.'+s+'.txt'),'utf8')));
 const g=get('git'),w=get('wheel');if(g.length!==w.length)throw Error('group count changed '+r.key);
 for(let i=0;i<g.length;i++)if(JSON.stringify(g[i])!==JSON.stringify(w[i])){
  const reversed=[];for(let a=0;a<g[i].length;a++)for(let b=a+1;b<g[i].length;b++)if(w[i].indexOf(g[i][a])>w[i].indexOf(g[i][b])){reversed.push([g[i][a],g[i][b]]);targets.add(g[i][a]);targets.add(g[i][b]);}
  orders.push({module_group:r.key,git_order:g[i],wheel_order:w[i],reversed_pairs:reversed});
 }
}
const found=new Map(),inputs=JSON.parse(fs.readFileSync(path.join(out,'js-input-inventory.json'),'utf8'));
for(const f of inputs){
 const text=fs.readFileSync(path.join(out,f.local_file),'utf8'),ast=acorn.parse(text,{ecmaVersion:'latest',sourceType:'script'});
 visitAll(ast,n=>{
  if(n.type!=='CallExpression'||n.callee.type!=='MemberExpression'||n.callee.property.name!=='push'||n.arguments[0]?.type!=='ArrayExpression')return;
  let ids=[];
  for(const e of n.arguments[0].elements.slice(1)){
   if(e?.type==='Literal'&&typeof e.value==='number'){ids.push(e.value);continue;}
   if(e?.type==='ArrowFunctionExpression'){
    for(const id of ids.filter(x=>targets.has(x))){const code=text.slice(e.start,e.end),sha=crypto.createHash('sha256').update(code).digest('hex');const variants=found.get(id)||new Map();if(!variants.has(sha))variants.set(sha,{id,sha256:sha,member:f.member,code,ast:e});found.set(id,variants);}
   }
   ids=[];
  }
 });
}
const effects=[];fs.mkdirSync(path.join(out,'import-targets'),{recursive:true});
for(const id of [...targets].sort((a,b)=>a-b)){
 const variants=found.get(id);if(!variants){effects.push({id,error:'module not located in static chunk inputs'});continue;}
 for(const m of variants.values()){
  const local='import-targets/'+id+'.'+m.sha256.slice(0,12)+'.txt';fs.writeFileSync(path.join(out,local),m.code);
  // Reparse to obtain coordinates relative to the retained module text.
  const ast=parse(m.code),calls=[],assignments=[];
  function walk(n,parent,key){
   if(!n||typeof n!=='object')return;
   if(['FunctionDeclaration','FunctionExpression','ArrowFunctionExpression'].includes(n.type))return;
   if(n.type==='PropertyDefinition'&&!n.static)return;
   if(n.type==='CallExpression'||n.type==='NewExpression'){
    calls.push({kind:n.type,callee:m.code.slice(n.callee.start,n.callee.end).slice(0,150),offset:n.start,excerpt:m.code.slice(n.start,n.end).slice(0,350)});
    if(['FunctionExpression','ArrowFunctionExpression'].includes(n.callee.type))walk(n.callee.body,n.callee,'body');
   }
   if(n.type==='AssignmentExpression')assignments.push({offset:n.start,excerpt:m.code.slice(n.start,n.end).slice(0,350)});
   for(const[k,v]of Object.entries(n)){if(Array.isArray(v))v.forEach(x=>walk(x,n,k));else if(v&&typeof v==='object')walk(v,n,k);}
  }
  walk(ast.body,ast,'body');
  effects.push({id,sha256:m.sha256,member:m.member,source_file:local,top_level_calls:calls,top_level_assignments:assignments});
 }
}
const result={checked_at_utc:new Date().toISOString(),orders,affected_target_ids:[...targets].sort((a,b)=>a-b),targets:effects,limitations:'Lexical eager-expression scan; ordinary called functions may have further side effects. Function declarations/callback bodies skipped; direct IIFE bodies inspected. No input evaluation.'};
fs.writeFileSync(path.join(out,'import-order-effects.json'),JSON.stringify(result,null,2));
console.log(JSON.stringify({orders:orders.length,affected_targets:targets.size,missing:effects.filter(x=>x.error),targets:effects.map(x=>({id:x.id,calls:x.top_level_calls?.map(y=>y.callee),assignments:x.top_level_assignments?.length}))},null,2));
