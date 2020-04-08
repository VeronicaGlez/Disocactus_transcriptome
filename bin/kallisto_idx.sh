#Script to index the transcriptome of D. speciosus using Kallisto

#Kallisto comand
#!/bin/sh
#$ -cwd   
#$ -j y
#$ -V                    #export environment var
#$ -N Ka_idx             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************" 

program= /soft/kallisto_linux-v0.43.0/
workdir= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/out/trinity_eichlamii/


export PATH=$PATH:/soft/kallisto_linux-v0.43.0/


#Building index

kallisto index -i trinity_DE.idx ../out/trinity_eichlamii/Trinity.fasta

