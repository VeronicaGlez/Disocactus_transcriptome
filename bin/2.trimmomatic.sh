#!/bin/bash

# This script is for data cleaning using trimmomatic.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/
# Prerequisites: install trimmomatic 0.39 version

# make out directory for DE data

mkdir -p ../data/DE_clean


# Clean the DE sequences with trimmomatic

for i in `ls ../data/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do
echo ${i}
                     trimmomatic  PE -threads 4 ../data/DE/${i}_1.fq.gz ../data/DE/${i}_2.fq.gz \
                          ../data/DE_clean/${i}_1P.fq.gz  ../data/DE_clean/${i}_2P.fq.gz \
                          ../data/DE_clean/${i}_1U.fq.gz  ../data/DE_clean/${i}_1U.fq.gz \
                          ILLUMINACLIP:../data/DE/Illumina_adapters.fa:2:40:15 MINLEN:20 SLIDINGWINDOW:4:20

done

# make out directory for DS Disocactus_transcriptome

mkdir -p ../data/DS_clean

#Clean the DS sequences with trimmomatic

for i in `ls ../data/DS | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do
echo ${i}
                     trimmomatic  PE -threads 4 ../data/DS/${i}_1.fq.gz ../data/DS/${i}_2.fq.gz \
                          ../data/DS_clean/${i}_1P.fq.gz  ../data/DS_clean/${i}_2P.fq.gz \
                          ../data/DS_clean/${i}_1U.fq.gz  ../data/DS_clean/${i}_1U.fq.gz \
                          ILLUMINACLIP:../data/DE/Illumina_adapters.fa:2:40:15 MINLEN:20 SLIDINGWINDOW:4:20

done
