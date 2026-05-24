(: ─────────────────────────────────────────────────────────────
   Q5 — Membres d'une catégorie (triés alphabétiquement)
   ───────────────────────────────────────────────────────────── :)
let $categorie := "Intelligence Artificielle"
(: Charger le document et trouver l'id de la catégorie demandée :)
let $doc := doc('../club.xml')
let $idCat := string($doc//categorie[@libelle = $categorie]/@id)
return
<membres categorie="{$categorie}">{
  (: Filtrer les membres de cette catégorie, tri alphabétique :)
  for $m in $doc//membre[@categorieRef = $idCat]
  order by $m/nom/text() ascending, $m/prenom/text() ascending
  return
    <membre id="{$m/@id}">
      <nomComplet>{$m/prenom/text()} {$m/nom/text()}</nomComplet>
      <email>{$m/email/text()}</email>
    </membre>
}</membres>
