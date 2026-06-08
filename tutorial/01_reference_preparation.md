# Reference Dataset Preparation

This section describes the preparation of reference mitochondrial CDS datasets for Read2Tree analyses.

## Input Structure

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

## Scripts

The following scripts are used:

- split.py
- occupancy.sh
- ID.sh
- check.sh
- aa.sh
