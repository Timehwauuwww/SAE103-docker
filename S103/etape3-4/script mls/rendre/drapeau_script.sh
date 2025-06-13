#!/bin/bash

input_file="pays_iso.csv"

output_dir="largeur_20"
output_dir2="80x60_pixels"

mkdir -p "drapeau/$output_dir"
mkdir -p "drapeau/$output_dir2"

cut -d',' -f 2 < $input_file | tr 'A-Z' 'a-z' > ISO

   

while IFS= read -r ISO; do

    url="https://flagcdn.com/w20/$ISO.png" 
    url2=https://flagcdn.com/80x60/$ISO.png

    output_file="drapeau/largeur_20/$ISO.png"
    output_file2="drapeau/80x60_pixels/$ISO.png"

    wget -q -O "$output_file" "$url"
    wget -q -O "$output_file2" "$url2"

    echo "ISO : $ISO"

done < ISO

echo "Téléchargement terminé. Les fichiers sont dans le dossier '$output_dir' et '$output_dir2'."

rm ./ISO
