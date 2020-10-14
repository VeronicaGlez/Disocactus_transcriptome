#!/bin/bash
# This script converts fq data to fasta format and move and save in out dir.
# Run this script from directory ~/bin/ and the data are in ~/data/DE_clean/
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N fq_to_fa             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

#make out dir

mkdir -p ../data/DE_clean/DE_fasta/


#convert fq files in fasta files

for i in `ls ../data/DE_clean/ | grep ".fq" | uniq` ; do

echo ${i}

sed -n '1~4s/^@/>/p;2~4p' ../data/DE_clean/${i}_1P.fq > ${i}_1P.fasta

sed -n '1~4s/^@/>/p;2~4p' ../data/DE_clean/${i}_2P.fq > ${i}_2P.fasta

done

#move to out dir

mv *.fasta  ../data/DE_clean/DE_fasta/
