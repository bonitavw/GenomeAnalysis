#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J ga-canu
#SBATCH -o /domus/h1/bonitavw/GenomeAnalysis/logs/ga-canu.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user vanwaardenburgbonita@gmail.com

PACBIO_DATA="/domus/h1/bonitavw/GenomeAnalysis/data/raw_data/genomics_data/PacBio"
ANALYSIS_DIR="/domus/h1/bonitavw/GenomeAnalysis/analysis"

module load bioinfo-tools
module load canu

canu -p pacbio -d ${ANALYSIS_DIR}/02_genome_assembly/canu_output/ genomeSize=2.8m useGrid=true gridOptions="-A uppmax2023-2-8 -t 05:00:00" -pacbio-raw ${PACBIO_DATA}/*.subreads.fastq.gz &>> mylogcanu



