# Reference Dataset Preparation

This section describes the preparation of mitochondrial CDS reference datasets for Read2Tree analyses.

## Input Data

Reference mitochondrial CDS sequences should be organized as:

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

---

## Step 1. Generate Gene-Specific FASTA Files

Split mitochondrial CDS datasets into individual gene files.

### Script

```bash
python scripts/split.py
```

### Output

```text
gene_sets_raw/
├── atp1.fasta
├── cox1.fasta
└── ...
```

---

## Step 2. Evaluate Gene Occupancy

Calculate the number of reference species represented in each gene.

### Script

```bash
bash scripts/occupancy.sh
```

Genes with low occupancy can be excluded from further analyses.

---

## Step 3. Select Conserved CDS Loci

Select highly conserved mitochondrial CDS loci shared among the reference species. Create a new directory and copy the selected genes into it using orthologous group (OG) identifiers.

```bash
mkdir conserved

cp sdh4.fasta conserved/OG0001.fasta
cp rps7.fasta conserved/OG0002.fasta
cp rps4.fasta conserved/OG0003.fasta
cp rps3.fasta conserved/OG0004.fasta
```

The `conserved/` directory should contain all selected orthologous group (OG) sequences that will be used to construct the Read2Tree reference databases.

---

## Step 4. Assign Unique Species Identifiers

**Important:** Each species must have a unique species identifier before running Read2Tree. Duplicate species names or identifiers should not be used, as Read2Tree relies on unique IDs to correctly assign reads and organize output files.

### Create a Species Mapping File

Create a tab-delimited mapping file:

```bash
cat > species_map.txt
```

Example:

```text
Brassica_oleracea    BROL
Brassica_nigra       BRNI
```

### Replace Species Names with Unique IDs

```bash
bash scripts/ID.sh
```

### Verify Unique Identifiers

```bash
bash scripts/check.sh
```

---

## Step 5. Generate Amino Acid Reference Sequences

Translate nucleotide CDS sequences into amino acid sequences using EMBOSS.

```bash
bash scripts/aa.sh
```

### Output

```text
aa/
├── OG0001.aa.fasta
├── OG0002.aa.fasta
└── ...
```

Remove stop codons from translated sequences:

```bash
bash scripts/clean.sh
```

### Output

```text
aa_clean/
├── OG0001.aa.fasta
├── OG0002.aa.fasta
└── ...
```

Rename files for downstream processing:

```bash
bash scripts/rename.sh
```

---

## Step 6. Prepare Read2Tree Reference Databases

Read2Tree requires separate amino acid and nucleotide reference databases.

### Remove "_1" from Sequence Headers

Before preparing the reference databases, remove the `_1` suffix from sequence headers.

```bash
sed -i 's/^>\([^[:space:]]*\)_1/>\1/' *.fasta
```

### Create Reference Directories

```bash
mkdir ogs_aa
mkdir ogs_dna
```

Copy the processed amino acid and nucleotide OG files into their respective directories.

### Modify FASTA Headers

Run the header modification script separately within each directory:

```bash
cd ogs_aa
bash ../scripts/header.sh

cd ../ogs_dna
bash ../scripts/header.sh
```

### Create the Nucleotide Reference Database

All DNA orthologous group sequences must be merged into a single FASTA file prior to Read2Tree analysis.

```bash
cat *.fasta > all_mt_cds.fasta
```

### Final Outputs

```text
ogs_aa/
all_mt_cds.fasta
```

These files serve as the amino acid and nucleotide reference databases required for Read2Tree reconstruction.
