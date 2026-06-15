#!/bin/bash

set -e


VCF="results/vcf_exploration/HG00096.chr22.vcf.gz"

echo "Total variant records:"
bcftools view -H "$VCF" | wc -l

echo
echo "Heterozygous variants:"
bcftools view -g het -H "$VCF" | wc -l

echo
echo "Homozygous alternate variants:"
bcftools view -g hom -H "$VCF" | wc -l
