#!/bin/bash
#SBATCH -t 2:00:00
#SBATCH -c 16

#Run with ARGAnnot 
echo "running with arg-annot"

#get database 
ariba getref argannot out.argannot

#prepare reference data 
ariba prepareref -f out.argannot.fa -m out.argannot.tsv out.argannot.prepareref 

#Run ariba against samples 
ariba run out.argannot.prepareref \ --assembly_cov 60 --nucmer_min_id 90
/home/data/file-R1.fastq \
/home/data/file-R2.fastq \
/home/read-based/ariba/raw/out_arg_raw.run

#are the files there? 
echo "it worked"
ls -la 

#Run with CARD
echo "running with CARD"

#get database 
ariba getref card out.card

#prepare reference data 
ariba prepareref -f out.card.fa -m out.card.tsv out.card.prepareref 

#Run ariba against samples 
ariba run out.card.prepareref \ --assembly_cov 60 --nucmer_min_id 90
/home/data/file-R1.fastq \
/home/data/file-R2.fastq \
/home/read-based/ariba/raw/out_card_raw.run

#are the files there? 
echo "it worked"
ls -la 

#Run with ncbi
echo "running with ncbi"

#get database 
ariba getref ncbi out.ncbi

#prepare reference data 
ariba prepareref -f out.ncbi.fa -m out.ncbi.tsv out.ncbi.prepareref 

#Run ariba against samples 
ariba run out.ncbi.prepareref \ --assembly_cov 60 --nucmer_min_id 90
/home/data/file-R1.fastq \
/home/data/file-R2.fastq \
/home/read-based/ariba/raw/out_ncbi_raw.run

#are the files there? 
echo "it worked"
ls -la 

#Run with resfinder 
echo "running with resfinder"

#get database 
ariba getref resfinder out.resfinder

#prepare reference data 
ariba prepareref -f out.resfinder.fa -m out.resfinder.tsv out.resfinder.prepareref 

#Run ariba against samples 
ariba run out.resfinder.prepareref \ --assembly_cov 60 --nucmer_min_id 90
/home/data/file-R1.fastq \
/home/data/file-R2.fastq \
/home/read-based/ariba/raw/out_resfinder_raw.run

#are the files there? 
echo "it worked"
ls -la 

#all the databases have run 
echo "all done" 




