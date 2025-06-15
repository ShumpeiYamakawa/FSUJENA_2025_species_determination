# Day2

The following scripts are for t


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
#Arthropoda	Branchiopoda	Daphnia longispina	JN874595.1	97.521	128	seq63
#Arthropoda	Branchiopoda	Eubosmina cf.	EU650685.1	98.347	67	seq93
#Arthropoda	Branchiopoda	Scapholeberis mucronata	EF189615.1	98.326	33	seq114
#Arthropoda	Branchiopoda	Simocephalus vetulus	LC382447.1	97.531	36	seq113
#Arthropoda	Insecta	Cloeon dipterum	LC801945.1	96.680	43	seq109
#Bryozoa	Phylactolaemata	Plumatella repens	DQ305341.1	98.438	31	seq115
#Chordata	Actinopteri	Carassius auratus	DQ868870.1	99.674	59	seq101
#Chordata	Actinopteri	Gasterosteus aculeatus	DQ027919.1	99.340	135	seq59
#Chordata	Actinopteri	Leucaspius delineatus	NC_020357.1	99.342	68	seq92
#Chordata	Actinopteri	Pseudorasbora interrupta	MN175390.1	99.342	5	seq125
#Chordata	Amphibia	Bufo bufo	JN647011.1	99.669	202	seq54,seq100
#Chordata	Amphibia	Pelophylax lessonae	MH105105.1	99.656	16	seq118
#Chordata	Amphibia	Rana temporaria	KC977158.1	100.000	96	seq80
#Chordata	Aves	Gallinula chloropus	DQ485864.1	98.635	38	seq112
#Chordata	Mammalia	Myocastor coypus	AF422886.1	99.281	4	seq126
#Rotifera	Eurotatoria	Keratella quadrata	AF499046.1	99.010	4439	seq6,seq8,seq18,seq21,seq27,seq29,seq34,seq40,seq120
#-------------------------------------------------------------------------------------------
 
#Output files are in Sample5_asv.csv_95


```
