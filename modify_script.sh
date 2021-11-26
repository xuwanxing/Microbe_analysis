for i in SRR9 SRR10 SRR11 SRR12 SRR13 SRR14 SRR16 SRR38 SRR62 SRR71 SRR75 SRR76 SRR79;do cp gatk_ERR.sbatch gatk_${i}.sbatch;cp run_gatk_ERR.sh run_gatk_${i}.sh;done

for i in SRR9 SRR10 SRR11 SRR12 SRR13 SRR14 SRR16 SRR38 SRR62 SRR71 SRR75 SRR76 SRR79;do sed -i "s/ERR/${i}/g" gatk_${i}.sbatch;sed -i "s/ERR/${i}/g" run_gatk_${i}.sh;done
