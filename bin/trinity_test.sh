#Script to asamble 16 samples of D. speciosus using Trinity
#Trinity comand
#!/bin/sh
#$ -cwd   
#$ -j y
#$ -V                    #export environment var
#$ -N transcrpt             #name Job
#$ -m ea                 #add email
#$ -M hinojosa.silvia@gmail.com        #to me...
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************" 
program= /soft/trinityrnaseq-2.4.0
workdir= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/
a= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/DS*-*_1.fq
b= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/DS*-*_2.fq

export PATH=$PATH:/soft/trinityrnaseq-2.4.0/

#assambly in Trinity

$program/Trinity  --seqType fq --max_memory 225G --SS_lib_type RF --left $a --right $b --CPU 24 --output $workdir/Trinity_test  
