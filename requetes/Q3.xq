(: ─────────────────────────────────────────────────────────────
   Q3 — Calcul du score de chaque participant
   ───────────────────────────────────────────────────────────── :)
<resultats>{
  (: Charger le document explicitement :)
  let $doc := doc('../club.xml')
  (: Parcourir chaque concours :)
  for $c in $doc//concours[@id]
  (: Récupérer le coefficient du concours :)
  let $coef := xs:decimal($c/@coefficient)
  return
    <concours titre="{$c/titre/text()}">{
      (: Parcourir les participants de ce concours :)
      for $p in $c//participant
      (: Récupérer le membre correspondant en utilisant le document chargé :)
      let $m     := $doc//membre[@id = $p/@membreRef]
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
