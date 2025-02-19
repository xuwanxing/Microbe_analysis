#!/bin/bash
#SBATCH --partition=debug
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 8
#SBATCH --job-name bwa
#SBATCH --output ./log/bwa-%J.out
#SBATCH --error ./log/bwa-%J.err

#make index for ref: bwa index ref
ref=/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna
workdir=/phylogenetic_tree/bwa

cd ${workdir}
module load bwa/0.7.17 samtools/1.17

bwa mem -t 8 -M -R "@RG\tID:${brief_id}\tSM:${brief_id}\tLB:WGS\tPL:Illumina" ${ref} ${id}_1.fastq ${id}_2.fastq > ${brief_id}.sam

samtools sort -@ 8 -o ${brief_id}.bam ${brief_id}.sam
