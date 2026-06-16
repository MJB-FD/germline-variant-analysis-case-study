#!/bin/bash

set -e



VCF="results/vcf_exploration/HG00096.chr22.vcf.gz"

echo "=== HG00096 Genotype Distribution (robust) ==="
echo "Input: $VCF"
echo

bcftools query -f '[%GT\n]' "$VCF" | \
awk '
BEGIN {
    ref = 0;
    het = 0;
    hom_alt = 0;
    missing = 0;
}

{
    gt = $1;

    # handle missing genotypes
    if (gt == "." || gt == "./." || gt == ".|.") {
        missing++;
        next;
    }

    # split genotype into alleles (works for | or /)
    split(gt, a, /[\/|]/);

    a1 = a[1];
    a2 = a[2];

    # homozygous reference
    if (a1 == 0 && a2 == 0) {
        ref++;
    }
    # heterozygous (any difference)
    else if (a1 != a2) {
        het++;
    }
    # homozygous alternate (same non-zero allele)
    else {
        hom_alt++;
    }
}

END {
    print "Homozygous reference (0/0):", ref;
    print "Heterozygous (0/1, 1/0, 1/2, etc.):", het;
    print "Homozygous alternate (1/1, 2/2, etc.):", hom_alt;
    print "Missing genotypes:", missing;
}
'
