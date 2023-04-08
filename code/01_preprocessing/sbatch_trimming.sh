#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J trimming
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/trimming.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

ILLUM_DATA="/domus/h1/bonitavw/GenomeAnalysis/data/raw_data/genomics_data/Illumina"
TRIM_DATA="/domus/h1/bonitavw/GenomeAnalysis/data/trimmed_data/genomics_data/Illumina"

module load bioinfo-tools
module load trimmomatic/0.39
which trimmomatic

trimmomatic PE -threads 2 ${ILLUM_DATA}/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz ${ILLUM_DATA}/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz \
              ${TRIM_DATA}/E745-1.L500_SZAXPI015146-56_1P_clean.fq.gz ${TRIM_DATA}/E745-1.L500_SZAXPI015146-56_1U_clean.fq.gz \
             ${TRIM_DATA}/E745-1.L500_SZAXPI015146-56_2P_clean.fq.gz ${TRIM_DATA}/E745-1.L500_SZAXPI015146-56_2U_clean.fq.gz \
           ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:30


