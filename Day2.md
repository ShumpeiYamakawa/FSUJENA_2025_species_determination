# Day2

**1. Set up**
```bash
cd ~/test_meta
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/blast_annot_setup.sh
sh blast_annot_setup.sh
```

**2. Copy the csv file to "16s_metazoa_rrna_blast_annot" directory
```bash
cp ~/test_meta/Sample5/Sample5_asv.csv ~/test_meta/16s_metazoa_rrna_blast_annot/
```

**2. BLAST and ectract taxnomy information**
```
#move to the analysis directory
cd  ~/test_meta/16s_metazoa_rrna_blast_annot/
ls
#Check if the csv file that you want to analyze is in the directory!!

sh 16s_metazoa_rrna_blast_annot.sh
## You will see the message "Enter an ASV csv file"
## Type the name of csv file that you want to analyze

## Then you will see the message "Enter a threshold of species determination (identity of blast tophit):"
## Type the number (ex. 95)

## Then analysis will start

## 
