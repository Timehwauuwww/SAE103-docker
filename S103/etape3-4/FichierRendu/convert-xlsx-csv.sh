#!/bin/bash

sudo docker image pull bigpapoo/sae103-excel2csv
sudo docker container run --rm --name conteneur --platform=Linux/amd64 -v $(pwd):/app bigpapoo/sae103-excel2csv ssconvert /app/fichier.xlsx /app/fichier.csv

exit