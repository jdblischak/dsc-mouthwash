#!/bin/bash

# https://github.com/dcgerard/mouthwash_sims#get-data

outdir=data/

mkdir -p $outdir

wget_cmd="wget -P $outdir --no-clobber"

echo "Downloading sample attributes"
$wget_cmd https://storage.googleapis.com/gtex_analysis_v6p/annotations/GTEx_Data_V6_Annotations_SampleAttributesDS.txt

echo "Downloading gene counts"
$wget_cmd https://storage.googleapis.com/gtex_analysis_v6p/rna_seq_data/GTEx_Analysis_v6p_RNA-seq_RNA-SeQCv1.1.8_gene_reads.gct.gz

echo "Downloading gene annotations"
$wget_cmd https://storage.googleapis.com/gtex_analysis_v6p/reference/gencode.v19.genes.v6p_model.patched_contigs.gtf.gz

echo "Downloading subject phenotypes"
$wget_cmd https://storage.googleapis.com/gtex_analysis_v6p/annotations/GTEx_Data_V6_Annotations_SubjectPhenotypesDS.txt

echo "Downloading Eisenberg & Levanon 2013 housekeeping genes"
$wget_cmd http://www.tau.ac.il/~elieis/HKG/HK_genes.txt

echo "Downloading NCBI-to-Ensembl gene mappings"
$wget_cmd ftp://ftp.ncbi.nih.gov/gene/DATA/gene2ensembl.gz

echo "Downloading Lin2017 housekeeping genes"
$wget_cmd https://raw.githubusercontent.com/dcgerard/mouthwash_sims/master/Data/h-scHKgenes.csv

echo "Downloading Ensembl gene IDs for Lin2017 housekeeping genes"
$wget_cmd https://raw.githubusercontent.com/dcgerard/mouthwash_sims/master/Data/lin_hk_genes.csv
