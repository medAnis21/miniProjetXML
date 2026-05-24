
<resultats>{

(: ─────────────────────────────────────────────────────────────
   Q1 — Liste complète des membres
   ───────────────────────────────────────────────────────────── :)
<Q1>
<membres>{
  (: Parcourir tous les membres :)
  for $m in //membre
  (: Récupérer la catégorie correspondante via l'attribut categorieRef :)
  let $cat := //categorie[@id = $m/@categorieRef]
  return
    <membre id="{$m/@id}">
      <nomComplet>{$m/prenom/text()} {$m/nom/text()}</nomComplet>
      <email>{$m/email/text()}</email>
      <categorie>{$cat/@libelle/string()}</categorie>
    </membre>
}</membres>
</Q1>,


(: ─────────────────────────────────────────────────────────────
   Q2 — Liste des concours triés par date croissante
   ───────────────────────────────────────────────────────────── :)
<Q2>
<concours>{
  (: Parcourir les concours et trier par date :)
  for $c in //concours[@id]
  let $cat := //categorie[@id = $c/@categorieRef]
  order by xs:date($c/@date) ascending
  return
    <concours id="{$c/@id}">
      <titre>{$c/titre/text()}</titre>
      <date>{$c/@date/string()}</date>
      <coefficient>{$c/@coefficient/string()}</coefficient>
      <categorie>{$cat/@libelle/string()}</categorie>
    </concours>
}</concours>
</Q2>,


(: ─────────────────────────────────────────────────────────────
   Q3 — Calcul du score de chaque participant
   ───────────────────────────────────────────────────────────── :)
<Q3>
<resultats>{
  (: Parcourir chaque concours :)
  for $c in //concours[@id]
  (: Récupérer le coefficient du concours :)
  let $coef := xs:decimal($c/@coefficient)
  return
    <concours titre="{$c/titre/text()}">{
      (: Parcourir les participants de ce concours :)
      for $p in $c//participant
      (: Récupérer le membre correspondant :)
      let $m     := //membre[@id = $p/@membreRef]
      (: Calculer le score :)
      let $score := (xs:integer($p/complexite) +
                     xs:integer($p/tempsExecution)) * $coef
      return
        <participant>
          <nom>{$m/prenom/text()} {$m/nom/text()}</nom>
          <complexite>{$p/complexite/text()}</complexite>
          <tempsExecution>{$p/tempsExecution/text()}</tempsExecution>
          <score>{round($score * 100) div 100}</score>
        </participant>
    }</concours>
}</resultats>
</Q3>,


(: ─────────────────────────────────────────────────────────────
   Q4 — Vainqueur de chaque concours
   ───────────────────────────────────────────────────────────── :)
<Q4>
<vainqueurs>{
  for $c in //concours[@id]
  let $coef := xs:decimal($c/@coefficient)
  (: Calculer les scores de tous les participants :)
  let $scores :=
    for $p in $c//participant
    return (xs:integer($p/complexite) +
            xs:integer($p/tempsExecution)) * $coef
  (: Trouver le score maximum :)
  let $maxScore := max($scores)
  return
    <concours titre="{$c/titre/text()}">{
      (: Filtrer les participants ayant le score max (gestion ex-aequo) :)
      for $p in $c//participant
      let $m     := //membre[@id = $p/@membreRef]
      let $score := (xs:integer($p/complexite) +
                     xs:integer($p/tempsExecution)) * $coef
      where $score = $maxScore
      return
        <vainqueur>
          <nom>{$m/nom/text()}</nom>
          <prenom>{$m/prenom/text()}</prenom>
          <score>{round($score * 100) div 100}</score>
        </vainqueur>
    }</concours>
}</vainqueurs>
</Q4>,


(: ─────────────────────────────────────────────────────────────
   Q5 — Membres d'une catégorie (triés alphabétiquement)
   ───────────────────────────────────────────────────────────── :)
<Q5>{
let $categorie := "Intelligence Artificielle"
(: Trouver l'id de la catégorie demandée :)
let $idCat := //categorie[@libelle = $categorie]/@id/string()
return
<membres categorie="{$categorie}">{
  (: Filtrer les membres de cette catégorie, tri alphabétique :)
  for $m in //membre[@categorieRef = $idCat]
  order by $m/nom/text() ascending, $m/prenom/text() ascending
  return
    <membre id="{$m/@id}">
      <nomComplet>{$m/prenom/text()} {$m/nom/text()}</nomComplet>
      <email>{$m/email/text()}</email>
    </membre>
}</membres>
}</Q5>

}</resultats>
