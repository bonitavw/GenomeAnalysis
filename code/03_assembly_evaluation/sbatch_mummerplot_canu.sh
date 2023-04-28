#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J ga-mummerplot-canu
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/ge-mummerplot-canu.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"
REFERENCE="/domus/h1/bonitavw/GenomeAnalysis/data/raw_data/GCF_009734005.1_ASM973400v2_genomic.fasta"

module load bioinfo-tools
module load MUMmer/3.23

mummer -mum -b ${REFERENCE} ${ANALYSIS_DIR}/02_genome_assembly/canu_output/pacbio.contigs.fasta > ${ANALYSIS_DIR}/03_assembly_evaluation/mummerplot/output_canu.mum
mummerplot -Q ${ANALYSIS_DIR}/02_genome_assembly/canu_output/pacbio.contigs.fasta -t png -p ${ANALYSIS_DIR}/03_assembly_evaluation/mummerplot/mummerplot_output_canu \
${ANALYSIS_DIR}/03_assembly_evaluation/mummerplot/output_canu.mum
