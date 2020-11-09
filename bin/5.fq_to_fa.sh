#!/bin/bash
# This script converts fq data to fasta format and save in /data/${i}_fasta dir.
# Run this script from directory ~/bin/ and the data are in ~/data/
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N fq_to_fa             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

#make out dir

mkdir -p ../data/DE_fasta/

mkdir -p ../data/DS_fasta/

#loop convert fq files in fasta files

  for i in DE DS; do #folders with fq samples

  for k in `ls ../data/${i}_clean/ | grep "P.fq" | sed "s/_1P.fq//"| sed "s/_2P.fq//" | uniq` ;  do ## tienes que agregar un sed antes de uniq para quitar .fq
  echo ${k}

  sed -n '1~4s/^@/>/p;2~4p' ../data/${i}_clean/${k}_1P.fq > ${k}_1P.fasta #convert 1P.fq to 1P.fasta

  sed -n '1~4s/^@/>/p;2~4p' ../data/${i}_clean/${k}_2P.fq > ${k}_2P.fasta #convert 2P.fq to 2P.fasta

  mv ${k}_1P.fasta ${k}_2P.fasta ../data/${i}_fasta/ #move fasta files to out folder

done
  done
