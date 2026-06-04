from Bio import SeqIO
import re
from collections import defaultdict
import os

output_dir = "gene_sets_raw"
os.makedirs(output_dir, exist_ok=True)

for species in os.listdir("."):
    if not os.path.isdir(species):
        continue

    if species in ["gene_sets_raw"]:
        continue

    fasta_path = os.path.join(
        species,
        "mt_all_cds",
        f"{species}.fasta"
    )

    if not os.path.isfile(fasta_path):
        print(f"Skipping {species}: CDS file not found")
        continue

    print(f"Processing {species}")

    gene_dict = defaultdict(list)

    for record in SeqIO.parse(fasta_path, "fasta"):
        match = re.search(r"\[gene=([^\]]+)\]", record.description)

        if not match:
            continue

        gene = match.group(1)

        record.id = species
        record.name = ""
        record.description = ""

        gene_dict[gene].append(record)

    for gene, records in gene_dict.items():
        out_fasta = os.path.join(output_dir, f"{gene}.fasta")

        with open(out_fasta, "a") as out:
            SeqIO.write(records, out, "fasta")
