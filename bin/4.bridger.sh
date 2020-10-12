#!/bin/sh
# This script is for data assambling 16 samples of D. speciosus using Bridger.
# Run this script from directory ~/bin/  and  the sequences they are in ~/data/DE/trim/test/
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

Bridger.pl --seqType fq --left ../data/DE/trim/test/DE1-2PA_1P.fq --right ../data/DE/trim/test/DE1-2PA_2P.fq --output ../out/bridger_DE_trim_test --CPU 10 --clean -k 25

done
