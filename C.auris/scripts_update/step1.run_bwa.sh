#!/bin/bash

prefix=/phylogenetic_tree/data/

for i in /fastq/*_1.fastq
do
  id=${i%_*}
  med_id=${id##*/}
  brief_id=${med_id%%_*}
  export id
  export brief_id
  sbatch_file=$(echo $prefix'bwa.sbatch')
  sbatch $sbatch_file
done
