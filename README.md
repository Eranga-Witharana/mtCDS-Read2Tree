## mtCDS-Read2Tree

## Recovery of Mitochondrial Protein-Coding Genes from Short-Read Sequencing Data Using Read2Tree

## Overview

Plant mitochondrial genomes are among the most structurally complex genomes in eukaryotes, often exhibiting extensive repeat-mediated recombination, structural rearrangements, multipartite conformations, and large genome sizes. These characteristics can complicate complete mitochondrial genome assembly, particularly when only short-read sequencing data are available.

**mtCDS-Read2Tree** is a bioinformatic workflow developed to recover mitochondrial protein-coding genes (mt CDS) directly from short-read sequencing data without requiring complete mitochondrial genome assembly. The workflow utilizes conserved mitochondrial CDS references and Read2Tree to reconstruct orthologous mitochondrial loci suitable for downstream phylogenetic analyses.

This workflow is particularly useful for mitochondrial phylogenomics, evolutionary studies, and comparative analyses of non-model plant species where complete mitochondrial genome assembly is challenging or unavailable.

## Workflow

The workflow consists of three major stages:

**1. Preparation of Reference Datasets**

Reference mitochondrial protein-coding genes are obtained from publicly available mitochondrial genome assemblies and organized as species-specific FASTA files. Conserved loci shared among reference species are identified and used to construct amino acid and nucleotide reference databases required by Read2Tree. Unique species identifiers are assigned to all reference taxa to ensure accurate sequence reconstruction and output organization.

Reference mitochondrial CDS should be organized as follows:

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

Each FASTA file should contain all mitochondrial protein-coding genes (CDS) available for a given reference species.

**Inputs**

Reference mitochondrial CDS FASTA files from publicly available mitochondrial genome assemblies

**Outputs**

- Amino acid orthologous group database (ogs_aa)
- Nucleotide reference database (all_mt_cds.fasta)

**2. Read2Tree Reconstruction**

Read2Tree reconstructs mitochondrial CDS directly from filtered paired-end sequencing reads using the prepared reference databases. This approach enables the recovery of phylogenetically informative mitochondrial loci without the need for complete mitochondrial genome assembly.

**Inputs**

- Amino acid reference database (ogs_aa)
- Nucleotide reference database (all_mt_cds.fasta)
- Filtered paired-end sequencing reads

#### Sequencing Reads

Filtered paired-end sequencing reads should be organized as:

```text
filtered_reads/
├── filtered_Species_A_1.fastq.gz
├── filtered_Species_A_2.fastq.gz
├── filtered_Species_B_1.fastq.gz
└── filtered_Species_B_2.fastq.gz
```

Each species should have its own pair of filtered read files generated after quality control and adapter trimming.

**Outputs**

- Recovered mitochondrial CDS
- Individual CDS alignments
- Concatenated mitochondrial CDS alignment

**3. Phylogenetic Analysis and Alignment Evaluation**

Recovered mitochondrial CDS alignments can be trimmed and analyzed using maximum-likelihood phylogenetic approaches. Individual locus alignments may also be evaluated to assess sequence recovery success, alignment quality, taxon occupancy, and suitability for downstream phylogenetic inference.

**Outputs**

- Trimmed concatenated alignment
- Maximum-likelihood phylogenetic tree
- Individual CDS alignments for quality assessment
- Locus-specific datasets for downstream analyses

## Applications

The workflow is primarily designed for the recovery of mitochondrial protein-coding genes (mt CDS) directly from short-read sequencing data without requiring complete mitochondrial genome assembly. The recovered loci can be used for phylogenetic reconstruction, comparative genomics, and evolutionary studies.

Although developed for mitochondrial CDS recovery, the same framework can be readily adapted to chloroplast protein-coding genes (cp CDS) by replacing the mitochondrial reference database with a chloroplast CDS reference set. This provides an alternative strategy for recovering phylogenetically informative chloroplast loci when complete chloroplast genome assembly is unsuccessful, fragmented, or unnecessary for downstream analyses.


## Software Requirements

The workflow was developed and tested using the following software versions:

- Read2Tree	2.0.1
- IQ-TREE	2.3.6
- trimAl	1.4.rev15
- SeqKit	2.5.0
- EMBOSS	6.6.0
- Python	3.10
- Biopython	≥1.80


## Repository Structure

```text
mtCDS-Read2Tree/
│
├── README.md
├── LICENSE
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
└── tutorial/
    ├── 01_reference_preparation.md
    ├── 02_read2tree.md
    └── 03_phylogenetic_analysis.md
```

## Scripts

The `scripts/` directory contains utilities for reference dataset preparation, Read2Tree database construction, and downstream alignment processing.

| Script         | Description                                                                        |
| -------------- | ---------------------------------------------------------------------------------- |
| `split.py`     | Split reference mitochondrial CDS FASTA files into gene-specific FASTA files.      |
| `occupancy.sh` | Calculate gene occupancy across reference species.                                 |
| `ID.sh`        | Replace species names with unique species identifiers required by Read2Tree.       |
| `check.sh`     | Detect duplicate species identifiers in FASTA files.                               |
| `aa.sh`        | Translate nucleotide CDS sequences into amino acid sequences using EMBOSS transeq. |
| `clean.sh`     | Remove stop codons from translated amino acid sequences.                           |
| `rename.sh`    | Rename translated FASTA files for downstream analyses.                             |
| `header.sh`    | Modify FASTA headers for Read2Tree compatibility.                                  |
| `trimal.sh`    | Trim alignments using trimAl.                                                      |
| `without.sh`   | Remove reference taxa and retain reconstructed sequences only.                     |


## Documentation

| Tutorial | Description |
|-----------|-------------|
| [01_reference_preparation.md](tutorial/01_reference_preparation.md) | Preparation of reference mitochondrial CDS datasets and construction of Read2Tree reference databases. |
| [02_read2tree.md](tutorial/02_read2tree.md) | Read2Tree installation, marker preparation, read mapping, and mitochondrial CDS reconstruction. |
| [03_phylogenetic_analysis.md](tutorial/03_phylogenetic_analysis.md) | Alignment trimming, reference sequence removal, phylogenetic inference, and alignment evaluation. |


## Downstream Phylogenetic Analyses

Species tree reconstruction (ASTRAL) and gene tree discordance analyses (PhyParts) can be performed by following the corresponding tutorials in the companion **rt2-phylogenomics** repository:

[https://github.com/<your-username>/rt2-phylogenomics](https://github.com/Eranga-Witharana/rt2-phylogenomics)

The downstream analytical framework is the same, while this repository focuses specifically on the recovery and processing of mitochondrial CDS datasets.



## Citation

A manuscript describing this workflow is currently in preparation. Citation information will be updated upon publication.
