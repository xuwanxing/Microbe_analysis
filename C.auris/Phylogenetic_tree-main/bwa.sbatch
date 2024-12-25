#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --job-name bwa
#SBATCH --output bwa-%J.out
#SBATCH --error bwa-%J.err


/Software/Packages/bwa/bwa mem -t 4 -M -R "@RG\tID:${brief_id}\tSM:${brief_id}\tLB:WGS\tPL:Illumina" /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna ${id}_1.fastq ${id}_2.fastq > /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/bwa/SRR9/${brief_id}.sam

samtools sort -@ 4 -o /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/bwa/SRR9/${brief_id}.bam /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/bwa/SRR9/${brief_id}.sam
