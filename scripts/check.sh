#!/usr/bin/env bash

# check.sh
#
# Purpose:
#   Detect duplicate species identifiers within
#   orthologous group FASTA files.
#
# Input:
#   conserved/*.fasta
#
# Output:
#   Reports duplicated identifiers, if present.
#
# Usage:
#   bash check.sh

for f in conserved/*.fasta; do

    dup=$(grep "^>" "$f" | sed 's/>//' | sort | uniq -d)

    if [ -n "$dup" ]; then
        echo "DUPLICATE in $(basename "$f"): $dup"
    fi

done
