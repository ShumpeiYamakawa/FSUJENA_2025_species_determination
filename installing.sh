#!/bin/bash

mkdir -p ~/test_meta
cd test_meta

echo " "
echo "----------------------------------------"
echo "installing blast..."
echo " "

wget https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.16.0+-x64-linux.tar.gz
tar -xvzf ncbi-blast-2.16.0+-x64-linux.tar.gz
cd ncbi-blast-2.16.0+/bin
echo "export PATH=\"$(pwd):\$PATH\"" >> ~/.bashrc; source ~/.bashrc

cd ~/test_meta

echo " "
echo "----------------------------------------"
echo "installing seqkit..."
echo " "

wget https://github.com/shenwei356/seqkit/releases/download/v2.10.0/seqkit_linux_amd64.tar.gz
tar -xvzf seqkit_linux_amd64.tar.gz
mkdir seqkit_dir
mv seqkit seqkit_dir/
cd seqkit_dir
p=$(pwd)
echo 'export PATH="$p:$PATH"' >> ~/.bashrc; source ~/.bashrc

echo " "
echo "----------------------------------------"
echo "installing developers..."
echo " "
echo " "

sudo DEBIAN_FRONTEND=noninteractive apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y \
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


echo " "
echo "----------------------------------------"
echo "installing R..."
echo " "

sudo apt update -qq
sudo apt install -y --no-install-recommends software-properties-common dirmngr
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc > /dev/null
sudo add-apt-repository -y "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install -y --no-install-recommends r-base

echo " "
echo "----------------------------------------"
echo "installing DADA2..."
echo "this will take 15–30 min"
echo "just wait until you see **FINISHED**"
echo " "

sudo Rscript -e 'install.packages(c("RcppEigen", "png", "deldir", "interp", "latticeExtra"), ask = FALSE, quiet = TRUE); if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager", ask = FALSE, quiet = TRUE); BiocManager::install("ShortRead", ask = FALSE, update = FALSE, quiet = TRUE); BiocManager::install("dada2", ask = FALSE, update = FALSE, quiet = TRUE)'

echo " "
echo "**FINISHED**"

echo " "
echo " "
echo " "
echo "###################################################"
echo "installing was done"
echo " "

blastn -h | grep Nucleotide | awk '$2=="BLAST" {print "BLAST ok"}'  
seqkit -h | grep "alphabet-guess-seq-lengt" | awk '$2=="int" {print "seqkit ok"}'
R --version | head -n 1 | awk '$2=="version" {print "R ok"}'
Rscript -e 'cat(as.character(packageVersion("dada2")))' | awk '$1>0 {print "dada2 ok"}' 

echo " "
echo "###################################################"
echo " "

echo "type exit and enter to terminate the shell"
echo "you do not need to save anything"

echo " "
