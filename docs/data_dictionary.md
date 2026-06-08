# Data Dictionary

## VCF

Variant Call Format (VCF) stores genomic variants relative to a reference genome.

### Core Columns

| Column  | Description  |
|---------|--------------|
|CHROM | Chromosome |
| POS | Genomic position |
| ID | Variant identifier |
| REF | Reference allele |
| ALT | Alternate allele |
| QUAL | Variant quality score |
| FILTER | Filtering status |
| INFO | Variant metadata |

### Genotyping Columns

Sample-specific genotype information.

Examples: 

0/0 = Homozygous reference

0/1 = Heterozygous reference

1/1 = Homozygous alternate

