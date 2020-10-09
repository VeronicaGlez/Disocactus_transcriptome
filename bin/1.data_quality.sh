

#!bin/bash
#In order to evaluate que quality of my raw data I run this script
#script to evaluate the quality of raw_samples using fastqc
# Run this script from directory ~/bin/  and  the raw data is in ~/data/

#make out directory name DS_quality

mkdir -p ../out/DS_quality

#evaluate raw quality samples with fasqc and save the out in dir quality

for i in ../data/DS/*.gz; do
fastqc $i -o ../out/DS_quality/
done

#made multiqc analysis in DS_quality directory

cd ../out/DS_quality/

#run multiqc analysys

multiqc .
