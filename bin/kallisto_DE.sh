#Script to quant 32 samples of D. eichlamii using Kallisto

#Kallisto comand
#!/bin/sh
#$ -cwd   
#$ -j y
#$ -V                    #export environment var
#$ -N Kalquant_eic             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************" 

program= /soft/kallisto_linux-v0.43.0/
workdir= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/data/DE

INDEX="/users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/out/DE_25_ka.idx"
SAMPLE="/users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/data/DE"



export PATH=$PATH:/soft/kallisto_linux-v0.43.0/


for i in `ls ../data/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do

echo $SAMPLE/${i}

done

#Kallisto quant

for i in `ls ../data/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do 

kallisto quant -i $INDEX -o ../out/k_quants -b 100 --pseudobam $SAMPLE/${i}_1.fq.gz  $SAMPLE/${i}_2.fq.gz
 
done
