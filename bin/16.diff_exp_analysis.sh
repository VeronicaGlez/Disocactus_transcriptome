
#!/bin/bash
# Script to make differential expression analysis using DESeq2 trough trinity
# Run this script after generate expression matrix with kallisto
## Run this script from directory ~/bin/  and data are in /out/${i}_exp_matrix_test/
## Prerequisites Trinity, R and DESeq2 Bioconductos package

#loop to run DESeq2 in trinity

for i in DE DS; do

  cd ../out/${i}_exp_matrix_test

run_DE_analysis.pl --matrix kallisto.isoform.counts.matrix --method DESeq2 --samples_file samples.txt  --output DESeq2

 cd ../../bin/

done


#Extracting and clustering differentially expressed transcripts

for i in DE DS; do

  cd ../out/${i}_exp_matrix_test/DESeq2/ #Enter to DESeq2 folder to run the next script

analyze_diff_expr.pl --matrix ../kallisto.isoform.TMM.EXPR.matrix --samples ../samples.txt -P 1e-3 -C 2

cd ../../../bin

done

#Because my data have more than 1000 DE I have to add --max_genes_clust parameter and the DE specific number
#Run analyze_diff_expr.pl for DE samples

cd ../out/DE_exp_matrix/DESeq2/ #enter to DE_exp_matrix/DESeq2

#run the commnad --max_genes_clust for 28023
analyze_diff_expr.pl \
            --matrix ../out/kallisto.isoform.TMM.EXPR.matrix \
            --samples ../out/samples.txt \
            --include_GOplot \
            -P 1e-3 -C 2 --max_genes_clust 28023

cd ../../../bin #back to bin

#run the commnad --max_genes_clust for 32600

cd ../out/DS_exp_matrix/DESeq2/ #enter to DS_exp_matrix/DESeq2 folder

analyze_diff_expr.pl \
                        --matrix ../out/kallisto.isoform.TMM.EXPR.matrix \
                        --samples ../out/samples.txt \
                        -P 1e-3 -C 2 --max_genes_clust 32600 \

cd ../../../bin  #back to bin
