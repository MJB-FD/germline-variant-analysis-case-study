#!/bin/bash

set -e

VCF="data/raw/vcf/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"

echo "=== VCF Exploration ==="

echo
echo "VCF header information:"
bcftools view -h "$VCF" | head -10

echo
echo "Number of Samples:"
bcftools query -l "$VCF" | wc -l

echo
echo "Total cohort variant sites:"
bcftools view -H "$VCF" | wc -l

echo
echo "Example variant records:"
bcftools view -H "$VCF" | head -3
