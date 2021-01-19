library(clusterProfiler)
library(wordcloud)
library(RColorBrewer)

organism = "org.At.tair.db"

library(organism, character.only = TRUE)

setwd("~/Documentos/EpiDiso/Disocactus_transcriptome/bin")

# reading in data from deseq2
df = read.csv("../data/dif_exp_analysis/DE/significant_genes.csv", header=TRUE)

View(df)
# we want the log2 fold change 
original_gene_list <- df$logFC
