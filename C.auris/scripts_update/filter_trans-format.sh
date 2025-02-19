module load gatk/4.3.0 bcftools/1.17 Python/3.11.0
cd ./filter
gatk --java-options "-Xmx20G -Djava.io.tmpdir=../tmp" GenotypeGVCFs -R /refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna \
-V ../gatk/combine_all_raw.g.vcf.gz \
-O combine_all_geno_raw.vcf.gz

gatk --java-options "-Xmx20G -Djava.io.tmpdir=../tmp" VariantFiltration -V combine_all_geno_raw.vcf.gz \
--filter-name "custom_filter" \
--filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0" \
-O combine_all_geno_filter_marked.vcf.gz

bcftools view -f PASS combine_all_geno_filter_marked.vcf.gz -Oz -o combine_all_geno_PASS.vcf.gz

gunzip combine_all_geno_PASS.vcf.gz

/broad-fungalgroup/scripts/SNPs/filterGatkGenotypes.py --min_GQ 50 --min_percent_alt_in_AD 0.8 --min_total_DP 10 combine_all_geno_PASS.vcf > combine_all_geno_PASS_final.vcf 2> combine_all_geno_PASS_final_py_stats.tsv

bcftools stats combine_all_geno_PASS_final.vcf > combine_all_geno_PASS_final_bcftools.stats.txt

gatk --java-options "-Xmx20G -Djava.io.tmpdir=../tmp" SelectVariants -select-type SNP --restrict-alleles-to BIALLELIC -V combine_all_geno_PASS_final.vcf -O combine_all_geno_PASS_final_snp.vcf

python /vcf2phylip/vcf2phylip.py --input combine_all_geno_PASS_final_snp.vcf
