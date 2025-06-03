# Environmental DNA (eDNA) Metabarcoding /FSUJENA 2025 species determination corse

Hi, this is description and script that we will use in the practical course. 
I prepared some tasks for those who have already had the skills for Linux or experienced this kind of analysis. 

## Contents
**Day 1** 

1. Overview of the eDNA metabarcoding analysis

2. Metabarcoding analysis 1: Getting the amplicon sequences from raw data 1

**Day 2** 

1. Metabarcoding analysis 2: Annotation of the amplicon sequences

2. Metabarcoding analysis 3: Making an annotation table

**Day 3** 

1. Own 


## Day0:

**To start the analysis smoothly, set up the environments and install some software with reference to the following**

## Google Could shell 
To use the same environment for the analysis, please make it available to use Google Cloud Shell, an online shell of Linux (Debian, x86_64). We will use a free version of this cloud service, which can use Linux basic command line and 5GB storage (see the documentation: https://cloud.google.com/shell/docs). The Google account is required. If you have the account, just go to the following link: https://shell.cloud.google.com/

**Optional**

The free version of the cloud shell is only for temporary use for the course. If you do not use the shell for 120 days, your account will be removed. There is also a usage limit (50 hours per week). So, in order to use the same environment after this course and continue the analysis, it would be good to set up the environment on your own computer. If you want to do this, see the following... 

**Linux users**: run the analysis on your "Terminal" instead of using Google Cloud Shell

**Mac users**: same as Linux users ("Terminal" can be found in the "Utilities" folder), but some commands do not work with the default (e.g. wget), so you need to install some software as shown below.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ##Install Homebrew
brew install wget ##install wget
```

**Windows users**: You need to set up your Linux (Ubuntu) environment first. You can open a Linux shell after installation and use it for analysis.

```bash
wsl --install
wsl
```

## Basic commands of Linux
If you are not familiar with the Linux command lines, see the following link about Linux basic commands. 

**Turotial:** https://ubuntu.com/tutorials/command-line-for-beginners#1-overview

## Installing the software
The following software is required for the analysis. Mainly, you can just copy and paste them in your terminal and see if they are working.
You need to change the directory path and so on according to your location.

**1. Creating the working directory and moving to there**
```bash
makir test_meta
cd test_meta
```

**2. blast**
```bash
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.16.0+-x64-linux.tar.gz
tar -xvzf ncbi-blast-2.16.0+-x64-linux.tar.gz
cd ncbi-blast-2.16.0+/bin
pwd 
#Copy the displayed path!! 
echo 'export PATH="**YOUR PATH***:$PATH"' >> ~/.bashrc; source ~/.bashrc
#Paste the path you copied to ***YOUR PATH***!!

blastp -h
#If you see the description about Blast Search, then the installation worked.
```

**3. seqkit**
```bash
cd ~/test_meta
#move to the test directory
wget https://github.com/shenwei356/seqkit/releases/download/v2.10.0/seqkit_linux_amd64.tar.gz
tar -xvzf seqkit_linux_amd64.tar.gz 
sudo cp seqkit /usr/local/bin/

seqkit -h
#If you see the description about Blast Search, then the installation worked.
```

**4. R**
```bash
cd ~/test_meta
#move to the test directory

# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the repo from CRAN -- lsb_release adjusts to 'noble' or 'jammy' or ... as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
# install R itself
sudo apt install --no-install-recommends r-base

```

**5. update/developer environments**
```bash
sudo apt update
sudo apt install -y \
    liblapack-dev \
    libblas-dev \
    gfortran \
    libpng-dev \
    libgsl-dev \
    libtiff5-dev \
    libjpeg-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libxt-dev \
    libfftw3-dev \
    libreadline-dev \
    zlib1g-dev \
    libx11-dev \
    libncurses-dev \
    libbz2-dev \
    liblzma-dev
```

**dada2**
```bash
R
```

```R
# install the softwares
install.packages(c("RcppEigen", "png", "deldir", "interp", "latticeExtra"))
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("ShortRead")
BiocManager::install("dada2")
```





