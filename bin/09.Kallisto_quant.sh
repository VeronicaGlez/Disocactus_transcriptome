#Script to quant samples of D. eichlamii and D.speciosus using Kallisto

# Run this script from directory ~/bin/  and  the sequences they are in ~/data/DE_clean and ~/data/DS_clean
#Prerequisite: kallisto 0.43.0
#Kallisto comand
#!/bin/sh
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N Kalquant_eic             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

export PATH=$PATH:/soft/kallisto_linux-v0.43.0/

#Kallisto quant

for i in DE DS; do

mkdir -p ../out/${i}_k_quants

for k in `ls ../data/${i}_clean |  grep -Ev "(_1U.fq|_2U.fq|.txt)" | sed "s/_1P.fq//"| sed "s/_2P.fq//" | uniq ` ; do

echo "Processing sample ${k}"

kallisto quant -i ../out/${i}_Trinity_clean/trinity_${i}.idx -o ../out/${i}_k_quants/${k}_k_quant -b 100 --pseudobam ../data/${i}_clean/${k}_1P.fq ../data/${i}_clean/${k}_2P.fq

done
 done
 
 


