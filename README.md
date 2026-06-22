# Germline Variant Analysis Pipeline (1000 Genomes Project)

## Overview

This project analyzes germline variants from chromosome 22 of sample HG00096 from the 1000 Genomes Project.

The workflow uses Bash, bcftools, bedtools, and genomic annotation resources to:

* Explore a population-scale VCF
* Extract a single sample
* Characterize genotype distributions
* Filter non-reference variants
* Annotate variants against genes and exons
* Generate reproducible summary statistics

---

## Dataset

Source: 1000 Genomes Project

Sample analyzed: HG00096

Chromosome: 22

VCF records analyzed: 1,097,199

---

## Tools

* Bash
* bcftools
* bedtools
* Git
* GitHub

---

## Workflow

VCF Download

↓

Sample Extraction

↓

Genotype Distribution Analysis

↓

Non-reference Variant Filtering

↓

Gene Annotation

↓

Exon Annotation

↓

Summary Report Generation

---

## Results

| Metric                           |     Value |
| -------------------------------- | --------: |
| Cohort variant sites             | 1,097,199 |
| Non-reference variants (HG00096) |    53,113 |
| Genic variants                   |    32,401 |
| Exonic variants                  |     3,485 |

### Interpretation

Most non-reference variants occur outside coding exons, which is consistent with the predominance of non-coding DNA in the human genome.

---

## Repository Structure

scripts/

* download_chr22_vcf.sh
* extract_sample.sh
* genotype_distribution.sh
* non_reference_variants.sh
* annotate_variants.sh
* run_all.sh

results/

* vcf_exploration/
* annotation/

docs/

* project documentation

---

## Reproducibility

Run the complete workflow:

bash scripts/run_all.sh

---

## Author

Bioinformatics portfolio project focused on germline variant analysis and genomic annotation.
