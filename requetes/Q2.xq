(: ─────────────────────────────────────────────────────────────
   Q2 — Liste des concours triés par date croissante
   ───────────────────────────────────────────────────────────── :)
<concours>{
  (: Charger le document explicitement :)
  let $doc := doc('../club.xml')
  (: Parcourir les concours et trier par date :)
  for $c in $doc//concours[@id]
  let $cat := $doc//categorie[@id = $c/@categorieRef]
  order by xs:date($c/@date) ascending
  return
    <concours id="{$c/@id}">
      <titre>{$c/titre/text()}</titre>
      <date>{string($c/@date)}</date>
      <coefficient>{string($c/@coefficient)}</coefficient>
      <categorie>{string($cat/@libelle)}</categorie>
    </concours>
}</concours>
