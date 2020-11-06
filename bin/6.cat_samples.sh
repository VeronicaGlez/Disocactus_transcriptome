#!/bin/bash
#Script to concatenate files
# This script is for cat 36 samples of D. eichlamii.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/DE_clean/DE_fasta
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N cat_DE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

#make out directory to save concatenated data

mkdir -p ../out/DE_cat

mkdir -p ../out/DS_cat

#concatenate DE_fasta and DS_fasta samples

for i in DE DS; do
for k in `ls ../data/${i}_fasta/ | grep ".fasta" | sed "s/_1P.fasta//"| sed "s/_2P.fasta//" | uniq` ; do

echo ${k}

cat ../data/${i}_fasta/${k}_1P.fasta > ${i}_cat_1.fa  #cat reverse samples

cat ../data/${i}_fasta/${k}_2P.fasta > ${i}_cat_2.fa  #cat forward samples

mv ${i}_cat_1.fa ${i}_cat_2.fa ../out/${i}_cat/  #mv samples to out_file

done
 done
