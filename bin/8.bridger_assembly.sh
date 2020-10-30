#!/bin/bash
# This script is for data assambling 36 concatenated samples of D. eichalamii using Bridger.
# Run this script from directory ~/bin/  and  the sequences they are in ~/out/DE_cat/
# Prerequisites: install bridger
# bridger comand
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N bridger_tDE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"


export PATH=$PATH:/soft/Bridger_r2014-12-01/

#bridger assambling

Bridger.pl --seqType fa --left ../out/DE_cat/DE_cat_1.fa --right ../out/DE_cat/DE_cat_2.fa  --output /out/bridger_DE_trim --CPU 30 --clean -k 25
