#!/bin/bash
#Script to get expression clusters of D. speciosus using trinity
# Run this script from directory ~/bin/  and  the data is in ~/out/DE_exp_matrix/DESeq2/



#define clusters in D. eichlamii

define_clusters_by_cutting_tree.pl -R  ../out/DE_exp_matrix/DESeq2/diffExpr.P1e-3_C2.matrix.R  --Ptree 50
