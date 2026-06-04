#!/usr/bin/env bash

for f in *.fasta; do
    gene=$(basename "$f" .fasta)
    count=$(grep -c "^>" "$f")
    echo -e "$gene\t$count"
done | sort -k2 -nr
