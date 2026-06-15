#!/bin/bash
set -e

VCF="results/vcf_exploration/HG00096.chr22.vcf.gz"

bcftools view \
-i 'GT!="0|0"' \
-Oz \
-o results/vcf_exploration/HG00096.non_reference.vcf.gz \
"$VCF"

bcftools index \
results/vcf_exploration/HG00096.non_reference.vcf.gz

echo "Created non-reference VCF"
