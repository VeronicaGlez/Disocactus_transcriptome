#!/bin/bash
#Script to concatenate files
# This script is for cat 36 samples of D. eichlamii.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/DE_clean
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N cat_DE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

#make out directory to save concatenated data

mkdir -p ../out/DE_cat/

#cat samples

for i in `ls ../data/DE_clean/DE_fasta/ | grep ".fasta" | sed "s/_1.fa//"| sed "s/_2.fa//" | uniq` ; do

echo ${i}

cat ../data/DE_clean/DE_fasta/${i}_1P.fasta > DE_cat_1.fa

cat ../data/DE_clean/DE_fasta/${i}_2P.fasta > DE_cat_2.fa

done


#move cat files to out directory


mv DE_cat_*.fa  ../../../out/DE_cat/
