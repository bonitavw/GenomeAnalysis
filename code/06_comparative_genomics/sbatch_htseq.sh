#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J cg-htseq
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/cg-htseq.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

DIR="BH"
FILE="ERR1797974"

BAM_FILE="/domus/h1/bonitavw/GenomeAnalysis/analysis/05_alignment/${DIR}/trim_paired_${FILE}_aligned.bam"
GFF_FILE="/domus/h1/bonitavw/GenomeAnalysis/analysis/04_genome_annotation/GFF_file.gff"
COUNT_FILE="/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/htseq_counts_${DIR}_${FILE}.txt"

module load bioinfo-tools 
module load htseq

htseq-count --format=bam --i=locus_tag --type=CDS ${BAM_FILE} ${GFF_FILE} > ${COUNT_FILE}
