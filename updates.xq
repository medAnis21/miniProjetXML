
(: ─────────────────────────────────────────────────────────────
   UPDATE 1 — INSERTION
   ───────────────────────────────────────────────────────────── :)
insert node
  <membre id="M013" categorieRef="C2">
    <nom>Bensalem</nom>
    <prenom>Houssem</prenom>
    <email>h.bensalem@club.dz</email>
  </membre>
into doc("club.xml")//membres,


(: ─────────────────────────────────────────────────────────────
   UPDATE 2 — MODIFICATION
   ───────────────────────────────────────────────────────────── :)
replace value of node
  doc("club.xml")//concours[@id="CO2"]/@coefficient
with "2.0",


(: ─────────────────────────────────────────────────────────────
   UPDATE 3 — SUPPRESSION
   ───────────────────────────────────────────────────────────── :)
delete node
  doc("club.xml")//concours[@id="CO1"]//participant[@membreRef="M003"]
