# Day2

I am providing a customized script for performing a BLAST search against 35,267 metazoan 16S rRNA sequences and extracting taxonomic information (NCBI taxonomy, including phylum and class). Please note that the script is roughly designed and not formatted for publication-level use, so you may encounter missing or blank fields in some cases.


**1. Set up**
```bash
cd ~/test_meta
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/blast_annot_setup.sh
sh blast_annot_setup.sh
```

**2. Copy the csv file to "16s_metazoa_rrna_blast_annot" directory**
```bash
cp ~/test_meta/Sample5/Sample5_asv.csv ~/test_meta/16s_metazoa_rrna_blast_annot/
```

**3. BLAST and extract taxonomy information**
```bash
#move to the analysis directory
cd  ~/test_meta/16s_metazoa_rrna_blast_annot/
ls
#Check if the csv file that you want to analyze is in the directory!!

sh 16s_metazoa_rrna_blast_annot.sh
## You will see the message "Enter an ASV csv file"
## Type the name of csv file that you want to analyze

## Then you will see the message "Enter a threshold of species determination (identity of blast tophit):"
## Type the number (ex. 95)

## Then the analysis will start

===========================================================================================================
## The following is an example of the results...

#Enter an ASV csv file: Sample5_asv.csv
#Enter a threshold of species determination (identity of blast tophit): 95
###
#Setting
 
#blastn seqrch / database: 35267 seqs of 16S ribosormal RNA from NCBI Genbank
#Extract taxonomic information from NCBI Taxonomy (using taxonkit: doi 10.1016/j.jgg.2021.03.006)
 
###
#Analysis
 
#Create a fasta file
#Start blast search
#Complete blast search
#Search taxnomony
#Extract taxonomy
#Summarize
#done!
 
#####
#Results
 
#Abandance: total 31661 reads
#16 species was identified
 
#Phylum 	 	 Class 	 Species 	 blast_tophit 	 blast_ident 	 abundance 	 seqs
#-------------------------------------------------------------------------------------------
#Rotifera	Eurotatoria	Keratella quadrata	AF499046.1	99.010	4439	seq6,seq8,seq18,seq21,seq27,seq29,seq34,seq40,seq120
#-------------------------------------------------------------------------------------------
 
#Output files are in Sample5_asv.csv_95


```

## Tasks
Please profile the animal species in the following two freshwater datasets (Sample 6 and Sample 7). The sampling and sequencing methods are the same as those used for the test data (Sample 5). Follow the scripts you used on Day 1 and Day 2.

1. Create a new directory for each dataset under the test_meta directory (e.g., Sample6 and Sample7).

2. Move to each directory and download the sequence datasets (see details below).

3. Load the data into R and check the quality using dada2.

4. Generate and save an ASV file for each dataset using dada2.

5. Copy the ASV files to the 16s_metazoa... directory.

6. Annotate the sequences.

7. Try processing another sample.


```bash
#Sample6
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/Sample6_L001_R1_001.fastq.gz
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/Sample6_L001_R2_001.fastq.gz


#Sample7
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/Sample7_L001_R1_001.fastq.gz
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/Sample7_L001_R2_001.fastq.gz
```
