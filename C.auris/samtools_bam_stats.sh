for bamfile in ./*.bam; do
  echo "Processing $bamfile..." >> ./mapping_stats_summary.log
  samtools flagstat "$bamfile" >> ./mapping_stats_summary.log
  echo "Done processing $bamfile" >> ./mapping_stats_summary.log
  echo "" >> ./mapping_stats_summary.log
done
