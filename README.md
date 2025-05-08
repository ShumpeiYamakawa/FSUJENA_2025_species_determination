# FSUJENA 2025 species determination

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
To use the same environment for the analysis, please make it available to use Google Cloud Shell, an online shell of Linux (Debian, x86_64). We will use a free version of this cloud service, which can use Linux basic command line and 5GB storage (see the documentation: https://cloud.google.com/shell/docs). The Google account is required. If you have the account, just go to the following link: https://shell.cloud.google.com/

**Optional**

The free version of the cloud shell is only for temporary use for the course. If you do not use the shell for 120 days, your account will be removed. There is also a usage limit (50 hours per week). So, in order to use the same environment after this course and continue the analysis, it would be good to set up the environment on your own computer. If you want to do this, see the following... 

**Linux users**: run the analysis on your terminal instead of using Google Cloud Shell

**Mac users**: same as Linux users, but some commands do not work with the default (e.g. wget), so you need to install some software as shown below.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ##Install Homebrew
brew install wget ##install wget
```

**Windows users**: You need to set up your Linux (Ubuntu) environment first. You can open a Linux shell after installation and use it for analysis.

```bash
wsl --install
wsl
```

## Day1
## Basic commands of Linux
See the following link about Linux basic commands. The followings are the notes on some commands.

cd

mkdir

ls

cat

awk

grep


## Installing the software

**blast**
```bash
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.16.0+-x64-linux.tar.gz
tar -xvzf ncbi-blast-2.16.0+-x64-linux.tar.gz
echo 'export PATH="/home/shumpei_yamakawa/test/ncbi-blast-2.16.0+/bin:$PATH"' >> ~/.bashrc; source ~/.bashrc
```

**mafft**
```bash
wget https://mafft.cbrc.jp/alignment/software/mafft-7.525-without-extensions-src.tgz
cd core
make clean; make; sudo make install
```

**trimal**
```bash
wget https://github.com/inab/trimal/releases/download/v1.5.0/trimAl_Linux_x86-64.zip
unzip trimAl_Linux_x86-64.zip
echo 'export PATH="/home/shumpei_yamakawa/test/trimal-trimAl/source:$PATH"' >> ~/.bashrc;  source ~/.bashrc
```

**RAxML**
```bash
wget https://github.com/stamatak/standard-RAxML.git
unzip master.zip
cd standard-RAxML-master/
make -f Makefile.gcc 
rm *.o
make -f Makefile.SSE3.gcc 
rm *.o
make -f Makefile.PTHREADS.gcc 
rm *.o
make -f Makefile.SSE3.PTHREADS.gcc
echo 'export PATH="/home/shumpei_yamakawa/test/standard-RAxML-master:$PATH"' >> ~/.bashrc;  source ~/.bashrc
```

**seqkit**
```bash
wget https://github.com/shenwei356/seqkit/releases/download/v2.10.0/seqkit_linux_amd64.tar.gz
tar -xvzf seqkit_linux_amd64.tar.gz 
sudo cp seqkit /usr/local/bin/ 
```


```bash
trimal -in input.aln -out output.aln -htmlout output.html -gt 0.9 -cons 60
