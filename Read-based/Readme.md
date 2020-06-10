# Read-based analysis 
In the read-based analysis, Ariba was used for antibiotic resistance detection 

## Dependencies 
  * Python3 version >= 3.6.0
  * Bowtie2 version >= 2.1.0
  * CD-Hit version >= 4.6
  * MUMmer version >= 3.23

ARIBA also depends on several Python packages, all of which are available via pip. 

Installing ARIBA with pip3 will get these automatically if not installed:
  * dendropy >= 4.2.0
  * matplotlib >= 3.1.0
  * pyfastaq >= 3.12.0
  * pysam >= 0.9.1
  * pymummer >= 0.10.1
  * biopython
  
  for more information please visit the github page for Ariba! 
  
 ## Installation 
 Ariba can be installed in multiple ways 
 
 Via Conda
 ```
 conda install ariba 
 ```
 
 or 
  
 Via Pip 
 
 ```
 pip3 install ariba
 ```

## Run with Ariba 
To run with ariba, the following command was used. 
This is one example, but was ultimatly run with several databases. 
Script can be found here *insert link* 
```
#get database 
ariba getref argannot out.argannot

#prepare reference data 
ariba prepareref -f out.argannot.fa -m out.argannot.tsv out.argannot.prepareref 

#Run ariba against samples 
ariba run out.argannot.prepareref reads1.fastq reads2.fastq out.run
 ```
 
you can also get a summary file after the run 
for example: 

```
ariba summary out.summary out.run1/report1.tsv out.run2/report2.tsv out.run3/report3.tsv
```

  
 # External Link 
 [Github link](https://github.com/sanger-pathogens/ariba)
 [Github wiki](https://github.com/sanger-pathogens/ariba/wiki)
