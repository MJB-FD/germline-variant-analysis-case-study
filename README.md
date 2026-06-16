# Germline Variant Analysis Case Study (1000 Genomes – chr22)

## Overview

This project analyzes germline genetic variation in a single human sample (HG00096) using chromosome 22 data from the 1000 Genomes Project.

Instead of performing read alignment or variant calling from raw FASTQ files, this project focuses on **VCF-level population genetics analysis**.

The goal is to move from a population-scale variant dataset to individual-level genotype interpretation in a reproducible way.

---

## Biological Questions

This project answers:

1. How many variant sites exist on chromosome 22 in the 1000 Genomes cohort?
2. Which of these variants are present in individual HG00096?
3. How are genotypes distributed across reference, heterozygous, and homozygous alternate states?
4. What is the difference between cohort variation and individual variation?

---

## Dataset

- Source: 1000 Genomes Project Phase 3
- Chromosome: 22
- Samples: 2,504 individuals
- Reference genome: GRCh37 / hg19
- Format: VCF (variant call format)

---

## Workflow Summary

The analysis follows this sequence:

1. Explore cohort VCF structure
2. Extract individual HG00096
3. Classify genotypes across all variant sites
4. Identify non-reference variant positions
5. Summarize variant statistics

---

## Reproducibility

To reproduce the entire analysis:

```bash
bash scripts/run_all.sh
