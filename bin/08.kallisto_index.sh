
#Script to index the transcriptome of D. speciosus and D.eichlamii using Kallisto
# Run this script from directory ~/bin/  and  the transcriptome is in ~/out/
## Prerequisites: install kallisto 0.43.0
#!/bin/sh
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N Kal_idx             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"


export PATH=$PATH:/soft/kallisto_linux-v0.43.0/

#Building index

for i in DE DS; do

kallisto index -i ../out/${i}_Trinity_clean/trinity_${i}.idx ../out/${i}_Trinity_clean/Trinity.fasta

done



