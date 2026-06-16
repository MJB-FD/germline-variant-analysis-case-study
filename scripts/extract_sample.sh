#!/bin/bash

set -e

INPUT_VCF="data/raw/vcf/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"

OUTPUT_VCF="results/vcf_exploration/HG00096.chr22.vcf.gz"

echo "Extracting HG00096 from chromosome 22 cohort VCF..."

bcftools view \
-s HG00096 \
-Oz \
-o "$OUTPUT_VCF" \
"$INPUT_VCF"

echo "Indexing extracted VCF...."

bcftools index "$OUTPUT_VCF"

echo "HG00096 extraction complete."
