#!/bin/sh
#Script to estimate abundance of D. speciosus using trinity
# Run this script from directory ~/bin/  and  the sequences they are in ~/out/DS_k_quants

#make out diretory

mkdir -p ../out/DS_exp_matrix

#determine data variable

data="../out/DS_k_quants" #is where the samples are saved

#run abundance estimation using trinity and kallisto output


abundance_estimates_to_matrix.pl --est_method kallisto \
    --out_prefix kallisto \
    --gene_trans_map none \
    --name_sample_by_basedir \
  $data/DS1-15PC_k_quant/abundance.tsv \
  $data/DS1-15PA_k_quant/abundance.tsv \
  $data/DS1-2PA_k_quant/abundance.tsv \
  $data/DS1-2PC_k_quant/abundance.tsv \
  $data/DS1-9PA_k_quant/abundance.tsv \
  $data/DS1-9PC_k_quant/abundance.tsv \
  $data/DS2-14PA_k_quant/abundance.tsv \
  $data/DS2-14PC_k_quant/abundance.tsv \
  $data/DS2-2PA_k_quant/abundance.tsv \
  $data/DS2-2PC_k_quant/abundance.tsv \
  $data/DS2-7PA_k_quant/abundance.tsv \
  $data/DS2-7PC_k_quant/abundance.tsv \
  $data/DS3-14PA_k_quant/abundance.tsv \
  $data/DS3-14PC_k_quant/abundance.tsv \
  $data/DS3-15PA_k_quant/abundance.tsv \
  $data/DS3-15PC_k_quant/abundance.tsv \
  $data/DS3-16PA_k_quant/abundance.tsv \
  $data/DS3-16PC_k_quant/abundance.tsv

  mv grep kallisto* ../out/DS_exp_matrix/
