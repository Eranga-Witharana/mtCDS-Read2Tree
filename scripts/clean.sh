#!/usr/bin/env bash

# clean.sh
#
# Purpose:
#   Remove stop codons (*) from translated amino acid
#   sequences.
#
# Input:
#   aa/*.aa.fasta
#
# Output:
#   aa_clean/*.aa.fasta
#
# Usage:
#   bash clean.sh

mkdir -p aa_clean

for f in aa/*.aa.fasta; do
    sed 's/\*//g' "$f" > aa_clean/$(basename "$f")
done
