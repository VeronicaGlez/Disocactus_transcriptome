#This sccript is for differential expression analysis using counts from kallisto
#the species analized here is D. eichlamii
#run this script form  "~/bin" forder and the data are saved in ../data/dif_exp_DE/
  
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
library(limma)
library(mixOmics)
source("functions.R")

#set workdir

setwd("~/Documentos/EpiDiso/Disocactus_transcriptome/bin")

#The data was previously exported from kallisto out using library(tximport) and library(rhdf5)
#load data
load("../data/dif_exp_analysis/DE/counts_DE.RData")


storage.mode(counts) <- "integer"

##counts matix to data frame
counts <- as.data.frame(counts)

#explore the data frame counts
names(counts)

##Select genes with at least 5 counts per million (cpm) in at least two samples
keep <- rowSums(cpm(counts) >= 5) >=2
table(keep)

##Cut original data
counts <- counts[keep, ]
#have a looke at the colnames in counts
colnames(counts)

##Use the names of columns to the matrix counts for select six experimental groups
groups <- factor(colnames(counts))

table(groups)

##Create a list using the count matrix and groups
edgeRlist_DE <- DGEList(counts = counts,
                        group = groups, 
                        genes = rownames(counts))
str(edgeRlist_DE)

##---------------------------------------------------------Library size and distribution plots -----------------------------------------------------------

#check how many reads we have for each sample in the edgeRlist_DE
edgeRlist_DE$samples$lib.size

# barplot to check how many reads we have for each sample
# save the plot in out/dif_exp_DE folder
jpeg("../out/dif_exp_DE/barplot_libsize.jpg")
barplot(edgeRlist_DE$samples$lib.size/1e06, names=colnames(edgeRlist_DE), las=2, ann=FALSE, cex.names=0.75)
mtext(side = 1, text = "Samples", line = 4)
mtext(side = 2, text = "Library size (millions)", line = 3)
title("Barplot of library sizes")
dev.off()

#Boxplot of logCPMs unnormalised
#save the plot out/dif_exp_DE folder
jpeg("../out/dif_exp_DE/boxplot_logCPMs_unn.jpg")
#Get log2 counts per million
logcounts <- cpm(edgeRlist_DE,log=TRUE)
# Check distributions of samples using boxplots
boxplot(logcounts, xlab="", ylab="Log2 counts per million",las=2)
# Let's add a blue horizontal line that corresponds to the median logCPM
abline(h=median(logcounts),col="blue")
title("Boxplots of logCPMs (unnormalised)")
dev.off()

##--------------------------------------------------data normalization---------------------------------------------------------------

#TMM normalization is performed to eliminate composition biases between libraries
# Apply normalisation to DGEList object
edgeRlist_DE <- calcNormFactors(edgeRlist_DE, method = "TMM")

##Visualize the normalization factors  which have to be 1 or near to 1
edgeRlist_DE$samples

#-----------------------------------------------Data exploration and quality assesment-----------------------------------------------------------------------

## Plot to evaluate the correct data normalization 
## Plot the results using absolute vs relative expression in each sample to check the correct normalization

pdf("../out/dif_exp_DE/MD_plots.pdf", height = 7, width = 10)
par(mfrow = c(2, 3)) ##Generate a frame to store 6 plots in 2 rows and 3 columns
for (i in c(1:18)) {
  print(plotMD(cpm(edgeRlist_DE, log = T), column = i))
  grid(col = "blue")
  abline(h = 0, col = "red", lty = 2, lwd = 2)
}
dev.off()

#We can verify the consistency of the replicas through a principal component analysis

pch <- c(16, 17, 16, 17, 16,17)
colors <- rep(c("#CC33CC", "#336600","#CC0066", "#006633", "#FF0066", "#33FF00"), 1)
plotMDS(edgeRlist_DE, col=colors[groups], pch=pch[groups], dim.plot = c(1,2), ndim = max(2))
legend("topright", legend=levels(groups), pch=pch, col=colors, ncol=2)
title(main = "PCA D. eichlamii")


#Heatmap to explor data
#calculating the correlation (Pearson) that exists between the samples

cormat <- cor(cpm(edgeRlist_DE$counts, log = T))
pheatmap(cormat, border_color = NA, main = "D.eichlamii Correlation of replicates")

#In order to check the correct normalization of the samples we repeat the boxplot
# Get log2 counts per million
jpeg("../out/dif_exp_DE/boxplot_logCPMs_norm.jpg")
logcounts <- cpm(edgeRlist_DE,log=TRUE)
# Check distributions of samples using boxplots
boxplot(logcounts, xlab="", ylab="Log2 counts per million",las=2)
# Let's add a blue horizontal line that corresponds to the median logCPM
abline(h=median(logcounts),col="blue")
title("transformed logCPMs")
dev.off()

#--------------------------------------Differential expression analysis------------------------------------------------------------

#Experiimental matrix design
design <- model.matrix(~0+edgeRlist_DE$samples$group)
design

##the term ~0 tells the function not to include a column of intersections and only include as many columns as groups in our experimental design
colnames(design) <- levels(edgeRlist_DE$samples$group)

#explore design
design

