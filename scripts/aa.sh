#!/usr/bin/env bash

mkdir -p aa

for f in *.fasta; do
    transeq \
        -sequence "$f" \
        -outseq "aa/$(basename "$f" .fasta).aa.fasta"
done
