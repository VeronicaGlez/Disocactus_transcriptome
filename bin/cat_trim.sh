#Script to concatenate files
# This script is for cat 36 samples of D. speciosus.
# Run this script from directory ~/bin/  and  the sequences they are in ~/data/DS/trim/unzip
#!/bin/sh

#make out directory

mkdir -p /media/isau/Isaura/EpiDiso/out/DS_cat

#cat samples

for i in `ls /media/isau/Isaura/EpiDiso/data/secuencias/DS/unzip | grep ".fq" | sed "s/_1_val_1.fq//"| sed "s/_2_val_2.fq//" | uniq` ; do

echo ${i}

cat /media/isau/Isaura/EpiDiso/data/secuencias/DS/unzip/${i}_1_val_1.fq > DS_cat_trim_1.fq

cat /media/isau/Isaura/EpiDiso/data/secuencias/DS/unzip/${i}_2_val_2.fq > DS_cat_trim_2.fq

done


#move cat files to out directory


mv DS_cat_trim_*.fq  /media/isau/Isaura/EpiDiso/out/DS_cat

