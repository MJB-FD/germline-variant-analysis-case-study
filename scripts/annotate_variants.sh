#!/bin/bash

set -e
SUMMARY="results/annotation/annotation_summary.md"

VCF="results/vcf_exploration/HG00096.non_reference.vcf.gz"
BED="data/reference/annotation/genes.hg19.bed"
EXON_BED="data/reference/features/exons.bed"
EXON_OUTPUT="results/annotation/variant_exon_overlap.bed"
EXON_COUNT="results/annotation/exonic_variant_count.txt"

OUTPUT="results/annotation/variant_gene_overlap.txt"

mkdir -p results/annotation

echo "=== Variant -> Gene annotation ==="

# Convert VCF positions to BED format
VARIANT_BED="results/annotation/HG00096.non_reference.bed"

bcftools query -f '%CHROM\t%POS0\t%END\n' "$VCF" \
> "$VARIANT_BED"

# Intersect variants with genes
bedtools intersect \
-a "$VARIANT_BED" \
-b "$BED" \
-wa -wb > "$OUTPUT"

# Count unique genic variants
GENIC_COUNT="results/annotation/genic_variant_count.txt"
cut -f1-3 "$OUTPUT" | \
sort -u | \
wc -l > "$GENIC_COUNT"
echo

echo "Unique genic variants:"
cat "$GENIC_COUNT"

echo
echo "Finding exon-overlapping variants..."

# Intersects variants with exons
bedtools intersect \
-a "$VARIANT_BED" \
-b "$EXON_BED" \
-wa > "$EXON_OUTPUT"

# Count unique exon variants
cut -f1-3 "$EXON_OUTPUT" | \
sort -u | \
wc -l > "$EXON_COUNT"
echo

echo "Unique exon-overlapping variants:"
cat "$EXON_COUNT"
echo

cat > "$SUMMARY" << EOF
# Variant Annotation Summary

Sample: HG00096

## Results

Unique genic variants: $(cat "$GENIC_COUNT")

Unique exon-overlapping variants: $(cat "$EXON_COUNT")

## Interpretation

Most non-reference variants occur outside exons.

Genic variants: $(cat "$GENIC_COUNT")

Exonic variants: $(cat "$EXON_COUNT")
EOF

echo "Annotation complete"
echo "Output: $OUTPUT"
