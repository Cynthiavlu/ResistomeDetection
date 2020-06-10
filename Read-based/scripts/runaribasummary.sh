#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -c 16

#run summary on reports on raw data 
ariba summary summary_raw_out \
/home/read-based/ariba/raw/out_raw_argannot.run/report.tsv \
/home/read-based/ariba/raw/out_raw_ncbi.run/report.tsv \
/home/read-based/ariba/raw/out_raw_card.run/report.tsv \
/home/read-based/ariba/raw/out_raw_resfinder.run/report.tsv \

#run summary on reports on trimmed data 
ariba summary summary_trimmed_out \
/home/read-based/ariba/out_raw_argannot.run/report.tsv \
/home/read-based/ariba/out_trimmed_argannot.run/report.tsv \
/home/read-based/ariba/out_trimmed_ncbi.run/report.tsv \
/home/read-based/ariba/out_trimmed_card.run/report.tsv \
/home/read-based/ariba/out_trimmed_resfinder.run/report.tsv
