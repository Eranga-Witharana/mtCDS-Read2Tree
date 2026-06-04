#!/usr/bin/env bash

mkdir -p aa_clean

for f in aa/*.aa.fasta; do
    sed 's/\*//g' "$f" > aa_clean/$(basename "$f")
done
