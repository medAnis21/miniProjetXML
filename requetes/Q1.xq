(: ─────────────────────────────────────────────────────────────
   Q1 — Liste complète des membres
   ───────────────────────────────────────────────────────────── :)
<membres>{
  (: Charger le document explicitement pour éviter un contexte indéfini :)
  let $doc := doc('../club.xml')
  (: Parcourir tous les membres :)
  for $m in $doc//membre
  (: Récupérer la catégorie correspondante via l'attribut categorieRef :)
  let $cat := $doc//categorie[@id = $m/@categorieRef]
  return
    <membre id="{$m/@id}">
      <nomComplet>{$m/prenom/text()} {$m/nom/text()}</nomComplet>
      <email>{$m/email/text()}</email>
      <categorie>{string($cat/@libelle)}</categorie>
    </membre>
}</membres>
