mkdir tmp
echo 'gatk --java-options "-Xmx4G -Djava.io.tmpdir=./tmp" CombineGVCFs \' > combine.sh
echo '-R /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/refs/GCA_002759435.2_Cand_auris_B8441_V2_genomic.fna \' >> combine.sh
for i in *.g.vcf.gz;do echo '-V '${i}' \' >> combine.sh;done
echo '-O Combine_all_raw.g.vcf.gz' >> combine.sh
chmod +x ./combine.sh
./combine.sh
