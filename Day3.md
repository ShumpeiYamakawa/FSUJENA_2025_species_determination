# Day3

**set up**
```bash
cd ~/test_meta
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -zxvf sratoolkit.current-ubuntu64.tar.gz
cd sratoolkit.3.2.1-ubuntu64/bin
echo "export PATH=\"$(pwd):\$PATH\"" >> ~/.bashrc; source ~/.bashrc
```

**R set up**
```bash
sudo apt update -qq
sudo apt install --no-install-recommends software-properties-common dirmngr
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install --no-install-recommends r-base
```


## Tasks

Analysis of the datasets from the publication.

・Example 1: deep sea samples
・Example 2: mosquito/fry samples
・Dataset you found

1. Create a new directory for each dataset under the test_meta directory (e.g., run id [SRR3233649] or sample features [deep_sea], do not use space).

2. Move to each directory and download the sequence datasets (see details below).

3. Load the data into R and check the quality using dada2.

4. Generate and save an ASV file for each dataset using dada2.

5. Copy the ASV files to the 16s_metazoa... directory.

6. Annotate the sequences in the directory.

-------------------------------------------

**Evaluate the results of your analysis of a dataset found on SRA**

7. Write and send a short report about the results (https://docs.google.com/forms/d/e/1FAIpQLSfTs3waEgm2DijM044nAUQhnMFUr2IuhOSFIiwLmjz8MnwjGQ/viewform?usp=header)

-------------------------------------------


**Download fastq files from SRA**

Find the BioProject ID and search for it in the SRA Run Selector (https://www.ncbi.nlm.nih.gov/Traces/study/) to find the run ID.

```bash
fastq-dump --gzip --split-files ***RUN ID***
```






