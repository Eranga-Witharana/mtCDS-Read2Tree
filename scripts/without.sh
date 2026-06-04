#!/usr/bin/env bash

# without.sh
#
# Purpose:
#   Remove reference taxa from CDS alignments and retain
#   only reconstructed sequences recovered by Read2Tree.
#
# Input:
#   OG*.fa.fasta
#
# Output:
#   filtered_OG*.fasta
#
# Usage:
#   bash without.sh

for file in OG*.fa.fasta
do

    seqkit grep \
        -r \
        -p "^filtered_" \
        "$file" \
        > "filtered_${file%.fa.fasta}.fasta"

    echo "Processed $file -> filtered_${file%.fa.fasta}.fasta"

done
