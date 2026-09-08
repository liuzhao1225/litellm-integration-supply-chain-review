// Conservative lexical alpha-normalization of parsed ASTs. This does not run the input.
// Equality is only a structural result after the documented import-declarator reordering.
const fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
const dir=__dirname;
const hash=x=>crypto.createHash('sha256').update(JSON.stringify(x)).digest('hex');
function normalize(root,sortImports=true){
 const ast=JSON.parse(JSON.stringify(root)), scopes=new WeakMap();let seq=0;
 const make=(parent,kind)=>({id:seq++,parent,kind,bindings:new Map()});
 const top=make(null,'function');
 function define(s,n){if(!s.bindings.has(n))s.bindings.set(n,`s${s.id}b${s.bindings.size}`);}
 function pattern(p,s){if(!p)return;if(p.type==='Identifier')define(s,p.name);else if(p.type==='RestElement')pattern(p.argument,s);else if(p.type==='AssignmentPattern')pattern(p.left,s);else if(p.type==='ArrayPattern')p.elements.forEach(x=>pattern(x,s));else if(p.type==='ObjectPattern')p.properties.forEach(x=>pattern(x.type==='RestElement'?x.argument:x.value,s));else throw Error('unsupported pattern '+p.type);}
 function children(n,fn){for(const[k,v]of Object.entries(n)){if(Array.isArray(v))v.forEach(x=>{if(x&&typeof x==='object'&&x.type)fn(x,k);});else if(v&&typeof v==='object'&&v.type)fn(v,k);}}
 function visit(n,s){
   // All-import declarations: sort only module loader e.i(<numeric id>) initializers.
   if(sortImports&&n.type==='VariableDeclaration'&&n.declarations.length>1&&n.declarations.every(d=>d.id.type==='Identifier'&&d.init?.type==='CallExpression'&&d.init.callee.type==='MemberExpression'&&d.init.callee.property.name==='i'&&d.init.arguments.length===1&&typeof d.init.arguments[0].value==='number'))n.declarations.sort((a,b)=>a.init.arguments[0].value-b.init.arguments[0].value);
   if(['FunctionDeclaration','FunctionExpression','ArrowFunctionExpression'].includes(n.type)){
     if(n.type==='FunctionDeclaration'&&n.id)define(s,n.id.name);
     const f=make(s,'function');scopes.set(n,f);if(n.type==='FunctionExpression'&&n.id)define(f,n.id.name);n.params.forEach(p=>pattern(p,f));
     if(n.id)scopes.set(n.id,n.type==='FunctionDeclaration'?s:f);
     n.params.forEach(p=>visit(p,f));visit(n.body,f);return;
   }
   if(n.type==='BlockStatement'||n.type==='CatchClause')s=make(s,'block');
   scopes.set(n,s);
   if(n.type==='CatchClause'&&n.param)pattern(n.param,s);
   if(n.type==='VariableDeclaration'){
     let target=s;if(n.kind==='var')while(target.kind!=='function')target=target.parent;
     n.declarations.forEach(d=>pattern(d.id,target));
   }
   if(n.type==='ClassDeclaration'&&n.id)define(s,n.id.name);
   if(['ClassExpression','ImportDeclaration','LabeledStatement','WithStatement'].includes(n.type))throw Error('unsupported construct '+n.type);
   children(n,c=>visit(c,s));
 }
 visit(ast,top);
 function resolve(s,name){while(s){if(s.bindings.has(name))return s.bindings.get(name);s=s.parent;}return 'global:'+name;}
 function output(n,parent,key){
   if(n.type==='Identifier'){
     const fixed=(parent?.type==='MemberExpression'&&key==='property'&&!parent.computed)||(['Property','MethodDefinition','PropertyDefinition'].includes(parent?.type)&&key==='key'&&!parent.computed);
     return {type:n.type,name:fixed?n.name:resolve(scopes.get(n),n.name)};
   }
   const r={};for(const[k,v]of Object.entries(n)){
     if(k==='shorthand')continue;
     if(Array.isArray(v))r[k]=v.map(x=>x&&typeof x==='object'&&x.type?output(x,n,k):x);
     else if(v&&typeof v==='object'&&v.type)r[k]=output(v,n,k);else r[k]=v;
   }return r;
 }
 return output(ast,null,null);
}
module.exports={normalize};
if(require.main===module){
const comp=JSON.parse(fs.readFileSync(path.join(dir,'js-module-comparison.json'),'utf8')),results=[];
for(const rec of comp.changed){
 const row={key:rec.key};
 try{
  const get=side=>normalize(JSON.parse(fs.readFileSync(path.join(dir,'js-module-diffs',rec.key+'.'+side+'.ast.json'),'utf8')));
  const g=get('git'),w=get('wheel');row.git_normalized_sha256=hash(g);row.wheel_normalized_sha256=hash(w);row.structurally_equal=row.git_normalized_sha256===row.wheel_normalized_sha256;
  fs.writeFileSync(path.join(dir,'js-module-diffs',rec.key+'.git.normalized.json'),JSON.stringify(g,null,2));fs.writeFileSync(path.join(dir,'js-module-diffs',rec.key+'.wheel.normalized.json'),JSON.stringify(w,null,2));
 }catch(error){row.error=error.message;}
 results.push(row);
}
for(const group of comp.unpaired_variants){
  const variants=[];
  for(const side of ['git','wheel'])for(const v of group[side+'_variants']){
    const input=path.join(dir,'js-module-diffs',group.key+'.'+side+'.'+v.hash.slice(0,12)+'.ast.json');
    variants.push({side,raw_ast_sha256:v.hash,normalized_sha256:hash(normalize(JSON.parse(fs.readFileSync(input,'utf8')))),files:v.files});
  }
  results.push({key:group.key,variants});
}
fs.writeFileSync(path.join(dir,'js-binding-comparison.json'),JSON.stringify({checked_at_utc:new Date().toISOString(),normalization:'Lexical binding identifiers; strip shorthand metadata; sort all-import e.i(number) declarations. Import reordering is recorded, not proved side-effect-free.',results},null,2));
console.log(JSON.stringify(results,null,2));
}
