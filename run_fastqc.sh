ls *.fastq | while read id;do (nohup /Software/Packages/FastQC/fastqc -o ./fastqc $id &);done
