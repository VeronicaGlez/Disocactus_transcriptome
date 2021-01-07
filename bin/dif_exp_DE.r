
---
title: "Disocactus eichalmii differential expression analysis"
author: "Isaura Rosas-Reinhold"
date: "7/1/2021"
---

#load packages
library(ggplot2)
library(tidyverse)
library(edgeR)
library(DESeq2)
library(PCAtools)
library(marray)
library(pheatmap)
library(dplyr)
library(SummarizedExperiment)
library(gplots)
source("functions.R")

#The data was previously exported from kallisto out using library(tximport) and library(rhdf5)

#load data
load("../data/dif_exp_analysis/DE/counts_DE.RData")

class(counts)
names(counts)

storage.mode(counts) <- "integer"

##counts matix to data frame

counts <- as.data.frame(counts)

#explore the data frame counts
class(counts)

names(counts)
View(counts)

##Select genes with at least 5 counts per million (cpm) in at least two samples

keep <- rowSums(cpm(counts) >= 5) >=2
table(keep)

##Cut original data

counts <- counts[keep, ]

colnames(counts)

##Use the names of columns to the matrix counts for select six experimental groups

groups <- factor(colnames(counts))

table(groups)

groups

##Create a list using the count matrix and groups

edgeRlist_DE <- DGEList(counts = counts,
                        group = groups, 
                        genes = rownames(counts))
str(edgeRlist_DE)

#Normalized data using TMM method

edgeRlist_DE <- calcNormFactors(edgeRlist_DE, method = "TMM")

##Visualize the normalization factors
edgeRlist_DE$samples

##Plot the results using absolute vs relative expression in each sample to check the correct normalization

pdf("../out/dif_exp_DE/MD_plots.pdf", height = 7, width = 10)
par(mfrow = c(2, 3)) ##Generate a frame to store 6 plots in 2 rows and 3 columns
for (i in c(1:18)) {
  print(plotMD(cpm(edgeRlist_DE, log = T), column = i))
  grid(col = "blue")
  abline(h = 0, col = "red", lty = 2, lwd = 2)
}
dev.off()

#PCA to explore data

pch <- c(0,1,2,15,16,17)
colors <- rep(c("#FF3399", "#003399", "#006633"), 2)
plotMDS(edgeRlist_DE, col=colors[groups], pch=pch[groups])
legend("topright", legend=levels(groups), pch=pch, col=colors, ncol=2)

#Heatmap to explor data

cormat <- cor(cpm(edgeRlist_DE$counts, log = T))
pheatmap(cormat, border_color = NA, main = "D.eichlamii Correlation of replicates")



#--------------------------------------Differential expression analysis--------------------------------

#Expresimental matrix design
design <- model.matrix(~0+edgeRlist_DE$samples$group)
design
##El término ~0 le indica a la función no incluir una columna de intersecciones y solamente incluir tantas columnas como grupos en nuestro diseño experimental
colnames(design) <- levels(edgeRlist_DE$samples$group)

design

#data dispersion

edgeRlist_DE <- estimateDisp(edgeRlist_DE, design = design, robust = T)
plotBCV(edgeRlist_DE)

#estimation of QL dispersions 

fit <- glmQLFit(edgeRlist_DE, design, robust=TRUE)
head(fit$coefficients)

#Plot QL dispersion

plotQLDisp(fit)

summary(fit$df.prior)

#Contrast matrix for three comparisons

contrast_matrix <- makeContrasts(
  DE1_PAvsDE2_ = DE1_PA - DE2_PA ,
  DE2_PAvsDE3_ = DE2_PA - DE3_PA ,
  DE1_PAvsDE3_ = DE1_PA - DE3_PA , 
  DE1_PCvsDE2_ = DE1_PC - DE2_PC ,
  DE2_PCvsDE3_ = DE2_PC - DE3_PC ,
  DE1_PCvsDE3_ = DE1_PC - DE3_PC , levels=design)

contrast_matrix


#Adjust data to Binomial (BN) method

pdf("../out/dif_exp_DE/volcano_plots.pdf", height = 7, width = 10)
par(mfrow = c(2, 3)) ##Generate a frame to store 6 plots in 2 rows and 3 columns
for (i in c(1:6)) {
  qlf.BvsA.lfc1 <- glmTreat(fit, 
                            contrast = contrast_matrix[, i], 
                            lfc = 1)
  deg.BvsA.lfc1 <- decideTestsDGE(qlf.BvsA.lfc1, p.value = 0.05, adjust.method = "BH", lfc = 1)
  table(deg.BvsA.lfc1)
  
  #seleccionar los genes que estadísticamente tienen |lfc| > 1 y robustecer nuestros resultados
  DEG.BvsA.lfc1 <- DEGResults(qlf.BvsA.lfc1)
  DEG.BvsA.lfc1 <- edgeResults(DEG.BvsA.lfc1, logfc = 1, padj = 0.05)
  print(volcano_edgeR(DEG.BvsA.lfc1, lfc = 1, padj = 0.05)) #print volcano_plots
}
dev.off()


#Significant genes
significant.genes <- DEG.BvsA.lfc1 %>% filter(FDR < 0.05 & logFC > 1 | FDR < 0.05 & logFC < -1)
paste("The number of significant genes with |lfc| > 1 is", length(significant.genes$genes))

##Heatmap of genes significant 
##Get names or ids from genes with differential expression
significant.ids <- significant.genes$genes
##Create a count matrix normalize by cpm (count per million), using the counts saved in the edgeRlist_DE object
significant.cpm <- cpm(edgeRlist_DE$counts, log = T)
##Cut genes with significative expression
significant.cpm <- significant.cpm[significant.ids, ]

##Generate a color palette

OBW <- maPalette(low = "orange", high = "blue", mid = "white")

##get heatmap 

pheatmap(significant.cpm, 
         border_color = NA, 
         color = OBW,
         show_rownames = F,
         anotation_col = T, 
         scale = "row", 
         angle_col = 0,
         fontsize = 12,
         fontsize_col = 6,
         main = "D.eichalmii")


#-----------------------------------expression clusters---------------------------------------------------------
#Using the data in significant.cpm we will extrac the gene clusters

significant.cpm

#Heatmat to extract dendogram to get expression clusters

DE_HS<- cim(t(significant.cpm), color = NULL, symkey = FALSE, row.cex = NULL,
            col.cex = NULL, margins = c(2, 4))

#plot the dendogram only 
plot(DE_HS$ddc, leaflab="none")
abline(h=25, lwd=2, col="red")

#Using this dendrogram, we might want to cut the tree at level h=25. using the function cutree, which will provide a cluster membership for each gene.
geneClust <- cutree(as.hclust(DE_HS$ddc), h=25)
head(geneClust)

#To see the gene clust total
length(unique(geneClust))

#To explore genes in every gene cluster
names(which(geneClust == 10))

##analysis purposes, it’s convenient to convert this vector into a tibble, so we can join it with our table of gene expression counts that will be used to make a plot:

class(geneClust)

##convert geneClust matrix to vector

geneClust<-as.vector(geneClust)

##Convert geneClust in a tibble
geneClust <- cutree(as.hclust(DE_HS$ddc), h=21)
geneClust<-enframe(geneClust, name = "genes", value = "cluster")


#sample clustering to identify outliers using hclust function

hc <- hclust(as.dist(1-cor(significant.cpm, method="spearman")), method="complete") # Clusters columns by Spearman correlation.
TreeC = as.dendrogram(hc, method="average")
plot(TreeC,
     main = "Sample Clustering D.eichlamii",
     ylab = "Height")


sessionInfo()


