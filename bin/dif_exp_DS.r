
library(ggplot2)
library(tidyverse)
library(edgeR)
library(PCAtools)
library(marray)
library(pheatmap)
library(dplyr)
library(SummarizedExperiment)
library(gplots)
library(RColorBrewer)
library(mixOmics)
library(dplyr)
source("functions.R")


#Charge data
load("../data/dif_exp_analysis/DS/counts_DS.RData")

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

#Explore the colnames in contus data frame
colnames(counts)

##Use the names of columns to the matrix counts for select six experimental groups

groups <- factor(colnames(counts))

table(groups)

groups

##Create a list using the count matrix and groups

edgeRlist_DS <- DGEList(counts = counts,
                        group = groups, 
                        genes = rownames(counts))
str(edgeRlist_DS)

#Normalized data using TMM method

edgeRlist_DS <- calcNormFactors(edgeRlist_DS, method = "TMM")

##Visualize the normalization factors which have to be 1 or near to 1
edgeRlist_DS$samples

##-----------------------------Data exploration and quality assesment-------------------------------------------------

##Plot the results using absolute vs relative expression in each sample to check the correct normalization

pdf("../out/dif_exp_DS/MD_plots.pdf", height = 7, width = 10)
par(mfrow = c(2, 3)) ##Generate a frame to store 18 plots in two rows and 3 columns
for (i in c(1:18)) {
  print(plotMD(cpm(edgeRlist_DS, log = T), column = i))
  grid(col = "blue")
  abline(h = 0, col = "red", lty = 2, lwd = 2)
}
dev.off()

##PCA to explore data

pch <- c(0,1,2,15,16,17)
colors <- rep(c("#FF3399", "#003399", "#006633"), 2)
plotMDS(edgeRlist_DS, col=colors[groups], pch=pch[groups])
legend("topright", legend=levels(groups), pch=pch, col=colors, ncol=2)

##Heatmap to explore data

cormat <- cor(cpm(edgeRlist_DS$counts, log = T))
pheatmap(cormat, border_color = NA, main = "D. speciosus correlation of replicates")


##--------------------------------------Differential expression analysis--------------------------------

##Expresimental matrix design
design <- model.matrix(~0+edgeRlist_DS$samples$group)
design

##the term ~0 le indica a la función no incluir una columna de intersecciones y solamente incluir tantas columnas como grupos en nuestro diseño experimental
colnames(design) <- levels(edgeRlist_DS$samples$group)

##Explore design
design

#data dispersion

edgeRlist_DS <- estimateDisp(edgeRlist_DS, design = design, robust = T)
plotBCV(edgeRlist_DS)

#estimation of QL dispersions 

fit <- glmQLFit(edgeRlist_DS, design, robust=TRUE)
head(fit$coefficients)

#Plot QL dispersion

plotQLDisp(fit)

summary(fit$df.prior)

#Contrast matrix for three comparisons

contrast_matrix <- makeContrasts(
  DS1_PAvsDS2_ = DS1_PA - DS2_PA ,
  DS2_PAvsDS3_ = DS2_PA - DS3_PA ,
  DS1_PAvsDS3_ = DS1_PA - DS3_PA , 
  DS1_PCvsDS2_ = DS1_PC - DS2_PC ,
  DS2_PCvsDS3_ = DS2_PC - DS3_PC ,
  DS1_PCvsDS3_ = DS1_PC - DS3_PC , levels=design)

contrast_matrix

#Adjust data to Binomial (BN) method

pdf("../out/dif_exp_DS/volcano_plots.pdf", height = 7, width = 10)
par(mfrow = c(2, 3)) ##Generate a frame to store 6 plots in 2 rows and 3 columns)
for (i in c(1:6)) {
  qlf.BvsA.lfc1 <- glmTreat(fit, 
                          contrast = contrast_matrix[, i], 
                          lfc = 1)
deg.BvsA.lfc1 <- decideTestsDGE(qlf.BvsA.lfc1, p.value = 0.05, adjust.method = "BH", lfc = 1)
table(deg.BvsA.lfc1)


##Select genes that statisticaly have |lfc| > 1 and strengthen our data

DEG.BvsA.lfc1 <- DEGResults(qlf.BvsA.lfc1)
DEG.BvsA.lfc1 <- edgeResults(DEG.BvsA.lfc1, logfc = 1, padj = 0.05)
print(volcano_edgeR(DEG.BvsA.lfc1, lfc = 1, padj = 0.05)) #print volcano_plots
}
dev.off()


#Significant genes
significant.genes <- DEG.BvsA.lfc1 %>% filter(FDR < 0.05 & logFC > 1 | FDR < 0.05 & logFC < -1)
paste("The number of significant genes with |lfc| > 1 is", length(significant.genes$genes))


significant.genes

##Heatmap of  significant genes
##Get names or ids of genes with differential expression

significant.ids <- significant.genes$genes
##Create normalized count matrix for cpm using counts saved in the object edgeRlist_DS

significant.cpm <- cpm(edgeRlist_DS$counts, log = T, prior.count = 1)
## Cut genes with significative expression

significant.cpm <- significant.cpm[significant.ids, ]

##Generate a color palette

BRW <- maPalette(low = "blue", high = "red", mid = "white")

##Get heatmap using only significan genes

pheatmap(significant.cpm, 
         border_color = NA, 
         color = BRW,
         show_rownames = F,
         anotation_col = T, 
         scale = "row", 
         angle_col = 0,
         fontsize = 12,
         fontsize_col = 5,
         main = "D.speciosus")



##-----------------------------------expression clusters---------------------------------------------------------
##Using the data in significant.cpm we will extrac the gene clusters

significant.cpm

##Heatmat to extract dendogram to get expression clusters

DS_HS<- cim(t(significant.cpm), color = NULL, symkey = FALSE, row.cex = NULL,
               col.cex = NULL)

##plot the dendogram only 
plot(DS_HS$ddc, leaflab="none")
abline(h=25, lwd=2, col="red")


##Using this dendrogram, we might want to cut the tree at level h=25. using the function cutree, which will provide a cluster membership for each gene.
geneClust <- cutree(as.hclust(DS_HS$ddc), h=25)
head(geneClust)


##To see the gene clust total
length(unique(geneClust))

View(geneClust)

##To explore genes in every gene cluster
names(which(geneClust == 12))

##analysis purposes, it’s convenient to convert this vector into a tibble, so we can join it with our table of gene expression counts that will be used to make a plot:

class(geneClust)
##convert geneClust matrix to vector

geneClust<-as.vector(geneClust)

##Convert geneClust in a tibble
geneClust <- cutree(as.hclust(DS_HS$ddc), h=25)
geneClust<-enframe(geneClust, name = "genes", value = "cluster")



#sample clustering to identify outliers using hclust function

hc <- hclust(as.dist(1-cor(significant.cpm, method="spearman")), method="complete") # Clusters columns by Spearman correlation.
TreeC = as.dendrogram(hc, method="average")
plot(TreeC,
     main = "Sample Clustering D.speciosus",
     ylab = "Height")










