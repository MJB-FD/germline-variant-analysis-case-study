#!/bin/bash

set -e

echo "======================================"
echo " Germline Variant Analysis Pipeline"
echo " Sample: HG00096 (chr22)"
echo "======================================"

echo
echo "[1/6] Exploring cohort VCF..."
bash scripts/explore_vcf.sh

echo
echo "[2/6] Extracting HG00096 sample..."
bash scripts/extract_sample.sh

echo
echo "[3/6] Computing genotype distribution..."
bash scripts/genotype_distribution.sh

echo
echo "[4/6] Non-reference variants..."
bash scripts/non_reference_variants.sh

echo
echo "[5/6] Variant statistics (SNP/indel breakdown)..."
bash scripts/variant_statistics.sh

echo
echo "[6/6] Gene & exon annotation..."
bash scripts/annotate_variants.sh

echo
echo "======================================"
echo " Pipeline complete"
echo "======================================"
