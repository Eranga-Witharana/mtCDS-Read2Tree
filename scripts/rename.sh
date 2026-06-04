#!/usr/bin/env bash

for f in *.aa.fasta; do
    mv "$f" "${f/.aa.fasta/.fasta}"
done
