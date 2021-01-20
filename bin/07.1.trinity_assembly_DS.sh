
#!/bin/bash
#Script to asamble cat samples of D. speciosus using Trinity
#Prerequisites: Trinity 2.4.0
#Trinity comand
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N DS_Trinity            #name Job.
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

export PATH=$PATH:/soft/trinityrnaseq-2.4.0/

#assambly in Trinity

/soft/trinityrnaseq-2.4.0/Trinity  --seqType fa --max_memory 225G --SS_lib_type RF --left ../out/DS_cat/DS_cat_1.fa --right ../out/DS_cat/DS_cat_2.fa --CPU 24 --output ../out/DS_Trinity_clean
