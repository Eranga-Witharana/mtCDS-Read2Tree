Use the same script for both ogs_aa and ogs_dna.

#!/usr/bin/env bash

for f in OG*.fasta; do

    og=$(basename "$f" .fasta)

    sed -E "s/^>(.+)$/>\1${og}/" "$f" > tmp

    mv tmp "$f"

done
