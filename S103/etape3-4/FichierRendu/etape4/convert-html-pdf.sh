#!/bin/bash

sudo docker image pull bigpapoo/sae103-html2pdf
sudo docker container run --rm --name conteneur --platform=linux/amd64 \
  -v $(pwd):/work \
  bigpapoo/sae103-html2pdf \
  weasyprint /work/tableau_medailles.html /work/output/tableau_medailles.pdf
exit