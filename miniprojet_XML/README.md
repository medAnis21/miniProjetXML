# Mini-Projet XML — Club Info_Tech
## Données semi-structurées | Licence 3 | Université de Skikda

---

## Structure du projet
```
miniprojet_XML/
├── club.xml        → Document XML principal
├── club.xsd        → Schéma de validation
├── requetes.xq     → 5 requêtes XQuery (Q1–Q5)
├── updates.xq      → 3 mises à jour XQuery Update
└── capture/        → Captures d'écran
```

---

## Données
- 4 catégories : IA, Web, Sécurité, Réseaux
- 12 membres répartis sur les 4 catégories
- 4 concours (1 par catégorie), 3 participants chacun
- score = (complexite + tempsExecution) × coefficient

---

## Installation et utilisation

### Étape 1 — VS Code (édition des fichiers)
1. Installer VS Code : https://code.visualstudio.com
2. Ouvrir le dossier : File > Open Folder > miniprojet_XML
3. Extensions recommandées :
   - "XML" par Red Hat (validation XSD en direct)
   - "XQuery" par DotJoshJohnson (coloration syntaxique)

### Étape 2 — BaseX (exécution des requêtes)
1. Télécharger BaseX : https://basex.org/download/
2. Choisir "BaseX ZIP" → extraire → lancer `basex.bat` (Windows)
   ou `bin/basex` (Linux/Mac)

### Étape 3 — Valider club.xml avec xmllint (optionnel)
```bash
xmllint --schema club.xsd club.xml --noout
```

---

## Utilisation dans BaseX GUI

### Charger le fichier XML
1. Lancer BaseX GUI
2. Database > New...
3. Name: "club" | choisir club.xml | OK

### Exécuter les requêtes
1. Editor > New (Ctrl+T)
2. Coller le contenu de requetes.xq
3. Run (F5) — les résultats s'affichent en bas

### Exécuter les mises à jour
1. Editor > New (Ctrl+T)
2. Coller le contenu de updates.xq
3. Run (F5)
4. Database > Open & Manage... pour voir les changements

---

## Résultats attendus (scores calculés)

### CO1 — IA (coefficient 1.5)
| Membre       | complexite | tempsExec | score  |
|--------------|-----------|-----------|--------|
| Ahmed Benali | 85        | 120       | 307.5  |
| Nour Hamidi  | 72        | 95        | 250.5  |
| Walid Meziane| 90        | 110       | 300.0  |
→ **Vainqueur : Ahmed Benali (307.5)**

### CO2 — Web (coefficient 1.2)
| Membre       | complexite | tempsExec | score  |
|--------------|-----------|-----------|--------|
| Sara Khelif  | 78        | 200       | 333.6  |
| Lyna Zerrouk | 88        | 180       | 321.6  |
| Karim Aouadi | 65        | 250       | 378.0  |
→ **Vainqueur : Karim Aouadi (378.0)**

### CO3 — Sécurité (coefficient 2.0)
| Membre        | complexite | tempsExec | score  |
|---------------|-----------|-----------|--------|
| Rami Boudia   | 95        | 300       | 790.0  |
| Amine Salhi   | 80        | 280       | 720.0  |
| Imane Cherif  | 88        | 260       | 696.0  |
→ **Vainqueur : Rami Boudia (790.0)**

### CO4 — Réseaux (coefficient 1.8)
| Membre          | complexite | tempsExec | score  |
|-----------------|-----------|-----------|--------|
| Dalia Ferhat    | 70        | 150       | 396.0  |
| Yacine Boudjenane| 82       | 130       | 381.6  |
| Reda Mansouri   | 77        | 160       | 421.2  |
→ **Vainqueur : Reda Mansouri (421.2)**
