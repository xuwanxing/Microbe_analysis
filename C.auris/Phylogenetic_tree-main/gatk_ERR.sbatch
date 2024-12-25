#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --job-name gatk
#SBATCH --output gatk-%J.out
#SBATCH --error gatk-%J.err

java -Xmx4g -Djava.io.tmpdir=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/tmp -jar /Software/Packages/picard.jar MarkDuplicates I=${id}.bam O=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/ERR/${short_id}_markdup.bam M=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/ERR/${short_id}_markdup_metrics.txt

samtools index /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/ERR/${short_id}_markdup.bam

gatk --java-options "-Xmx4G -Djava.io.tmpdir=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/tmp" HaplotypeCaller -R /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna -I /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/ERR/${short_id}_markdup.bam -ERC GVCF -O /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/ERR/${short_id}_raw.g.vcf.gz
