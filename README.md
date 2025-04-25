# FSUJENA_2025_species_determination

Hi, this is description and script that we will use in the practical course. 
I prepared some tasks for those who have already had the skills for Linux or experienced this kind of analysis. 

## Aims
1. Identification of the species from the eDNA sequences
2. Reconstruction of the phylogeny of the species 

You will learn...  
・Usage of the command line and Linux  
・Installing the bioinformatic tools/software  
・Usage of the software  
・Interpretation of the basic bioinformatic analysis (blast, alignment, phylogenic tree)  

## Schedule
Day0
1. Creating the google cloud shell account

Day1  
1. Basic commands of Linux
2. Installing the software

Day2
1. Handling of fasta file (the usage of seqkit)
2. BLAST search

Day3
1. Alignment and trimming
2. Maximum-likehood tree
3. Tree visualization

## Day0
## Google Could shell 
To use the same environment for the analysis, please make it available to use Googl Cloud Shell, an online shell of Linux. 


# Day1: Installing the software





```bash
trimal -in input.aln -out output.aln -htmlout output.html -gt 0.9 -cons 60
