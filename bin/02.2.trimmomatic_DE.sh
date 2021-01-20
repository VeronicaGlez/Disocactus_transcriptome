#!/bin/bash

# This script is for data cleaning adapters using trimmomatic.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/DE
# Prerequisites: install trimmomatic 0.32 version
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N trim_DE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

export PATH=$PATH:/soft/Trimmomatic-0.32/


# make out directory for DE data

mkdir -p ../data/DE_clean


# Clean the DE sequences with trimmomatic (adaptor removal, trimming of low quality bases and reads)

for i in `ls ../data/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do
echo ${i}

                    java -jar /soft/Trimmomatic-0.32/trimmomatic-0.32.jar PE -threads 8 -phred33 \
                          ../data/DE/${i}_1.fq.gz ../data/DE/${i}_2.fq.gz \
                          ../data/DE_clean/${i}_1P.fq.gz  ../data/DE_clean/${i}_1U.fq.gz \
                          ../data/DE_clean/${i}_2P.fq.gz  ../data/DE_clean/${i}_2U.fq.gz \
                          ILLUMINACLIP:/soft/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:30:10 \
                          LEADING:25 TRAILING:25 MINLEN:75 SLIDINGWINDOW:4:25

done



