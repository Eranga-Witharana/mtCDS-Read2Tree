#!/usr/bin/env bash

# occupancy.sh
#
# Purpose:
#   Calculate gene occupancy across reference species.
#
# Input:
#   Gene-specific FASTA files located in the current directory.
#
# Output:
#   Tab-delimited table showing gene names and the number
#   of reference species containing each gene.
#
# Usage:
#   bash occupancy.sh

for f in *.fasta; do
    gene=$(basename "$f" .fasta)
    count=$(grep -c "^>" "$f")
    echo -e "$gene\t$count"
done | sort -k2 -nr
