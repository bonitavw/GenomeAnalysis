#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J gann-prokka
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/gann-prokka.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"

module load bioinfo-tools
module load prokka

prokka ${ANALYSIS_DIR}/02_genome_assembly/canu_output/pacbio.contigs.fasta --outdir ${ANALYSIS_DIR}/04_genome_annotation/


