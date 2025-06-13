#!/bin/bash

sudo docker image pull bigpapoo/sae103-html2pdf
sudo docker container run --rm --name conteneur --platform=Linux/amd64 \
  -v $(pwd):/work \
  bigpapoo/sae103-html2pdf  weasyprint /work/tableau_medailles.html /work/tableau_medailles.pdf /work/drapeaux/largeur_20

exit