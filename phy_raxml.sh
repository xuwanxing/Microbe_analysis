# to remove "*"
sed 's/*/-/g' Combine_all_geno_filtered_final_snp.min4.phy > Combine_all_geno_filtered_final_snp_replace_asterisk.min4.phy

raxmlHPC -x 12345 -p 12345 -# 1000 -m GTRCAT -s Combine_all_geno_filtered_final_snp_replace_asterisk.min4.phy -f a -n raxml_result -T 20
