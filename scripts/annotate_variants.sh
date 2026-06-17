#!/bin/bash

set -e

VCF="results/vcf_exploration/HG00096.non_reference.vcf.gz"
BED="data/reference/annotation/genes.hg19.bed"

OUTPUT="results/annotation/variant_gene_overlap.txt"

mkdir -p results/annotation

echo "=== Variant -> Gene annotation ==="

# Convert VCF positions to BED format
bcftools query -f '%CHROM\t%POS0\t%POS\n' "$VCF" | \
awk 'BEGIN{OFS="\t"} {print $1,$2-1,$3}' > /tmp/variants.bed

# Intersect variants with genes
bedtools intersect \
-a /tmp/variants.bed \
-b "$BED" \
-wa -wb > "$OUTPUT"

echo "Annotation complete"
echo "Output: $OUTPUT"
