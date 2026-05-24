<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Club Info_Tech — Système de Gestion</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=DM+Sans:wght@400;500&display=swap" rel="stylesheet"/>
<link rel="stylesheet" href="style.css">
</head>
<body>

<nav>
  <div class="logo">Info_Tech</div>
  <div class="tabs">
    <button class="tab on" onclick="go('dash',this)">Dashboard</button>
    <button class="tab" onclick="go('membres',this)">Membres</button>
    <button class="tab" onclick="go('concours',this)">Concours</button>
    <button class="tab" onclick="go('queries',this)">XQuery</button>
  </div>
</nav>

<main>
<div class="page on" id="p-dash">
  <div class="hero"><h1>Club Info_Tech</h1><p>Système de gestion — Université de Skikda</p></div>
  <div class="stats">
    <div class="sc"><div class="v">4</div><div class="l">Catégories</div></div>
    <div class="sc"><div class="v">12</div><div class="l">Membres</div></div>
    <div class="sc"><div class="v">4</div><div class="l">Concours</div></div>
    <div class="sc"><div class="v">12</div><div class="l">Participations</div></div>
  </div>
  <div class="sec">Vainqueurs</div>
  <div class="wgrid">
    <div class="wc"><span class="crown">🏆</span><div class="wc-t">Concours IA · Mars 2025</div><div class="wc-n">Ahmed Benali</div><div class="wc-s">307.5 pts · Coef 1.5</div></div>
    <div class="wc"><span class="crown">🏆</span><div class="wc-t">Hackathon Web · Avril 2025</div><div class="wc-n">Karim Aouadi</div><div class="wc-s">378.0 pts · Coef 1.2</div></div>
    <div class="wc"><span class="crown">🏆</span><div class="wc-t">CTF Sécurité · Mai 2025</div><div class="wc-n">Rami Boudia</div><div class="wc-s">790.0 pts · Coef 2.0</div></div>
    <div class="wc"><span class="crown">🏆</span><div class="wc-t">Défi Réseaux · Juin 2025</div><div class="wc-n">Reda Mansouri</div><div class="wc-s">421.2 pts · Coef 1.8</div></div>
  </div>
  <div class="sec">Tous les scores</div>
  <div class="tbl-w"><table>
    <thead><tr><th>Membre</th><th>Concours</th><th>Score</th></tr></thead>
    <tbody id="stb"></tbody>
  </table></div>
</div>

<div class="page" id="p-membres">
  <div class="sec" style="margin-top:0">Membres</div>
  <div class="fb">
    <button class="on" onclick="filt('all',this)">Tous</button>
    <button onclick="filt('C1',this)">IA</button>
    <button onclick="filt('C2',this)">Web</button>
    <button onclick="filt('C3',this)">Sécurité</button>
    <button onclick="filt('C4',this)">Réseaux</button>
  </div>
  <div class="tbl-w"><table>
    <thead><tr><th>ID</th><th>Nom</th><th>Email</th><th>Catégorie</th></tr></thead>
    <tbody id="mtb"></tbody>
  </table></div>
</div>

<div class="page" id="p-concours">
  <div class="sec" style="margin-top:0">Concours</div>
  <div id="cl"></div>
</div>

<div class="page" id="p-queries">
  <div class="sec" style="margin-top:0">Requêtes XQuery</div>
  <div id="ql"></div>
</div>
</main>

<script src="script.js"></script>
</body>
</html>
