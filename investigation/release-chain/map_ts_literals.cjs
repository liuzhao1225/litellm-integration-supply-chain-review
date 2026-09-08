const fs=require('node:fs'),path=require('node:path');
const acorn=require('/opt/homebrew/lib/node_modules/@google/gemini-cli/node_modules/acorn/dist/acorn.js');
const out=__dirname,files=JSON.parse(fs.readFileSync(path.join(out,'ts-source-inventory.json'),'utf8')).map(f=>({...f,text:fs.readFileSync(path.join(out,f.local_file),'utf8')}));
function textNormalized(text){const parts=[],positions=[];const entities={'&apos;':"'",'&quot;':'"','&amp;':'&','&lt;':'<','&gt;':'>'};for(const m of text.matchAll(/&(?:apos|quot|amp|lt|gt);|\s+|./gs)){const v=entities[m[0]]??(/^\s/.test(m[0])?' ':m[0]);parts.push(v);for(let k=0;k<v.length;k++)positions.push(m.index);}return {text:parts.join(''),positions};}
for(const f of files)f.normalized=textNormalized(f.text);
function strings(code){const values=new Map(),ast=acorn.parseExpressionAt(code,0,{ecmaVersion:'latest'});function walk(n){if(!n||typeof n!=='object')return;if(n.type==='Literal'&&typeof n.value==='string'){const arr=values.get(n.value)||[];arr.push(n.start);values.set(n.value,arr);}for(const v of Object.values(n)){if(Array.isArray(v))v.forEach(walk);else if(v&&typeof v==='object')walk(v);}}walk(ast);return values;}
const result=[];
for(const key of ['602869','664307','366321']){
 const get=s=>strings(fs.readFileSync(path.join(out,'js-module-diffs',key+'.'+s+'.txt'),'utf8'));
 const g=get('git'),w=get('wheel'),added=[...w.keys()].filter(x=>!g.has(x)),removed=[...g.keys()].filter(x=>!w.has(x));
 const mapped=added.map(value=>{const matches=[];for(const f of files){let idx=f.text.indexOf(value),method='exact_substring';if(idx<0){const ni=f.normalized.text.indexOf(textNormalized(value).text.trim());if(ni>=0){idx=f.normalized.positions[ni];method='whitespace_and_HTML_entities';}}if(idx>=0)matches.push({path:f.path,line:f.text.slice(0,idx).split('\n').length,git_blob_sha1:f.git_blob_sha1,method});}return {value,wheel_offsets:w.get(value),matches};});
 result.push({module_id:key,added_literal_values:mapped,removed_literal_values:removed,mapped_values:mapped.filter(x=>x.matches.length).length,total_added_values:added.length});
}
fs.writeFileSync(path.join(out,'ts-literal-mapping.json'),JSON.stringify({checked_at_utc:new Date().toISOString(),scope:'Decoded JavaScript string literal substring matches in fixed Git TS/TSX, with explicitly labeled whitespace/HTML-entity normalization when needed; not behavioral equivalence.',modules:result},null,2));
console.log(JSON.stringify(result.map(x=>({module_id:x.module_id,total:x.total_added_values,mapped:x.mapped_values,unmatched:x.added_literal_values.filter(y=>!y.matches.length).map(y=>y.value),removed:x.removed_literal_values})),null,2));
