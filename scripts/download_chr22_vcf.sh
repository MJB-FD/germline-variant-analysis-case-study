#!/bin/bash

set -e

mkdir -p data/raw/vcf

cd data/raw/vcf

wget https://zenodo.org/records/3359882/files/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz

wget https://zenodo.org/records/3359882/files/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz.tbi

echo "Download Complete!"
