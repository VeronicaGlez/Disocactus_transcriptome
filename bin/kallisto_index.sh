
#Script to index the transcriptome of D. speciosus using Kallisto
# Run this script from directory ~/bin/  and  the transcriptome is in ~/out/trinity_speciosus/
## Prerequisites: install kallisto
#!/bin/sh
#$ -cwd   
#$ -j y
#$ -V                    #export environment var
#$ -N Kal_idx             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************" 

program= /soft/kallisto_linux-v0.43.0/
workdir= /users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus/bin


export PATH=$PATH:/soft/kallisto_linux-v0.43.0/


#Building index

kallisto index -i trinity_DS.idx ../out/trinity_speciosus/Trinity.fasta

