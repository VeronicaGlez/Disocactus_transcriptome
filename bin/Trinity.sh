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
program= /users-d1/shinojosa/trinityrnaseq/
workdir= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/
export PATH=$PATH:/users-d1/shinojosa/trinityrnaseq/

#assambly in Trinity
for i in $workdir;
do

$program/Trinity --seqType fq --left DS1-2PA_1.fq.gz DS1-2PC_1.fq.gz DS1-15PA_1.fq.gz DS1-13PC_1.fq.gz DS2-2PA_1.fq.gz DS2-2PC_1.fq.gz DS2-7PA_1.fq.gz DS2-7PC_1.fq.gz DS2-14PA_1.fq.fz DS2-14PC_1.fq.gz DS3-14PA_1.fq.gz DS3-14PC_1.fq.gz DS3-15PA_1.fq.gz DS3-15PC_1.fq.gz DS3-16PA_1.fq.gz DS3-16PC_1.fq.gz --right DS1-2PA_2.fq.gz DS1-2_2PC.fq.gz DS1-15PA_2.fq.gz DS1-13PC_2.fq.gz DS2-2PA_2.fq.gz DS2-2PC_2.fq.gz DS2-7PA_2.fq.gz DS2-7PC_2.fq.gz DS2-14PA_2.fq.fz DS2-14PC_2.fq.gz DS3-14PA_2.fq.gz DS3-14PC_2.fq.gz DS3-15PA_2.fq.gz DS3-15PC_2.fq.gz DS3-16PA_2.fq.gz DS3-16PC_2.fq.gz --CPU 25 --max_memory 100G 

done

