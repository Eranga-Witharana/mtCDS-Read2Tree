#!/usr/bin/env bash

for f in conserved/*.fasta; do

    dup=$(grep "^>" "$f" | sed 's/>//' | sort | uniq -d)

    if [ -n "$dup" ]; then
        echo "DUPLICATE in $(basename "$f"): $dup"
    fi

done
