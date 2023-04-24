#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J ga-quast
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/ge-quast.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"
REFERENCE="/domus/h1/bonitavw/GenomeAnalysis/data/raw_data/GCF_009734005.1_ASM973400v2_genomic.fna.gz"

module load bioinfo-tools
module load quast

quast.py ${ANALYSIS_DIR}/02_genome_assembly/canu_output/pacbio.contigs.fasta -r ${REFERENCE} -o ${ANALYSIS_DIR}/03_assembly_evaluation/quast_output/
