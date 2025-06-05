## Day1

**Download the raw read sequences**
```bach
cd test_meta
mkdir Sample5
cd Sample5

wget
wget
```

**scripts**

```R

library(dada2)
path <- "./" # fastq.gz が入ったフォルダの名前を入れる
head( list.files(path) )　# list.files() で指定したフォルダの中身を確認。head() で最初の6個だけ表示

fnFs <- sort(list.files(path, 
                        pattern="_R1_001.fastq", 
                        full.names = TRUE) )

fnRs <- sort( list.files(path, 
                         pattern="_R2_001.fastq", 
                         full.names = TRUE))

sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)

png("plot_fnFs.png", width=800, height=600)
plotQualityProfile(fnFs[1:2])                                                                                                                                                          
dev.off()

png("plot_fnRs.png", width=800, height=600)
plotQualityProfile(fnRs[1:2])                                                                                                                                                          
dev.off()

filtFs <- file.path(path, "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path(path, "filtered", paste0(sample.names, "_R_filt.fastq.gz"))

names(filtFs) <- sample.names
names(filtRs) <- sample.names

out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(150,100),
              maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE,
              compress=TRUE, multithread=TRUE) # On Windows set multithread=FALSE

errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)

png("plot_error_filtFs.png", width=800, height=600)
plotErrors(errF, nominalQ=TRUE)
dev.off()

png("plot_error_filtRs.png", width=800, height=600)
plotErrors(errR, nominalQ=TRUE)
dev.off()

dadaFs <- dada(filtFs, err=errF, multithread=TRUE)
dadaRs <- dada(filtRs, err=errR, multithread=TRUE)

dadaFs
dadaRs

mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE)
# Inspect the merger data.frame from the first sample
head(mergers[[1]])

seqtab <- makeSequenceTable(mergers)
dim(seqtab)

 wget https://zenodo.org/records/1172783/files/silva_nr_v132_train_set.fa.gz

taxa <- assignTaxonomy(seqtab.nochim, "~/tax/silva_nr_v132_train_set.fa.gz", multithread=TRUE)






```
