#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J aln-bwa
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/aln_bwa_ERR1797969.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"

DIR="Serum"
FILE="ERR1797969"

PASS1="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_${DIR}/trim_paired_${FILE}_pass_1.fastq.gz"
PASS2="/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_${DIR}/trim_paired_${FILE}_pass_2.fastq.gz"

module load bioinfo-tools
module load bwa
module load samtools

bwa mem ${ANALYSIS_DIR}/02_genome_assembly/canu_output/pacbio.contigs.fasta ${PASS1} ${PASS2} | samtools view -b | samtools sort \
-o ${ANALYSIS_DIR}/05_alignment/${DIR}/trim_paired_${FILE}_aligned.bam
samtools index ${ANALYSIS_DIR}/05_alignment/${DIR}/trim_paired_${FILE}_aligned.bam
