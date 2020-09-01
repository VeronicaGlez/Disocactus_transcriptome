
#!/bin/bash

# This script is for data cleaning using trim_galore.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/secuencias/DE/
# Prerequisites: install trim_galore 0.6.0_dev


# make out directory 

mkdir -p ../data/secuencias/DE/trim


# Clean the sequences with trim_galor

for i in `ls ../data/secuencias/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do 

~/TrimGalore-0.6.5/trim_galore --phred33 --fastqc -illumina --gzip -j 1 --clip_R1 15 --clip_R2 15 --three_prime_clip_R1 5 --three_prime_clip_R2 5 --paired -o ../data/secuencias/DE/trim ../data/secuencias/DE/${i}_1.fq.gz ../data/secuencias/DE/${i}_2.fq.gz;

done






