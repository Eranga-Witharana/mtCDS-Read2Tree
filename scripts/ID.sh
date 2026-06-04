#!/usr/bin/env bash

# ID.sh
#
# Purpose:
#   Replace species names in FASTA headers with unique
#   species identifiers required by Read2Tree.
#
# Input:
#   conserved/*.fasta
#   species_map.txt
#
# Output:
#   Updated FASTA files with modified headers.
#
# Usage:
#   bash ID.sh

for f in conserved/*.fasta; do
awk '
BEGIN {
    while ((getline < "species_map.txt") > 0) {
        map[$1] = $2
    }
    close("species_map.txt")
}

/^>/ {
    sp = substr($0, 2)

    if (sp in map) {
        print ">" map[sp]
    } else {
        print $0
    }
    next
}

{
    print
}
' "$f" > tmp.fasta && mv tmp.fasta "$f"

done
