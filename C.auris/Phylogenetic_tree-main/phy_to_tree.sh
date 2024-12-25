# to remove "*"
sed 's/*/-/g' Combine_all_geno_filtered_final_snp.min4.phy > Combine_all_geno_filtered_final_snp_replace_asterisk.min4.phy

#raxml or raxml-ng (long time)
raxmlHPC -x 12345 -p 12345 -# 1000 -m GTRCAT -s Combine_all_geno_filtered_final_snp_replace_asterisk.min4.phy -f a -n raxml_result -T 20

#iqtree (recommended)
iqtree -s Combine_all_geno_filtered_final_snp_replace_asterisk.min4.phy -m GTR -bb 1000 -bnni -nt AUTO -redo

#both raxml and iqtree can only use one-node compute resource, even give resource of more than one-node
