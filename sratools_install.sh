cd ~/test_meta
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -zxvf sratoolkit.current-ubuntu64.tar.gz
cd sratoolkit.3.2.1-ubuntu64/bin
echo "export PATH=\"$(pwd):\$PATH\"" >> ~/.bashrc; source ~/.bashrc
