#!/bin/bash
# In order to evaluate que quality of the trimmed data run this script
# script to evaluate the quality of trimm_samples using fastqQC and multiQC
# Run this script from directory ~/bin/  and  the raw data are saved in ~/data/
# Prerequisites: fastQC and multiQC

for i in DE DS; do

#make out directories 

mkdir -p ../out/${i}_cleanquality

#evaluate raw quality samples with fasqc and save the out in dir quality

for k in ../data/${i}_clean/*.gz; do

fastqc $k -o ../out/${i}_cleanquality/

  done
done

#made multiqc analysis in DE and DS_quality directory

for i in DE DS; do

multiqc . ../data/${i}_cleanquality/ #run multiqc analysis inside folders

done

cd ../../bin #return to bin folder once the process ends
