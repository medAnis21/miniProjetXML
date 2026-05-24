(: ─────────────────────────────────────────────────────────────
   Q4 — Vainqueur de chaque concours
   ───────────────────────────────────────────────────────────── :)
<vainqueurs>{
  (: Charger le document explicitement :)
  let $doc := doc('../club.xml')
  for $c in $doc//concours[@id]
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
      let $m     := $doc//membre[@id = $p/@membreRef]
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
