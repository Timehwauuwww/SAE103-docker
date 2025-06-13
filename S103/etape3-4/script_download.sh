#!/bin/bash

# Chemin du fichier CSV
input_file="pays_iso.csv"

# Dossier de sortie pour les drapeaux
output_dir="largeur_20"
output_dir2="80x60_pixels"
mkdir -p "drapeau/$output_dir"  # Créer le dossier s'il n'existe pas
mkdir -p "drapeau/$output_dir2"
# Lire chaque ligne du fichier CSV
while IFS=',' read -r pays iso; do
    # Nettoyer les espaces et caractères invisibles
    iso=$(echo "$iso" | xargs)

    # Vérifier si le code ISO est valide (2 lettres uniquement, pas vide, pas "??")
    if [[ -n $iso && $iso =~ ^[A-Za-z]{2}$ ]]; then
        # Construire l'URL
        url="https://flagcdn.com/w20/${iso,,}.png"  # Convertir en minuscules
        url2=https://flagcdn.com/80x60/${iso,,}.png
        
        output_file="drapeau/${output_dir}/${iso,,}.png"
        output_file2="drapeau/${output_dir2}/${iso,,}.png"
        # Télécharger le fichier
        wget -q -O "$output_file" "$url"
        wget -q -O "$output_file2" "$url2"

        echo "Pays='$pays', ISO='$iso'"


        # Vérifier le succès du téléchargement
        if [[ $? -eq 0 ]]; then
            echo "Téléchargé : $pays -> $output_file"
            echo "Téléchargé : $pays -> $output_file2"
        else    
            echo "Erreur : Impossible de télécharger $url"
        fi
    else
        echo "Code ISO invalide ou absent pour la ligne : $pays, $iso"
    fi
done < "$input_file"

echo "Téléchargement terminé. Les fichiers sont dans le dossier '$output_dir' et '$output_dir2'."
