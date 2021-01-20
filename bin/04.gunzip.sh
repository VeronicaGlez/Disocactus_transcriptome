
#!/bin/bash
# This script is for unzip 36 samples of D. eichlamii and 36 D.speciosus samples.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N gzip_DE_DS             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"


# loop to decompress all samples in DE_clean/DS_clean
# folders with fq.gz data clean

for i in DE_clean DS_clean; do

  for k in `ls ../data/${i}/ | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq`;  do
  echo ${k}

  # unzip files in DE_clean DS_clean

  gunzip ../data/${i}/${k}

  done
done
