#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --job-name bwa
#SBATCH --output bwa-%J.out
#SBATCH --error bwa-%J.err


bwa mem -t 4 -M -R "@RG\tID:${brief_id}\tSM:${brief_id}\tLB:WGS\tPL:Illumina" GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna ${id}_1.fastq ${id}_2.fastq > /bwa/SRR9/${brief_id}.sam

samtools sort -@ 4 -o /bwa/${brief_id}.bam /bwa/${brief_id}.sam
