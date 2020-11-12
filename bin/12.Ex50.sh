
#!/bin/bash

#Script to calculate ExN50 in two different trinity assemblies
#Run this script after generate expression matrix with kallisto
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N ExN50           #name Job.
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

export PATH=$PATH:/soft/trinityrnaseq-2.4.0/

/soft/trinityrnaseq-2.4.0/Trinity

#Script to calculate Ex90N50 using trinity

for i in DE DS; do

/soft/trinityrnaseq-2.4.0/Trinity/util/misc/contig_ExN50_statistic.pl Trinity_trans.isoform.TMM.EXPR.matrix \  #ExN50 trinity command
../out/${i}_Trinity_clean > ExN50.stats

done

#Convert ExN50.stats to pdf

for i in DE DS; do

cd ../out/${i}_Trinity_clean #enter to out directory

/soft/trinityrnaseq-2.4.0/Trinity/util/misc/plot_ExN50_statistic.Rscript ExN50.stats #convert to pdf

done
