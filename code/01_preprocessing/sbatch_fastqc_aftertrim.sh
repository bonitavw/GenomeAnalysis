#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J fastqc-after
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/fastqc-after.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

TRIM_DATA="/domus/h1/bonitavw/GenomeAnalysis/data/trimmed_data/genomics_data/Illumina"
ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"

module load bioinfo-tools
module load FastQC

fastqc -o ${ANALYSIS_DIR}/01_preprocessing/ ${TRIM_DATA}/*

