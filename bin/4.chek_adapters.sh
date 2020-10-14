
#!/bin/bash
#Script for check that adapters were removed with trimmomatic

### Path to input
DATA="../data/DE/test_6" ### Path to folder containing gz compressed fastQC files

#check if adapters were removed from sequences using grep in firts 4000000 sequences


for i in `ls $DATA | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do
echo ${i}

cat ../data/DE/test_6/${i} | head -4000000 | grep GATCGGAAGAGCACACGTCTGAACTCCAGTCACATTCCTTTATCTCGTATGCCGTCTTCTGCTTG | wc -l


cat ../data/DE/test_6/${i} | head -4000000 | grep AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT | wc -l

done

#check if adapters were removed from sequences using grep in last 4000000 sequences

for i in `ls $DATA | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do
echo ${i}

cat $DATA/${i} | tail -4000000 | grep GATCGGAAGAGCACACGTCTGAACTCCAGTCACATTCCTTTATCTCGTATGCCGTCTTCTGCTTG | wc -l


cat $DATA/${i} | tail -4000000 | grep AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT | wc -l

done
