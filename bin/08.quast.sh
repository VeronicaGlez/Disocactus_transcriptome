#!/bin/bash
# This script is for quality check assembly using Quast program
# Run this script from directory ~/bin/  and  the sequences they are in ~/out/bridger_DE_trim/
# Prerequisites: install Quast (agregar versión)
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N quats_tDE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"



#run Quast in bridger_DE_trim/ folder and save the out in the same folder

for i in DE DS; do

python quast.py ../out/${i}_Trinity_clean/trinity.fasta -o ../out/${i}_Trinity_clean

done
