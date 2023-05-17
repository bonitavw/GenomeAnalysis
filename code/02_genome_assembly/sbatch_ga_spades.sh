#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J ga-spades
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/ga-spades.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

TRIM_DATA="/domus/h1/bonitavw/GenomeAnalysis/data/trimmed_data/genomics_data/Illumina"
ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"
NANOPORE_DATA="/domus/h1/bonitavw/GenomeAnalysis/data/raw_data/genomics_data/Nanopore"

module load bioinfo-tools
module load spades

spades.py --pe1-1 ${TRIM_DATA}/E745-1.L500_SZAXPI015146-56_1P_clean.fq.gz --pe1-2 ${TRIM_DATA}/E745-1.L500_SZAXPI015146-56_2P_clean.fq.gz \
    --isolate --nanopore ${NANOPORE_DATA}/E745_all.fasta.gz -o ${ANALYSIS_DIR}/02_genome_assembly/spades_output 
