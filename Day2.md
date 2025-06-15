




```bash
cd ~/test_meta/
wget "https://www.dropbox.com/scl/fi/doxpopin5xbdb5j6gxvcw/16s_metazoa_rrna_blast_annot.tar.gz?rlkey=wagchmn1yjop19s80pdxke4v5&dl=1" -O 16s_metazoa_rrna_blast_annot.tar.gz
tar -zxvf 16s_metazoa_rrna_blast_annot.tar.gz
rm 16s_metazoa_rrna_blast_annot.tar.gz
cd 16s_metazoa_rrna_blast_annot
sudo cp taxonkit /usr/local/bin/

path=$(taxonkit | grep home | grep tax | head -n 1 | awk '{print $1}' | sed -e s/"\""//g )
[ -f "$path" ] && rm "$path"
[ ! -d "$path" ] && mkdir -p "$path"
for i in names.dmp nodes.dmp delnodes.dmp merged.dmp ; do cp "$i" "$path" ; done

```
