#!/bin/bash

sudo docker image pull bigpapoo/sae103-imagick
sudo docker container run --rm --name conteneur --platform=Linux/amd64 -v $(pwd):/data bigpapoo/sae103-imagick convert /data/images/beach-volley.png /data/output/beach-volley.webp

exit