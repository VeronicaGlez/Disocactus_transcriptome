#!/bin/bash
#In order to evaluate que quality of the trimmed data I run this script
#script to evaluate the quality of trimm_samples using fastqc
# Run this script from directory ~/bin/  and  the raw data is in ~/data/DE_clean

#make out directory named DE_cleanquality

mkdir -p ../out/DE_cleanquality

#evaluate raw quality samples with fasqc and save the out in dir quality

for i in ../data/DE_clean/*.gz; do
fastqc $i -o ../out/DE_cleanquality/
done

#made multiqc analysis in DS_quality directory

cd ../out/DE_cleanquality/

#run multiqc analysys

multiqc .