#data dispersion
edgeRlist_DE <- estimateDisp(edgeRlist_DE, design = design, robust = T)
plotBCV(edgeRlist_DE, main = "dispersion de los datos en D. eichlamii")

#estimation of QL dispersions
#Data must fit a negative bi-nominal linear model. For this, the glmQLfit function will be used with which there is a more robust control of the error
fit <- glmQLFit(edgeRlist_DE, design, robust=TRUE, dispersion = edgeRlist_DE$trended.dispersion)
head(fit$coefficients)

#Plot QL dispersion using fit object
plotQLDisp(fit, main = "Quasi Likelihood dispersion in D. eichlamii")

#Contrast matrix for nine comparisons 
#Since we are interested in differences between groups, we need to specify which comparisons we want to test.

contrast_matrix <- makeContrasts(
  DE1_PAvsDE2_PA = DE1_PA - DE2_PA ,
  DE2_PAvsDE3_PA = DE2_PA - DE3_PA ,
  DE1_PAvsDE3_PA = DE1_PA - DE3_PA , 
  DE1_PCvsDE2_PC = DE1_PC - DE2_PC ,
  DE2_PCvsDE3_PC = DE2_PC - DE3_PC ,
  DE1_PCvsDE3_PC = DE1_PC - DE3_PC , 
  DE1_PAvsDE1_PC = DE1_PA - DE1_PC ,
  DE2_PAvsDE2_PC = DE2_PA - DE2_PC ,
  DE3_PAvsDE3_PC = DE3_PA - DE3_PC , levels=design)

contrast_matrix

#Create the object contr_leves
contr_levels<-attributes(contrast_matrix)$dimnames$Contrasts

#Adjust data to Binomial (BN) method and generate volcano plots for every comparisson
pdf("../out/dif_exp_DE/volcano_plots.pdf", height = 7, width = 10)
par(mfrow = c(2, 3)) ##Generate a frame to store 6 plots in 2 rows and 3 columns
dif_exp_results<-data.frame() #Empty data frame
  for (i in c(1:9)) {
  qlf.BvsA.lfc1 <- glmTreat(fit, ##Object in list form with data fitted to a negative bi-nominal model
                            contrast = contrast_matrix[, i], 
                            lfc = 1)
  ##We obtain the SDRs with an expression other than 1, p value less than 0.05, correcting the p value by the Benjamini-Hochberg method
  deg.BvsA.lfc1 <- decideTestsDGE(qlf.BvsA.lfc1, p.value = 0.05, adjust.method = "BH", lfc = 1)
  table(deg.BvsA.lfc1)
  #select the genes that statistically have | lfc | > 1 and strengthen our results
  DEG.BvsA.lfc1 <- DEGResults(qlf.BvsA.lfc1)
  DEG.BvsA.lfc1 <- edgeResults(DEG.BvsA.lfc1, logfc = 1, padj = 0.05)
  comparacion<-data.frame(comparacion = rep(contr_levels[i], times = nrow(DEG.BvsA.lfc1)))
  DEG.BvsA.lfc1 <-cbind(comparacion, DEG.BvsA.lfc1)
  dif_exp_results<-rbind(dif_exp_results, DEG.BvsA.lfc1)
  print(volcano_edgeR(DEG.BvsA.lfc1, lfc = 1, padj = 0.05) + #print volcano_plots
          labs(title = contr_levels[i])) #labs of comparissons
}
dev.off()

#export DEG.BvsA.lfc object whic contains all the genes before filter (51049 obs)
#This table will be used in GSEA analysis
write.table(DEG.BvsA.lfc1, file = "../data/dif_exp_analysis/DE/DEG.BvsA.lfc1.txt", row.names = FALSE)

#export DEG results as table
#This table also contains Not significative (NS) genes 
write.table(dif_exp_results, file = "../data/dif_exp_analysis/DE/dif_exp_results.txt", row.names = FALSE)

#Save in a new object the significant genes only which contain 25469 obs
significant.genes <- dif_exp_results %>% filter(FDR < 0.05 & logFC > 1 | FDR < 0.05 & logFC < -1)
paste("The number of significant genes with |lfc| > 1 is", length(significant.genes$genes))

#export table with significant genes
#This table will be used in ORA analysis
write.table(significant.genes, file = "../data/dif_exp_analysis/DE/significant_genes.txt", row.names = FALSE)

head(significant.genes, 10)

##Obtain the names or ids of the genes with differential expression
significant.ids <- significant.genes$genes
##Create a count matrix normalize by cpm (count per million), using the counts saved in the edgeRlist_DE object
significant.cpm <- cpm(edgeRlist_DE$counts, log = T)
##Cut genes with significative expression
significant.cpm <- significant.cpm[significant.ids, ]

head(significant.cpm, 10)
#export table with genes with significant expression and ids
write.table(significant.cpm, file = "../data/dif_exp_analysis/DE/signi_cpm.txt", row.names = FALSE)

##Generate a color palette
OBW <- maPalette(low = "orange", high = "blue", mid = "white")

##get a heatmap using significant.cpm object
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
#Using the data in significant.cpm we will extract the gene clusters
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
