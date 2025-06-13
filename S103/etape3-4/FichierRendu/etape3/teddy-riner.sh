#!/bin/bash

sudo docker image pull bigpapoo/sae103-imagick
sudo docker container run --rm --name conteneur --platform=Linux/amd64 -v $(pwd):/data bigpapoo/sae103-imagick convert /data/images/teddy-riner.webp -resize 960x600! /data/output/teddy-riner.webp

exit