#!/bin/bash

set -e

echo "======================================"
echo " Germline Variant Analysis Pipeline"
echo " Sample: HG00096 (chr22)"
echo "======================================"

echo
echo "[1/4] Exploring cohort VCF..."
bash scripts/explore_vcf.sh

echo
echo "[2/4] Extracting HG00096 sample..."
bash scripts/extract_sample.sh

echo
echo "[3/4] Computing genotype distribution..."
bash scripts/genotype_distribution.sh

echo
echo "[4/4] Non-reference variants..."
bash scripts/non_reference_variants.sh

echo
echo "======================================"
echo " Pipeline complete"
echo "======================================"
