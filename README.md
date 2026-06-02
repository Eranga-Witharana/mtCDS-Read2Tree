# mtCDS-Read2Tree

A workflow for recovering mitochondrial protein-coding genes (mt CDS) directly from short-read sequencing data using Read2Tree without requiring complete mitochondrial genome assembly.

## Overview

Plant mitochondrial genomes are often difficult to assemble because of extensive structural rearrangements, repetitive regions, multipartite conformations, and large genome sizes. This workflow provides an alternative strategy for mitochondrial phylogenetic studies by directly reconstructing mitochondrial protein-coding genes from short-read sequencing data using Read2Tree.

The workflow generates locus-specific and concatenated mitochondrial CDS datasets suitable for downstream phylogenetic analyses.

---

## Workflow

Reference mt CDS
→ Gene extraction
→ Conserved CDS selection
→ Species ID assignment
→ Amino acid and nucleotide database construction
→ Read2Tree reconstruction
→ Alignment trimming
→ Phylogenetic inference

---

## Software Requirements

| Software | Version |
|-----------|-----------|
| Read2Tree | 2.0.1 |
| IQ-TREE | 2.3.6 |
| trimAl | 1.4.rev15 |
| SeqKit | 2.5.0 |
| EMBOSS | 6.6.0 |
| Python | 3.10 |
| Biopython | ≥1.80 |

---

## Repository Structure

```text
mtCDS-Read2Tree/
│
├── README.md
├── LICENSE
├── environment.yml
│
├── scripts/
│   ├── split.py
│   ├── occupancy.sh
│   ├── ID.sh
│   ├── check.sh
│   ├── aa.sh
│   ├── clean.sh
│   ├── rename.sh
│   ├── header.sh
│   ├── trimal.sh
│   └── without.sh
│
├── docs/
│
├── tutorial/
│
└── example_data/
```

---

## Input Data

Reference mitochondrial CDS should be provided as FASTA files:

```text
Mito_CDS/
├── Species_A/
│   └── mt_all_cds/
│       └── Species_A.fasta
│
└── Species_B/
    └── mt_all_cds/
        └── Species_B.fasta
```

Filtered sequencing reads should be stored separately:

```text
filtered_reads/
├── filtered_Species_A_1.fastq.gz
└── filtered_Species_B_2.fastq.gz
```

---

## Read2Tree Reconstruction

The workflow uses conserved mitochondrial CDS references to reconstruct orthologous mitochondrial genes from raw sequencing reads.

Outputs include:

- Individual CDS alignments
- Concatenated alignments
- Phylogenetic datasets
- Alignment evaluation files

---

## Phylogenetic Analysis

The concatenated alignment can be analyzed using IQ-TREE:

```bash
iqtree2 -s NewOutput.fasta -m MFP -bb 1000 -alrt 1000 -nt AUTO
```

---

## Citation

A manuscript describing this workflow is currently in preparation. Citation information will be updated upon publication.
