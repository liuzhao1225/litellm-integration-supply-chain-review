const fs=require('node:fs'),path=require('node:path'),crypto=require('node:crypto');
const {normalize}=require('./normalize_js_bindings.cjs');
const dir=__dirname,hash=x=>crypto.createHash('sha256').update(JSON.stringify(x)).digest('hex');
const g=JSON.parse(fs.readFileSync(path.join(dir,'js-module-diffs/602869.git.ast.json'),'utf8'));
const w=JSON.parse(fs.readFileSync(path.join(dir,'js-module-diffs/602869.wheel.ast.json'),'utf8'));
function exportsOf(ast){
 const matches=ast.body.body.filter(s=>s.type==='ExpressionStatement'&&s.expression.type==='CallExpression'&&s.expression.callee.type==='MemberExpression'&&s.expression.callee.property.name==='s');
 if(matches.length!==1)throw Error('expected one export declaration');
 const values=matches[0].expression.arguments[0].elements,map={};
 for(let i=0;i<values.length;i+=2){
  const key=values[i],value=values[i+1];
  if(key.type!=='Literal'||value.type!=='ArrowFunctionExpression'||value.body.type!=='Identifier')throw Error('unexpected export entry');
  map[key.value]=value.body.name;
 }
 return {values,map};
}
const gx=exportsOf(g),wx=exportsOf(w),added=Object.keys(wx.map).filter(x=>!(x in gx.map)),removed=Object.keys(gx.map).filter(x=>!(x in wx.map));
if(JSON.stringify(added)!=='["importMCPServers"]'||removed.length)throw Error('unexpected export delta');
const name=wx.map.importMCPServers;
const declarations=w.body.body.filter(s=>s.type==='VariableDeclaration');
const definitions=declarations.flatMap(s=>s.declarations).filter(d=>d.id?.name===name);
if(definitions.length!==1||definitions[0].init?.type!=='ArrowFunctionExpression')throw Error('expected one added arrow-function binding');
const functionAst=definitions[0];
for(const s of declarations)s.declarations=s.declarations.filter(d=>d!==functionAst);
const index=wx.values.findIndex(x=>x.type==='Literal'&&x.value==='importMCPServers');wx.values.splice(index,2);
const result={checked_at_utc:new Date().toISOString(),module_id:602869,added_exports:added,removed_exports:removed,added_function_ast:functionAst,git_without_feature_sha256:hash(normalize(g)),wheel_without_feature_sha256:hash(normalize(w))};
result.remainder_structurally_equal=result.git_without_feature_sha256===result.wheel_without_feature_sha256;
fs.writeFileSync(path.join(dir,'mcp-wrapper-isolation.json'),JSON.stringify(result,null,2));
console.log(JSON.stringify({added_exports:added,removed_exports:removed,remainder_structurally_equal:result.remainder_structurally_equal,functionAst},null,2));
