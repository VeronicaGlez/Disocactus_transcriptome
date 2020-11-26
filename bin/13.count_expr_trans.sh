
#!/bin/sh
#Script to Counting Numbers of Expressed Transcripts in DS and DE
# Run this script from directory ~/bin/  and  the sequences they are in ~/out/


#loop for count expressing transcripts in DE and DS

for i in DE DS; do
  
  echo "processing ${i}"
  
  cd ../out/${i}_exp_matrix/

/home/cris/Documentos/trinityrnaseq/util/misc/count_matrix_features_given_MIN_TPM_threshold.pl \
          kallisto.isoform.TPM.not_cross_norm | tee trans_matrix.TPM.not_cross_norm.counts_by_min_TPM 
          
          cd ../../bin/

        done
        
        
       
