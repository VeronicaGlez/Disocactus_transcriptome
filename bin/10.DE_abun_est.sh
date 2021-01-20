#!/bin/sh
#Script to estimate abundance of D. eichlamii using trinity
# Run this script from directory ~/bin/  and  the sequences they are in ~/out/DE_k_quants
# Prerequisite: Trinity

#make out diretory

mkdir -p ../out/DE_exp_matrix

#determine data variable

data="/media/cris/Isaura/EpiDiso/out/DE_k_quants" #is where the samples are saved

#run abundance estimation using trinity and kallisto output


abundance_estimates_to_matrix.pl --est_method kallisto \
    --out_prefix kallisto   \
    --gene_trans_map none  \
    --name_sample_by_basedir \
  $data/DE1-10PA_k_quant/abundance.tsv \
  $data/DE1-10PC_k_quant/abundance.tsv \
  $data/DE1-14PA_k_quant/abundance.tsv \
  $data/DE1-14PC_k_quant/abundance.tsv \
  $data/DE1-2PA_k_quant/abundance.tsv \
  $data/DE1-2PC_k_quant/abundance.tsv \
  $data/DE2-1PA_k_quant/abundance.tsv \
  $data/DE2-1PC_k_quant/abundance.tsv \
  $data/DE2-4PA_k_quant/abundance.tsv \
  $data/DE2-4PC_k_quant/abundance.tsv \
  $data/DE2-7PA_k_quant/abundance.tsv \
  $data/DE2-7PC_k_quant/abundance.tsv \
  $data/DE3-3PA_k_quant/abundance.tsv \
  $data/DE3-3PC_k_quant/abundance.tsv \
  $data/DE3-7PA_k_quant/abundance.tsv \
  $data/DE3-7PC_k_quant/abundance.tsv \
  $data/DE3-8PA_k_quant/abundance.tsv \
  $data/DE3-8PC_k_quant/abundance.tsv

  mv grep DE* ../out/DE_exp_matrix
