const D={
  cats:{C1:{l:"Intelligence Artificielle",b:"b1"},C2:{l:"Développement Web",b:"b2"},C3:{l:"Sécurité Informatique",b:"b3"},C4:{l:"Réseaux et Systèmes",b:"b4"}},
  membres:[
    {id:"M001",cat:"C1",nom:"Benali",prenom:"Ahmed",email:"a.benali@club.dz"},
    {id:"M002",cat:"C1",nom:"Hamidi",prenom:"Nour",email:"n.hamidi@club.dz"},
    {id:"M003",cat:"C1",nom:"Meziane",prenom:"Walid",email:"w.meziane@club.dz"},
    {id:"M004",cat:"C2",nom:"Khelif",prenom:"Sara",email:"s.khelif@club.dz"},
    {id:"M005",cat:"C2",nom:"Zerrouk",prenom:"Lyna",email:"l.zerrouk@club.dz"},
    {id:"M006",cat:"C2",nom:"Aouadi",prenom:"Karim",email:"k.aouadi@club.dz"},
    {id:"M007",cat:"C3",nom:"Boudia",prenom:"Rami",email:"r.boudia@club.dz"},
    {id:"M008",cat:"C3",nom:"Salhi",prenom:"Amine",email:"a.salhi@club.dz"},
    {id:"M011",cat:"C3",nom:"Cherif",prenom:"Imane",email:"i.cherif@club.dz"},
    {id:"M009",cat:"C4",nom:"Ferhat",prenom:"Dalia",email:"d.ferhat@club.dz"},
    {id:"M010",cat:"C4",nom:"Boudjenane",prenom:"Yacine",email:"y.boudjenane@club.dz"},
    {id:"M012",cat:"C4",nom:"Mansouri",prenom:"Reda",email:"r.mansouri@club.dz"}
  ],
  concours:[
    {id:"CO1",cat:"C1",date:"2025-03-15",coef:1.5,titre:"Concours IA — Printemps 2025",parts:[{r:"M001",c:85,t:120},{r:"M002",c:72,t:95},{r:"M003",c:90,t:110}]},
    {id:"CO2",cat:"C2",date:"2025-04-20",coef:1.2,titre:"Hackathon Web — Avril 2025",parts:[{r:"M004",c:78,t:200},{r:"M005",c:88,t:180},{r:"M006",c:65,t:250}]},
    {id:"CO3",cat:"C3",date:"2025-05-10",coef:2.0,titre:"CTF Sécurité — Mai 2025",parts:[{r:"M007",c:95,t:300},{r:"M008",c:80,t:280},{r:"M011",c:88,t:260}]},
    {id:"CO4",cat:"C4",date:"2025-06-05",coef:1.8,titre:"Défi Réseaux — Juin 2025",parts:[{r:"M009",c:70,t:150},{r:"M010",c:82,t:130},{r:"M012",c:77,t:160}]}
  ]
};
const gm=r=>D.membres.find(m=>m.id===r);
const sc=(p,coef)=>Math.round((p.c+p.t)*coef*100)/100;
const MAX=800;
const bd=c=>`<span class="badge ${D.cats[c].b}">${D.cats[c].l}</span>`;

function buildScores(){
  let r='';
  D.concours.forEach(co=>{
    const mx=Math.max(...co.parts.map(p=>sc(p,co.coef)));
    co.parts.forEach(p=>{
      const m=gm(p.r);const s=sc(p,co.coef);const pct=Math.round(s/MAX*100);
      r+=`<tr><td>${s===mx?'🏆 ':''}${m.prenom} ${m.nom}</td><td style="color:var(--muted);font-size:0.75rem">${co.titre}</td>
      <td><div class="bar-w"><div class="bg"><div class="bf" style="width:${pct}%"></div></div><span class="sn">${s}</span></div></td></tr>`;
    });
  });
  document.getElementById('stb').innerHTML=r;
}

function buildMembres(f='all'){
  const list=f==='all'?D.membres:D.membres.filter(m=>m.cat===f).sort((a,b)=>a.nom.localeCompare(b.nom));
  document.getElementById('mtb').innerHTML=list.map(m=>`<tr>
    <td style="font-family:monospace;color:var(--muted);font-size:0.75rem">${m.id}</td>
    <td>${m.prenom} ${m.nom}</td>
    <td style="color:var(--muted);font-size:0.78rem">${m.email}</td>
    <td>${bd(m.cat)}</td></tr>`).join('');
}

function filt(cat,btn){
  document.querySelectorAll('.fb button').forEach(b=>b.classList.remove('on'));
  btn.classList.add('on');buildMembres(cat);
}

