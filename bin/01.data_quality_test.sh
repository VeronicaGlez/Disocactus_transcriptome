#!bin/bash
#In order to evaluate que quality of my raw data I run this script
#script to evaluate the quality of raw_samples using fastqc
# Run this script from directory ~/bin/  and  the raw data is in ~/data/

## folders with raw data are saved in ../data/

for i in DE DS;
do

#make out folders

  mkdir -p ../data/${i}_quality

  for k in ../data/${i}/*.gz; do
  echo ${k}

  fastqc $k -o ../data/${i}_quality/ #run fastqc in every sample saved in DE_clean and DS_clean and save the ouput in DE_clean_quality and DS_clean_quality

  done
done

#made multiqc analysis in DE_quality and DS_quality directories

for i in DE DS; do

multiqc . ../data/${i}_quality/ #run multiqc analysys inside folfers

done

cd ../../bin #return to bin folder once the process ends
