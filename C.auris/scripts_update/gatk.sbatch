#!/bin/bash
#SBATCH --partition=debug
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 8
#SBATCH --job-name gatk
#SBATCH --output ./log/gatk-%J.out
#SBATCH --error ./log/gatk-%J.err

#make ".dict or .fai": gatk CreateSequenceDictionary -R reference.fa -O reference.dict; samtools faidx reference.fa
ref=/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna
workdir=phylogenetic_tree/gatk
picard_path=/apps/picard.jar
cd ${workdir}
module load gatk/4.3.0 samtools/1.17
java -Xmx4g -Djava.io.tmpdir=../tmp -jar ${picard_path} MarkDuplicates I=${id}.bam O=${short_id}_markdup.bam M=${short_id}_markdup_metrics.txt

samtools index ${short_id}_markdup.bam

#notice: --ploidy 1
gatk --java-options "-Xmx4G -Djava.io.tmpdir=../tmp" HaplotypeCaller -R ${ref} -I ${short_id}_markdup.bam -ERC GVCF -O ${short_id}_raw.g.vcf.gz
