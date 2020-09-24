#Script to concatenate files
# This script is for cat 36 samples of D. eichlamii.
# Run this script from directory ~/bin/  and  the sequences they are in ~/data/DE/trim/
#!/bin/sh

#make out directory

mkdir -p ../out/DE_cat

#cat samples

for i in `ls ../data/DE/ | grep ".fq" | sed "s/_1_val_1.fq//"| sed "s/_2_val_2.fq//" | uniq` ; do

echo ${i}

cat ../data/secuencias/DE/${i}_1_val_1.fq > DE_cat_trim_1.fq

cat ../data/secuencias/DE/${i}_2_val_2.fq > DE_cat_trim_2.fq

done


#move cat files to out directory


mv DE_cat_trim_*.fq  ../out/DE_cat

