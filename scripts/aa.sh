#!/usr/bin/env bash

# aa.sh
#
# Purpose:
#   Translate nucleotide CDS sequences into amino acid
#   sequences using EMBOSS transeq.
#
# Input:
#   OG*.fasta nucleotide sequence files.
#
# Output:
#   aa/
#   ├── OG0001.aa.fasta
#   ├── OG0002.aa.fasta
#   └── ...
#
# Usage:
#   bash aa.sh

mkdir -p aa

for f in *.fasta; do
    transeq \
        -sequence "$f" \
        -outseq "aa/$(basename "$f" .fasta).aa.fasta"
done
