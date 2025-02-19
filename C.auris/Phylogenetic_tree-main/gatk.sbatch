#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --job-name gatk
#SBATCH --output gatk-%J.out
#SBATCH --error gatk-%J.err

java -Xmx4g -Djava.io.tmpdir=/gatk/tmp -jar picard.jar MarkDuplicates I=${id}.bam O=/gatk/ERR/${short_id}_markdup.bam M=/gatk/ERR/${short_id}_markdup_metrics.txt

samtools index /gatk/ERR/${short_id}_markdup.bam

gatk --java-options "-Xmx4G -Djava.io.tmpdir=/gatk/tmp" HaplotypeCaller -R GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna -I /gatk/ERR/${short_id}_markdup.bam -ERC GVCF -O /gatk/ERR/${short_id}_raw.g.vcf.gz