function buildConcours(){
  const cl=document.getElementById('cl');
  cl.innerHTML=[...D.concours].sort((a,b)=>new Date(a.date)-new Date(b.date)).map(co=>{
    const mx=Math.max(...co.parts.map(p=>sc(p,co.coef)));
    const parts=co.parts.map(p=>{
      const m=gm(p.r);const s=sc(p,co.coef);const pct=Math.round(s/MAX*100);
      return `<div class="pr"><span class="pn">${s===mx?'🏆 ':''}${m.prenom} ${m.nom}</span>
        <div class="bar-w" style="flex:1"><div class="bg"><div class="bf" style="width:${pct}%"></div></div>
        <span class="sn">${s}</span></div></div>`;
    }).join('');
    return `<div class="cc">
      <div class="ch"><div class="ct">${co.titre}</div>${bd(co.cat)}</div>
      <div class="cm"><span>📅 ${co.date}</span><span>⚡ Coef : ${co.coef}</span><span>👥 ${co.parts.length} participants</span></div>
      <div class="pl">${parts}</div></div>`;
  }).join('');
}

const QS=[
  {n:'Q1',l:'Liste membres avec catégories',
   c:`<span class="kw">for</span> $m <span class="kw">in</span> <span class="fn">//membre</span>\n<span class="kw">let</span> $cat := <span class="fn">//categorie</span>[@id = $m/@categorieRef]\n<span class="kw">return</span>\n  &lt;membre id="{$m/@id}"&gt;\n    &lt;nomComplet&gt;{$m/prenom} {$m/nom}&lt;/nomComplet&gt;\n    &lt;categorie&gt;{$cat/@libelle}&lt;/categorie&gt;\n  &lt;/membre&gt;`,
   r(){return D.membres.map(m=>`&lt;membre id="${m.id}"&gt; ${m.prenom} ${m.nom} — ${D.cats[m.cat].l} &lt;/membre&gt;`).join('\n')}} ,
  {n:'Q2',l:'Concours triés par date',
   c:`<span class="kw">for</span> $c <span class="kw">in</span> <span class="fn">//concours</span>[@id]\n<span class="kw">order by</span> xs:date($c/@date) ascending\n<span class="kw">return</span> &lt;concours&gt;{$c/titre} — {$c/@date}&lt;/concours&gt;`,
   r(){return [...D.concours].sort((a,b)=>new Date(a.date)-new Date(b.date)).map(c=>`&lt;concours&gt;${c.titre} — ${c.date}&lt;/concours&gt;`).join('\n')}},
  {n:'Q3',l:'Score = (complexite + tempsExec) × coef',
  c:`<span class="kw">let</span> $score := (xs:integer($p/complexite) +\n               xs:integer($p/tempsExecution)) * $coef`,
   r(){let r='';D.concours.forEach(co=>co.parts.forEach(p=>{r+=`&lt;score membre="${p.r}"&gt;${sc(p,co.coef)}&lt;/score&gt;\n`; })); return r.trim();}},
  {n:'Q4',l:'Vainqueur de chaque concours',
   c:`<span class="kw">let</span> $maxScore := <span class="fn">max</span>($scores)\n<span class="kw">where</span> $score = $maxScore\n<span class="kw">return</span> &lt;vainqueur&gt;{$m/nom}&lt;/vainqueur&gt;`,
   r(){return D.concours.map(co=>{const mx=Math.max(...co.parts.map(p=>sc(p,co.coef)));const w=co.parts.filter(p=>sc(p,co.coef)===mx).map(p=>{const m=gm(p.r);return `${m.prenom} ${m.nom} (${mx} pts)`;}).join(', ');return `&lt;vainqueur concours="${co.titre}"&gt;${w}&lt;/vainqueur&gt;`;}).join('\n')}},
  {n:'Q5',l:"Membres d'une catégorie (ordre alphabétique)",
   c:`<span class="kw">let</span> $categorie := <span class="str">"Intelligence Artificielle"</span>\n<span class="kw">order by</span> $m/nom ascending`,
   r(){return D.membres.filter(m=>m.cat==='C1').sort((a,b)=>a.nom.localeCompare(b.nom)).map(m=>`&lt;membre&gt;${m.prenom} ${m.nom}&lt;/membre&gt;`).join('\n')}}
];

function buildQueries(){
  document.getElementById('ql').innerHTML=QS.map((q,i)=>`
    <div class="qc">
      <div class="qh"><div class="qn">${q.n}</div><div class="ql">${q.l}</div></div>
      <div class="qb"><div class="code">${q.c}</div>
      <button class="rb" onclick="run(${i})">▶ Exécuter</button>
      <div class="qr" id="qr${i}"></div></div></div>`).join('');
}

function run(i){const el=document.getElementById('qr'+i);el.style.display='block';el.innerHTML=QS[i].r();}

function go(name,btn){
  document.querySelectorAll('.page').forEach(p=>p.classList.remove('on'));
  document.querySelectorAll('.tab').forEach(t=>t.classList.remove('on'));
  document.getElementById('p-'+name).classList.add('on');btn.classList.add('on');
}

buildScores();buildMembres();buildConcours();buildQueries();
