gatk --java-options "-Xmx20G -Djava.io.tmpdir=./tmp" GenotypeGVCFs -R /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna -V Combine_all_raw.g.vcf.gz -O Combine_all_geno_raw.vcf.gz

gatk --java-options "-Xmx20G -Djava.io.tmpdir=./tmp" VariantFiltration -V Combine_all_geno_raw.vcf.gz --filter-name "custom_filter" --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0" -O Combine_all_geno_vr_filtered.vcf.gz

gunzip Combine_all_geno_vr_filtered.vcf.gz

/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/broad-fungalgroup/scripts/SNPs/filterGatkGenotypes.py --min_GQ 50 --min_percent_alt_in_AD 0.8 --min_total_DP 10 Combine_all_geno_vr_filtered.vcf > Combine_all_geno_filtered_final.vcf 2> Combine_all_geno_filtered_final_stats.tsv

gatk --java-options "-Xmx20G -Djava.io.tmpdir=./tmp" SelectVariants -select-type SNP -V Combine_all_geno_filtered_final.vcf -O Combine_all_geno_filtered_final_snp.vcf

python /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/vcf2phylip/vcf2phylip.py --input Combine_all_geno_filtered_final_snp.vcf
