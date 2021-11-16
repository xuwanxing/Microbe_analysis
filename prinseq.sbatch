#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --job-name Prinseq
#SBATCH --output Prinseq-%J.out
#SBATCH --error Prinseq-%J.err


prinseq-lite.pl -fastq ${id}_1.fastq -fastq2 ${id}_2.fastq -trim_left 15 -trim_qual_left 20 -trim_qual_right 20 -min_len 100 -min_qual_mean 25 -derep 14 -out_good ${id}_qual_filtered -out_bad null -log ${id}.log
