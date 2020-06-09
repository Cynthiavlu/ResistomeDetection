#!/bin/bash
#SBATCH -t 5:00:00
#SBATCH -c 16

#run abricate with argannot
echo "run with argannot"
abricate --db argannot --minid 90 --mincov 60\
/home/assembly-based/assembly/trimmeddata/filteredcontigs/longcontigs.trimmed.fasta > \
/home/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/abricate_argannot_trlong.csv

#run abricate with card
echo "run with card"
abricate --db card --minid 90 --mincov 60\
/home/assembly-based/assembly/trimmeddata/filteredcontigs/longcontigs.trimmed.fasta > \
/home/mumc/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/abricate_card_trlong.csv

#run abricate with ncbi
echo "run with ncbi"
abricate --db ncbi --minid 90 --mincov 60\
/home/mumc/assembly-based/assembly/trimmeddata/filteredcontigs/longcontigs.trimmed.fasta > \
/home/mumc/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/abricate_ncbi_trlong.csv

#run abricate with resfinder
echo "run with resfinder"
abricate --db resfinder --minid 90 --mincov 60\
/home/mumc/assembly-based/assembly/trimmeddata/filteredcontigs/longcontigs.trimmed.fasta > \
/home/mumc/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/abricate_resfinder_trlong.csv

#change to the directory where files are supposed to be saved
cd /home/mumc/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs
echo "directory where files are saved"

#is it there 
echo "are all the files there?"
ls -la -h

#make a summary
echo "let's make a summary"
abricate --summary  /home/mumc/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/*.csv > \
/home/mumc/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/Summaryabricatetrlong.csv
