#!/bin/bash

set -e

VCF="results/vcf_exploration/HG00096.chr22.vcf.gz"

echo "=== Variant Statistics (HG00096) ==="

echo
echo "Cohort variant sites (chr22):"
bcftools view -H "$VCF" | wc -l

echo
echo "SNP records:"
bcftools view -v snps -H "$VCF" | wc -l

echo
echo "Indel records:"
bcftools view -v indels -H "$VCF" | wc -l

echo
echo "HG00096 non-reference sites:"
bcftools view -i 'GT!="0|0"' -H "$VCF" | wc -l

echo
echo "Sample:"
bcftools query -l "$VCF"
