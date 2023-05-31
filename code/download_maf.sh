#!/usr/bin/env bash

set -euo pipefail

url=https://hgdownload.cse.ucsc.edu/goldenPath/hg38/multiz100way/maf
outdir=multiz100way
mkdir -p ${outdir}

for chr in {1..22}; do
   wget -c ${url}/chr${chr}.maf.gz -O ${outdir}/${chr}.maf.gz
done

>&2 echo Done
exit 0
