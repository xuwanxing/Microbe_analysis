#!/bin/bash

prefix=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/qc/


for i in /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/qc/fastqs/SRR13/*_1.fastq
do
  id=${i%_*}
  export id
  sbatch_file=$(echo $prefix'prinseq.sbatch')
  sbatch $sbatch_file
done
