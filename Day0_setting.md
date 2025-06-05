# Day0:

To ensure a smooth start to the analysis, please set up your environment and install the software we will use in the course by following the instructions below. If you encounter any issues during the setup, **contact me before the course begins!**. You can either visit my office or send an email to shumpei.yamakawa**@**gmail.com (remove **). 


****For a tutorial on installation, see Day0.pdf, which was uploaded to this GitHub page.****


## 1. Google Could shell Setup

Unlike desktop applications, most software used for bioinformatic analysis runs only through the command line (CUI: Character User Interface). In particular, many of these programs are specifically designed for use on the Linux operating system. We will thus use a Linux OS environment in this course. 

To ensure a consistent analysis environment, please set up access to Google Cloud Shell, an online Linux shell (Debian, x86_64). We will use the free version of this cloud service, which provides a basic Linux command-line interface and 5 GB of storage. For more details, refer to the official documentation: https://cloud.google.com/shell/docs.
A Google account is required. If you already have one, simply go to the following link to get started: https://shell.cloud.google.com/



###
**Optional**

The free version of Google Cloud Shell is intended for temporary use. For example, if you don’t use the shell for 120 days, your account will be deactivated. There is also a usage limit of 50 hours per week. Therefore, if you wish to continue using the same environment after the course and carry on with your analyses, it is recommended that you set up the environment on your own computer. If you’d like to do this, please refer to the following instructions...

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

## 2. Basic Linux commands

Unfortunately, we don’t have enough time to start from the very basics of command line usage. If you are not familiar with Linux command lines, please refer to the following link for an introduction to basic Linux commands. I have also included some tutorials about command lines in the slides (Day0.pdf).
If you still have difficulties, don’t hesitate to contact me! I can help you learn how to use the shell and other basics.

**Turotial:** https://ubuntu.com/tutorials/command-line-for-beginners#1-overview

## 3. Installing the software

The following software is required for the analysis. In most cases, you can simply copy and paste the commands into your terminal to check if they are working. Illustrated instructions are provided in Day0.pdf. Please install the software step by step, following the commands below and the slides.


**1. Creating the working directory and moving to there**
```bash
makir test_meta
cd test_meta
```

**2. blast**

See also https://www.ncbi.nlm.nih.gov/books/NBK569861/

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

The software for manipulating the sequence files. See also https://bioinf.shenwei.me/seqkit/

```bash
cd ~/test_meta
#move to the test directory
wget https://github.com/shenwei356/seqkit/releases/download/v2.10.0/seqkit_linux_amd64.tar.gz
tar -xvzf seqkit_linux_amd64.tar.gz 
sudo cp seqkit /usr/local/bin/

seqkit -h
#If you see the description about Blast Search, then the installation worked.
```

**4. update/developer environments**
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

**5. R**

R is a programming language and software environment for statistical computing, data analysis, and visualization. See also https://www.r-project.org/

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

R
# If you type "R", you will open the R console (interactive session) as follows. 
#R version 4.5.0 (2025-04-11) -- "How About a Twenty-Six"
#Copyright (C) 2025 The R Foundation for Statistical Computing
#Platform: x86_64-pc-linux-gnu

#R is free software and comes with ABSOLUTELY NO WARRANTY.
#You are welcome to redistribute it under certain conditions.
#Type 'license()' or 'licence()' for distribution details.

#  Natural language support but running in an English locale

#R is a collaborative project with many contributors.
#Type 'contributors()' for more information and
#'citation()' on how to cite R or R packages in publications.

#Type 'demo()' for some demos, 'help()' for on-line help, or
#'help.start()' for an HTML browser interface to help.
#Type 'q()' to quit R.

```

**6. dada2: the R package for metabarcoding analysis**

R provides a lot of the "packages" which are designed for specific analysis, and the package "dada2" performs to "infer exact amplicon sequence variants (ASVs) from amplicon data (https://benjjneb.github.io/dada2/)". This package needs to be installed in R console.

```R
# install the softwares
install.packages(c("RcppEigen", "png", "deldir", "interp", "latticeExtra"))
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("ShortRead")
BiocManager::install("dada2")
library(dada2)
packageVersion("dada2")



#Can you see the version of dada2? If so, dada2 was correctly installed!

q()
#This terminates R console and go back to bash terminal
```
