# Pre-Analysis

Before you can start the read of the assembly-based part of the pipeline, you need to perform the first steps of the pipeline. 

We called this part the pre-analysis. 
# Table of Contents 

* [Dependencies](#Dependencies)
* [Installation](#Installation)
* [FastQC](#FastQC)
* [Trimmomatic](#Trimmomatic)

# Dependencies 
- Fastqc --> java 
- trimmomatic 

# Installation
for the installation of the tools the following 

```
conda install fastqc
conda install trimmomatic 
```

# FastQC

fastqc -o RESULT-DIR INPUT-FILE.[txt/fa/fq]

fastqc -o /home/fastqc/ /home/data/file-R*.fastq


# Trimmomatic 
This was run in a shell script. 
```
trimmomatic PE -phred33 -summary trimsummary.txt \
/home/data/file_R1.fastq \
/home/data/file_R2.fastq \
/home/trimmeddata/file_R1_paired.fastq \
/home/trimmeddata/file_R1_unpaired.fastq \
/home/trimmeddata/file_R2_paired.fastq \
/home/trimmeddata/file_R2_unpaired.fastq \
ILLUMINACLIP:contams_forward_rev.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
```





## External links
### FastQC
* [Source link](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* [Github link](https://github.com/s-andrews/FastQC)

### Trimmomatic 
* [Source link](http://www.usadellab.org/cms/?page=trimmomatic)
* [Github link](https://github.com/timflutre/trimmomatic)
