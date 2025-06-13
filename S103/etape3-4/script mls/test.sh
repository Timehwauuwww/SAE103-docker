#!/bin/bash

# Dossier de sortie pour les images téléchargées
output_dir="images"
mkdir -p "$output_dir"  # Créer le dossier si il n'existe pas

# Liste des URLs des images (vous pouvez ajouter autant de liens que vous voulez)
image_urls=(
    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"
    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp"
    "https://example.com/image3.gif"
)

# Téléchargement des images
for url in "${image_urls[@]}"; do
    # Extraire le nom du fichier à partir de l'URL
    filename=$(basename "$url")
    
    # Télécharger l'image
    wget -q -O "$output_dir/$filename" "$url"

    # Vérifier si le téléchargement a réussi
    if [[ $? -eq 0 ]]; then
        echo "Téléchargé : $filename"
    else
        echo "Erreur : Impossible de télécharger $url"
    fi
done

echo "Téléchargement terminé. Les images sont dans le dossier '$output_dir'."
