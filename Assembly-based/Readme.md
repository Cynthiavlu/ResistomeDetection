# Assembly-based analysis
Here starts your assembly based analysis. 
After trimming, the assembly based analysis is continued with a few tools: 
- MetaSPAdes 
- Quast 
- Abricate 

## Dependencies 
### MetaSPAdes 
- Python3 v3.2 or higher 

### Quast 
- Python3 v3.3 or higher
- Perl 5.6.0 or higher
- GCC 4.7 or higher
- GNU make and ar
- zlib development files

### Abricate
- BLAST+ >= 2.7 and any2fasta

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
metaspades.py -o /home/assembly-based/assembly/metaspades\ 
-1 /home/trimmeddata/trimmed_R1_paired.fastq \
-2 /home/trimmeddata/trimmed_R2_paired.fastq --only-assembler
 
#change directory to assembly 
cd 
cd /home/assembly-based/assembly
 
#is the assembly there?
ls -la -h 
```
## Quast 
Quast is used to perform quality control on the contigs made by metaSPAdes.

This was run in a shell script. 
```
#!/bin/bash
#SBATCH -t 2:00:00
#SBATCH -c 16

#run quast on contigs 
quast -o /home/assembly-based/assembly/quast/\
/home/assembly-based/assembly/metaspades/contigs.fasta
```
if you have small contigs interfering in your data you can filter there with the filter contigs script. 

[filter contigs script](https://github.com/Cynthiavlu/ResistomeDetection/blob/master/Assembly-based/scripts/filtercontigs.py)

## Abricate 
Abricate was used for antibiotic resistance detection. 
This was run in a shell script.


This is an example of our command for abricate. complete script can be found here: 
[abricate script](https://github.com/Cynthiavlu/ResistomeDetection/blob/master/Assembly-based/scripts/runabricate.sh)

```
#run abricate with argannot
echo "run with argannot"
abricate --db argannot --minid 90 --mincov 60\
/home/assembly-based/assembly/trimmeddata/filteredcontigs/longcontigs.trimmed.fasta > \
/home/assembly-based/abricate/trimmeddata/filteredcontigs/longcontigs/abricate_argannot_trlong.csv
```

Due to different annotation in the different databases used with abricate, a python script was made in order to clean up the summart file.

For example, Three Cbla genes were found within the different databases but were seen as different genes because of there annotation: (Bla)cbla, Cbla_1, cbla. With the following script some of those were filtered en cleaned for the obtained summary file 

[filecleaning script](https://github.com/Cynthiavlu/ResistomeDetection/blob/master/Assembly-based/scripts/file_cleaning.py)

# External links 
## MetaSPAdes 
[github link](https://github.com/ablab/spades)

## Quast
[Github link](https://github.com/ablab/quast)

## Abricate
[Github link](https://github.com/tseemann/abricate)
