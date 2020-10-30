
#!/bin/bash
# Script to concatenate gunzip files
# This script is for unzip 36 samples of D. eichlamii.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/DE_clean
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N gzip_DE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"



# decompress all samples in DE_clean/

for i in `ls ../data/DE_clean/ | grep ".fq.gz" | sed "s/_1P.fq.gz//"| sed "s/_2P.fq.gz//" | uniq` ; do

echo ${i}

# unzip files in DE_clean

gunzip ../data/DE_clean/${i}_1P.fq.gz

gunzip ../data/DE_clean/${i}_2P.fq.gz

done
