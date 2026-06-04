#!/usr/bin/env bash

FA=( *.fa )

for fasta in "${FA[@]}"; do

    trimal \
        -in "${fasta}" \
        -out "${fasta}.fasta" \
        -fasta \
        -automated1

done
