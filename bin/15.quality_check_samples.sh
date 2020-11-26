#!/bin/bash
#Script for quality check samples using trinity PtR Script
# Run this script from directory ~/bin/  and  the data are in ../out/${i}_exp_matrix


#loop to compare replicates for each of your samples

for i in DE DS; do

  echo "processing ${i} samples"

  cd ../out/${i}_exp_matrix #enter to folder with expression matrix

PtR --matrix kallisto.isoform.counts.matrix \
                  --samples samples.txt --log2 \
                  --min_rowSums 10 \
                  --compare_replicates

# compare Replicates Across Samples

PtR --matrix kallisto.isoform.counts.matrix \
             --min_rowSums 10 \
             -s samples.txt --log2 --CPM --sample_cor_matrix

# make PCA

PtR --matrix kallisto.isoform.counts.matrix \
                 -s samples.txt --min_rowSums 10 --log2 \
                 --CPM --center_rows \
                 --prin_comp 3


 cd ../../bin #return to bin

done
