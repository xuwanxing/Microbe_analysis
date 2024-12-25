gatk --java-options "-Xmx4G -Djava.io.tmpdir=./tmp" CombineGVCFs \
-R /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna \
-V DRR_all_raw.g.vcf.gz \
-V ERR_all_raw.g.vcf.gz \
-V SE_all_raw.g.vcf.gz \
-V SRR10_all_raw.g.vcf.gz \
-V SRR11_all_raw.g.vcf.gz \
-V SRR12_all_raw.g.vcf.gz \
-V SRR13_all_raw.g.vcf.gz \
-V SRR14_all_raw.g.vcf.gz \
-V SRR16_all_raw.g.vcf.gz \
-V SRR38_all_raw.g.vcf.gz \
-V SRR62_all_raw.g.vcf.gz \
-V SRR71_all_raw.g.vcf.gz \
-V SRR75_all_raw.g.vcf.gz \
-V SRR76_all_raw.g.vcf.gz \
-V SRR79_all_raw.g.vcf.gz \
-V SRR9_all_raw.g.vcf.gz \
-O Combine_all_raw.g.vcf.gz
