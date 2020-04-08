#Script to asamble 16 samples of D. speciosus using Trinity
#Trinity comand
#!/bin/sh
#$ -cwd   
#$ -j y
#$ -V                    #export environment var
#$ -N prinseq             #name Job
#$ -m ea                 #add email
#$ -M hinojosa.silvia@gmail.com        #to me...
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************" 

perl /soft/prinseq-lite-0203/prinseq-lite.pl -fastq /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/D_eichlamii_1c.fq -fastq2 /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/D_eichlamii_2c.fq -out_format 1
