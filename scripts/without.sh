#!/usr/bin/env bash

for file in OG*.fa.fasta
do

    seqkit grep \
        -r \
        -p "^filtered_" \
        "$file" \
        > "filtered_${file%.fa.fasta}.fasta"

    echo "Processed $file -> filtered_${file%.fa.fasta}.fasta"

done
