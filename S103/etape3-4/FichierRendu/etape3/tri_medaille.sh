#!/bin/bash

mv 'Tableau des médailles v2.xlsx' fichier.xlsx

chmod +x convert-xlsx-csv.sh
bash ./convert-xlsx-csv.sh

mv fichier.xlsx 'Tableau des médailles v2.xlsx'

INPUT_FILE="fichier.csv"
CLEANED_TEMP_FILE="cleaned_temp.csv"
CLEANED_FINAL_FILE="cleaned_final.csv"
SORTED_FILE="sorted_temp.csv"
OUTPUT_FILE="resultat.csv"


tr -d '\r' < "$INPUT_FILE" | sed '/^$/d' > "$CLEANED_TEMP_FILE"


tail -n +3 "$CLEANED_TEMP_FILE" > "$CLEANED_FINAL_FILE"


awk -F',' 'NR == 1 { print $0 ",Total"; next } 
          NR > 1 { total = $2 + $3 + $4; print $0 "," total }' "$CLEANED_FINAL_FILE" > "$SORTED_FILE"


(head -n 1 "$SORTED_FILE" && tail -n +2 "$SORTED_FILE" | sort -t',' -k2,2nr -k3,3nr -k4,4nr -k1,1)> "$SORTED_FILE.sorted"


awk -F',' 'BEGIN { OFS=","; rank=1; prev_gold=-1; prev_silver=-1; prev_bronze=-1; skip=0 }
    NR==1 { print "Rank," $0; next } # Ajouter un en-tête
    {
        if ($2 == prev_gold && $3 == prev_silver && $4 == prev_bronze) {
            print "-", $0
            skip++
        } else {
            rank += skip
            skip = 0
            print rank, $0
            rank++
        }
        prev_gold = $2; prev_silver = $3; prev_bronze = $4
    }' "$SORTED_FILE.sorted" > "$OUTPUT_FILE"

rm ./"$CLEANED_TEMP_FILE"
rm ./"$CLEANED_FINAL_FILE"
rm ./"$SORTED_FILE"
rm ./"$SORTED_FILE.sorted"
rm $INPUT_FILE

echo "Traitement terminé. Résultat enregistré dans $OUTPUT_FILE."