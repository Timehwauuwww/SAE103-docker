#!/bin/bash

input_file="pays_iso.csv"

output_dir="largeur_20"
output_dir2="80x60_pixels"

mkdir -p "drapeaux/$output_dir"
mkdir -p "drapeaux/$output_dir2"

cut -d',' -f 2 < $input_file | tr 'A-Z' 'a-z' > ISO.txt
tr -d '\r' < ISO.txt | sed '/^$/d' > ISO2.txt

rm ./ISO.txt

tail -n +2 ISO2.txt > ISO

rm ./ISO2.txt


while IFS= read -r ISO ; do

    url="https://flagcdn.com/w20/$ISO.png" 
    url2="https://flagcdn.com/80x60/$ISO.png"

    output_file="drapeaux/largeur_20/$ISO.png"
    output_file2="drapeaux/80x60_pixels/$ISO.png"

    wget -q -O "$output_file" "$url"
    wget -q -O "$output_file2" "$url2"

done < ISO

clear
echo "Téléchargement des drapeaux terminé."

rm ./ISO
