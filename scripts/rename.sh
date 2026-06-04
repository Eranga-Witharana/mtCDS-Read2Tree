#!/usr/bin/env bash

# rename.sh
#
# Purpose:
#   Rename translated amino acid FASTA files to match
#   Read2Tree input requirements.
#
# Input:
#   *.aa.fasta
#
# Output:
#   *.fasta
#
# Usage:
#   bash rename.sh

for f in *.aa.fasta; do
    mv "$f" "${f/.aa.fasta/.fasta}"
done
