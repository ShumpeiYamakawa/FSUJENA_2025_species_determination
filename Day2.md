

```bash
wget 'https://www.dropbox.com/scl/fi/sd7yn80lwtfmleh1dxqkf/SILVA_138.2_SSURef_tax_silva_Metazoa.fa?rlkey=uybb94wxe7hx0l8hs3fderxsx&dl=1' -O SILVA_138.2_SSURef_tax_silva_Metazoa.fa

makeblastdb -in SILVA_138.2_SSURef_tax_silva_Metazoa.fa -out metazoa.db -dbtype nucl



cat ~/Downloads/4EMJXER3013-Alignment.txt| awk '/Description /{getline;print}' | awk '{print $1"_"$2" \t "$(NF-2)}' | sort | uniq | awk '$2>95 {print $1}'  | sort | uniq        


```
