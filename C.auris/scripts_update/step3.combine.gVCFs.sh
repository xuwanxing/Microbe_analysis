echo 'module load gatk/4.3.0' > combine.sh
echo 'gatk --java-options "-Xmx4G -Djava.io.tmpdir=./tmp" CombineGVCFs \' >> combine.sh
echo '-R /refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna \' >> combine.sh
for i in ./gatk/*.g.vcf.gz;do echo '-V '${i}' \' >> combine.sh;done
echo '-O ./gatk/combine_all_raw.g.vcf.gz' >> combine.sh
chmod +x combine.sh
