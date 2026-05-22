(: ════════════════════════════════════════════════════════════
   fichier  : updates.xq
   usage    : BaseX GUI > New Query > Run (F5)
              IMPORTANT : BaseX doit avoir club.xml ouvert en base
              Commande  : basex -u -i club.xml updates.xq
   ════════════════════════════════════════════════════════════ :)


(: ─────────────────────────────────────────────────────────────
   UPDATE 1 — INSERTION
   Ajouter un nouveau membre (M013) dans la catégorie C2 (Web)
   ───────────────────────────────────────────────────────────── :)
(: INSERTION :)
insert node
  <membre id="M013" categorieRef="C2">
    <nom>Bensalem</nom>
    <prenom>Houssem</prenom>
    <email>h.bensalem@club.dz</email>
  </membre>
into doc("club.xml")//membres,


(: ─────────────────────────────────────────────────────────────
   UPDATE 2 — MODIFICATION
   Modifier le coefficient du concours CO2 : 1.2 → 2.0
   ───────────────────────────────────────────────────────────── :)
(: MODIFICATION :)
replace value of node
  doc("club.xml")//concours[@id="CO2"]/@coefficient
with "2.0",


(: ─────────────────────────────────────────────────────────────
   UPDATE 3 — SUPPRESSION
   Supprimer le participant M003 du concours CO1
   ───────────────────────────────────────────────────────────── :)
(: SUPPRESSION :)
delete node
  doc("club.xml")//concours[@id="CO1"]//participant[@membreRef="M003"]
