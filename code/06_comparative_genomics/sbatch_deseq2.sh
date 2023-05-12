#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J deseq2
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/deseq2.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

module load bioinfo-tools
module load R/4.1.1
module load R_packages/4.1.1 

Rscript -e 'library("DESeq2"); sink("/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/topGenes.txt"); source("R_DESeq2_analysis.R")'
