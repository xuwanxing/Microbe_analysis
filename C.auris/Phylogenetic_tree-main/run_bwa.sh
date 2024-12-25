#!/bin/bash

prefix=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/bwa/


for i in /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/qc/fastqs/SRR9/results/part3/*_1.fastq
do
  id=${i%_*}
  med_id=${id##*/}
  brief_id=${med_id%%_*}
  export id
  export brief_id
  sbatch_file=$(echo $prefix'bwa_SRR9.sbatch')
  sbatch $sbatch_file
done
