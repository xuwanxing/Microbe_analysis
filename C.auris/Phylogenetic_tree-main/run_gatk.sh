#!/bin/bash

prefix=/gatk/

for i in /bwa/*.bam
do
  id=${i%.*}
  short_id=${id##*/}
  export id
  export short_id
  sbatch_file=$(echo $prefix'gatk.sbatch')
  sbatch $sbatch_file
done
