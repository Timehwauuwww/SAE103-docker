#!/bin/bash

input_file="pays_iso.csv"

output_dir="largeur_20"
output_dir2="80x60_pixels"

mkdir -p "drapeaux/$output_dir"
mkdir -p "drapeaux/$output_dir2"

tail -n +2 < $input_file | cut -d',' -f 2 < $input_file | tr 'A-Z' 'a-z' > ISO.txt

while IFS= read -r ISO.txt ; do

    url="https://flagcdn.com/w20/$ISO.png" 
    url2=https://flagcdn.com/80x60/$ISO.png

    output_file='drapeaux/largeur_20/"$ISO.png"'
    output_file2='drapeaux/80x60_pixels/"$ISO.png"'

    wget -q -O "$output_file" "$url"
    wget -q -O "$output_file2" "$url2"

done < ISO

clear
echo "Téléchargement terminé. Les fichiers sont dans le dossier '$output_dir' et '$output_dir2'."

rm ./ISO.txt