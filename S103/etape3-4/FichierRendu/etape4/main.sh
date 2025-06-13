#!/bin/bash

# Definition des chemins
TAB_TRIE="resultat.csv"
DOS_DRAPEAUX="drapeaux"
OUTPUT_DIR="output"
HTML_FILE="tableau_medailles.html"
PDF_FILE="$OUTPUT_DIR/tableau_medailles.pdf"

# Creation du dossier de sortie
mkdir -p "$OUTPUT_DIR"

# 1. Execution du script de tri des medailles
echo "Tri des medailles..."
chmod +x tri_medaille.sh
bash ./tri_medaille.sh
clear

# 2. Telechargement des drapeaux
echo "Traitement des médailles..."
echo "Traitement des médailles terminé."
echo "Téléchargement des drapeaux..."
chmod +x download_drapeaux.sh
bash ./download_drapeaux.sh

# 3. Generation du HTML
echo "Génération du tableau au format html..."
cat > "$HTML_FILE" << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau des medailles - JO Paris 2024</title>
    <style>
        @media print {
            @page {
                size: A4 landscape;
                margin: 0.1cm;
            }
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            max-width: 297mm;
            max-height: 210mm;
        }

        header {
            display: flex;
            flex-direction: row;
            padding-top: 1px;
            width: 100%;
            height: 10px;
        }

        header h1 {
            font-size: 10px;
            text-align: center;
            flex: 1;
        }

        header img {
            max-width: 45px;
            height: auto;
            opacity: 1.0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 6px;
            margin-top: 12px;
        }

        tr {
            page-break-inside: avoid;
            height: 9px;
        }

        tr:first-child {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 0px;
            text-align: center;
            vertical-align: middle;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        td:nth-child(1), th:nth-child(1) {
            width: 25px;
        }

        td:nth-child(2), th:nth-child(2) {
            width: 55px;
        }

        td:nth-child(3), th:nth-child(3),
        td:nth-child(4), th:nth-child(4),
        td:nth-child(5), th:nth-child(5) {
            width: 12px;
        }

        td:nth-child(6), th:nth-child(6) {
            width: 15px;
        }

        td:nth-child(7), th:nth-child(7) {
            width: 18px;
        }

        .flag {
            height: 6px;
            vertical-align: middle;
            margin-right: 1px;
        }

        .medals {
            text-align: center;
        }
    </style>
</head>
<body>
<header>
    <h1>Tableau des médailles - Jeux Olympiques Paris 2024</h1>
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR45IwMHj8YH341Rpk_h4YnyZYPcjcmbjMLHA&s" alt="Logo JO Paris 2024">
</header>
EOF

# Ajouter le contenu du tableau depuis resultat.csv
echo "<table>" >> "$HTML_FILE"
echo "<tr><th>Rang</th><th>Pays</th><th>Or</th><th>Argent</th><th>Bronze</th><th>Total</th><th>%</th></tr>" >> "$HTML_FILE"

# Calculer le total general des medailles
TOTAL_MEDALS=$(awk -F',' 'NR>1{sum+=$6}END{print sum}' $TAB_TRIE)

# Joindre resultat.csv avec pays_iso.csv pour avoir les codes ISO
while IFS=, read -r rank pays or argent bronze total; do
    # Chercher le code ISO correspondant dans pays_iso.csv
    if [ "$rank" != "Rank" ]; then  
        iso=$(grep "^$pays," pays_iso.csv | cut -d',' -f2 | tr '[:upper:]' '[:lower:]')
        if [ ! -z "$iso" ]; then
            percentage=$(awk "BEGIN {printf \"%.1f\", ($total / $TOTAL_MEDALS) * 100}")
            echo "<tr><td>$rank</td><td><img src=\"$DOS_DRAPEAUX/largeur_20/$iso.png\" class=\"flag\">$pays</td><td class=\"medals\">$or</td><td class=\"medals\">$argent</td><td class=\"medals\">$bronze</td><td class=\"medals\">$total</td><td class=\"medals\">${percentage}</td></tr>" >> "$HTML_FILE"
        fi
    fi
done < $TAB_TRIE

echo "</table></body></html>" >> "$HTML_FILE"

echo "Génération du tableau au format html terminé."

# 4. Conversion en PDF avec Docker
echo "Génération du PDF..."
chmod +x convert-html-pdf.sh
bash ./convert-html-pdf.sh

sudo rm $HTML_FILE
sudo rm $TAB_TRIE
sudo rm -r $DOS_DRAPEAUX

clear

echo "Tri des médailles..."
echo "Traitement des médailles terminé"
echo "Téléchargement des drapeaux..."
echo "Téléchargement des drapeaux terminé."
echo "Génération du tableau en html.."
echo "Génération du tableau en html terminé."
echo "Generation du tableau au format pdf..."
echo "Traitement terminé !"
echo "Votre pdf se trouve dans le dossier $OUTPUT_DIR et tout les fichiers temporaires ont été supprimés."