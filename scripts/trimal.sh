#!/usr/bin/env bash

# trimal.sh
#
# Purpose:
#   Trim individual CDS alignments using trimAl with
#   the automated1 algorithm.
#
# Input:
#   *.fa alignment files.
#
# Output:
#   *.fa.fasta trimmed alignments.
#
# Usage:
#   bash trimal.sh

FA=( *.fa )

for fasta in "${FA[@]}"; do

    trimal \
        -in "${fasta}" \
        -out "${fasta}.fasta" \
        -fasta \
        -automated1

done
