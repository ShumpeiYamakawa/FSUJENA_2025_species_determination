## Day1

You will learn how to process raw read data and perform annotation using eDNA metabarcoding data from a pond near Halle as test data.

**Download the raw read sequences**
```bash
cd test_meta
mkdir Sample5
#Any names are okay
cd Sample5

wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/Sample5_L001_R1_001.fastq.gz
wget https://github.com/ShumpeiYamakawa/FSUJENA_2025_species_determination/raw/refs/heads/main/Sample5_L001_R2_001.fastq.gz
```


**Viewing the raw data**
```bash
gunzip Sample5_L001_R1_001.fastq.gz
#check the file contents
head Sample5_L001_R1_001.fastq
less Sample5_L001_R1_001.fastq

#change fastaq to fasta
cat Sample5_L001_R1_001.fastq | seqkit fq2fa | head
cat Sample5_L001_R1_001.fastq | seqkit fq2fa | less
#less can be terminated by typing "q"

gzip Sample5_L001_R1_001.fastq
###Do not forget to compress the fastq file!!!
```

**R set up**
```bash
sudo apt update -qq
sudo apt install --no-install-recommends software-properties-common dirmngr
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install --no-install-recommends r-base
```

**Quality check**
```bash
R
#open R console
```

```R

library(dada2)

# Assign the file path to the R objects
fnFs <- c("Sample5_L001_R1_001.fastq.gz")
fnRs <- c("Sample5_L001_R2_001.fastq.gz")
sample.names <- c("Sample5")

#quality check
png("plot_fnFs.png", width=800, height=600)
plotQualityProfile(fnFs)
dev.off()

png("plot_fnRs.png", width=800, height=600)
plotQualityProfile(fnRs)
dev.off()
```

**Filtering**

```R
filtFs <- c(".//filtered/Sample5_L001_R1_filtered_001.fastq.gz")
filtRs <- c(".//filtered/Sample5_L001_R2_filtered_001.fastq.gz")
names(filtFs) <- sample.names
names(filtRs) <- sample.names

out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(200,200),
              maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE,
              compress=TRUE, multithread=TRUE) # On Windows set multithread=FALSE

png("plot_fnFs_filtered.png", width=800, height=600)
plotQualityProfile(filtFs)
dev.off()

png("plot_fnRs_filtered.png", width=800, height=600)
plotQualityProfile(filtRs)
dev.off()
```

**Error rate estimate**

```R
errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)

#you can visualize the error rate using the following commands
#png("plot_error_filtFs.png", width=800, height=600)
#plotErrors(errF, nominalQ=TRUE)
#dev.off()
#png("plot_error_filtRs.png", width=800, height=600)
#plotErrors(errR, nominalQ=TRUE)
#dev.off()
```

**Marge**
```R
dadaFs <- dada(filtFs, err=errF, multithread=TRUE)
dadaFs

dadaRs <- dada(filtRs, err=errR, multithread=TRUE)
dadaRs

mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE)
# Inspect the merger data.frame from the first sample
head(mergers[[1]])
```

**Output to shell**
```R
write.table(mergers, file = "Sample5_asv.csv", row.names=FALSE, sep=",")

q() #terminate R console

```






