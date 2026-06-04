Use the same script for both ogs_aa and ogs_dna.

#!/usr/bin/env bash

# header.sh
#
# Purpose:
#   Append orthologous group (OG) identifiers to FASTA
#   headers for Read2Tree compatibility.
#
# Input:
#   OG*.fasta
#
# Output:
#   Modified FASTA files with OG identifiers appended
#   to sequence headers.
#
# Usage:
#   bash header.sh

for f in OG*.fasta; do

    og=$(basename "$f" .fasta)

    sed -E "s/^>(.+)$/>\1${og}/" "$f" > tmp

    mv tmp "$f"

done
