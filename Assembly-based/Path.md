# Assembly-based analysis
Here starts your assembly based analysis. 
After trimming, the assembly based analysis is continued with a few tools: 
- MetaSPAdes 
- Quast 
- Abricate 

## Dependencies 




## Installation 
```
conda install spades = 3.12.0
conda install quast 
conda install abricate 
```
## MetaSPAdes 
Metaspades is a part of spades especially for metagenomic data. 
Metaspades was run in a shell script. 

If run commandline, an error came through

```
#!/bin/bash
#SBATCH -t 20:00:00
#SBATCH -c 16
 
#run metaspades
metaspades.py -o /home/assembly-based/assembly -1 \
/home/trimmeddata/trimmed_R1_paired.fastq -2 \
/home/trimmeddata/trimmed_R2_paired.fastq --only-assembler
 
#change directory to assembly 
cd 
cd /home/assembly-based/assembly
 
#is the assembly there?
ls -la -h 
```
