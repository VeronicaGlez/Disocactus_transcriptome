#!/bin/bash
#In order to evaluate que quality of the trimmed data I run this script
#script to evaluate the quality of trimm_samples using fastqc and multiqc
# Run this script from directory ~/bin/  and  the raw data is in ~/data/DS_clean and ~/data/DE_clean


## folders with clean data saved in ../data/

for i in DE_clean DS_clean;
do

#make out folders

  mkdir -p ../data/${i}quality

  for k in ../data/${i}/*.gz; do
  echo ${k}

  fastqc $k -o ../data/${i}quality/ #run fastqc in every sample saved in DE_clean and DS_clean and save the ouput in DE_clean_quality and DS_clean_quality

  done
done

#made multiqc analysis in DE_cleanquality and DS_cleanquality directories

for i in DE_cleanquality DS_cleanquality; do
  echo ${i}

multiqc . ../data/${i}/ #run multiqc analysys inside folfers

done
