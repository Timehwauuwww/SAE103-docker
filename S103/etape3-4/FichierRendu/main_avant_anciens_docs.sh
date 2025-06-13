#!/bin/bash

# Definition des chemins
WORKING_DIR="$(pwd)"
MEDALS_XLSX="Tableau des medailles v2.xlsx"
OUTPUT_DIR="output"
HTML_FILE="$OUTPUT_DIR/tableau_medailles.html"
PDF_FILE="$OUTPUT_DIR/tableau_medailles.pdf"

# Creation du dossier de sortie
mkdir -p "$OUTPUT_DIR"

# 1. Exécution des scripts de tri des images
echo "etape de tri des images"
chmod +x aviron.sh
bash ./aviron.sh
chmod +x beach-volley.sh
chmod +x depart-triathlon.sh
chmod +x cyclisme1.sh
chmod +x podium.png
chmod +x teddy-riner.webp

# 1. Execution du script de tri des medailles
echo "etape de tri des medailles..."
chmod +x tri_medaille.sh
bash ./tri_medaille.sh

# 2. Telechargement des drapeaux
echo "etape de telechargement des drapeaux..."
chmod +x download_drapeaux.sh
bash ./download_drapeaux.sh

# 3. Generation du HTML
echo "etape de generation du HTML..."
cat > "$HTML_FILE" << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau des medailles - JO Paris 2024</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .logo { max-width: 200px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        .flag { height: 20px; vertical-align: middle; margin-right: 10px; }
        .medals { text-align: center; }
        @media print {
            table { column-count: 2; }
        }
    </style>
</head>
<body>
    <h1>Tableau des medailles - JO Paris 2024</h1>
    <img src="logo_jo.png" alt="Logo JO Paris 2024" class="logo">
EOF

# Ajouter le contenu du tableau depuis resultat.csv
echo "<table>" >> "$HTML_FILE"
echo "<tr><th>Rang</th><th>Pays</th><th>Or</th><th>Argent</th><th>Bronze</th><th>Total</th><th>Pourcentage</th></tr>" >> "$HTML_FILE"

# Calculer le total general des medailles
TOTAL_MEDALS=$(awk -F',' 'NR>1{sum+=$6}END{print sum}' resultat.csv)

# Joindre resultat.csv avec pays_iso.csv pour avoir les codes ISO
while IFS=, read -r rank pays or argent bronze total; do
    # Chercher le code ISO correspondant dans pays_iso.csv
    if [ "$rank" != "Rank" ]; then  
        iso=$(grep "^$pays," pays_iso.csv | cut -d',' -f2 | tr '[:upper:]' '[:lower:]')
        if [ ! -z "$iso" ]; then
            percentage=$(awk "BEGIN {printf \"%.1f\", ($total / $TOTAL_MEDALS) * 100}")
            echo "<tr><td>$rank</td><td><img src=\"drapeaux/largeur_20/$iso.png\" class=\"flag\">$pays</td><td class=\"medals\">$or</td><td class=\"medals\">$argent</td><td class=\"medals\">$bronze</td><td class=\"medals\">$total</td><td class=\"medals\">${percentage}%</td></tr>" >> "$HTML_FILE"
        fi
    fi
done < resultat.csv

echo "</table></body></html>" >> "$HTML_FILE"

# 4. Conversion en PDF avec Docker
echo "etape 4: Generation du PDF..."
chmod +x convert-html-pdf.sh
bash ./convert-html-pdf.sh