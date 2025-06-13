#!/bin/bash
docker run --rm -v $(pwd):/data sae103-html2pdf wkhtmltopdf \
  tableau.html medailles.pdf