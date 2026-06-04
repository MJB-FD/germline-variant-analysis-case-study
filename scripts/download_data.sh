#!/bin/bash

set -e

echo "Creating directories... "
mkdir -p data/raw

echo "Downloading small 1000 Genomes Chromosome 22 sample..."

# Small public test dataset (1000 Genomes subset)
wget -O data/raw/sample_1.fastq.gz \
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00096/sequence_read/SRR062634_1.filt.fastq.gz

wget -O data/raw/sample_2.fastq.gz \
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00096/sequence_read/SRR062634_2.filt.fastq.gz

echo "Download complete."
ls -lh data/raw
