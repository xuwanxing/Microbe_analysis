#!/bin/bash

prefix=/nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/gatk/

for i in /nfs01data1/Groups/Liuningning/fungal_pathogen/analysis/sraTofastq/bwa/ERR/part2/*.bam
do
  id=${i%.*}
  short_id=${id##*/}
  export id
  export short_id
  sbatch_file=$(echo $prefix'gatk_ERR.sbatch')
  sbatch $sbatch_file
done
