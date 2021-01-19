#Script to plot the number of transcripts
# Run this script from directory ~/bin/ and the data are in ~/../out/DE_exp_matrix/
# Plotting the number of transcripts as a function of minimum TPM threshold

#set working dir
setwd("~/Documentos/EpiDiso/Disocactus_transcriptome/bin")

#load trans_matrix of D. eichlamii
data = read.table("../out/DE_exp_matrix/trans_matrix.TPM.not_cross_norm.counts_by_min_TPM", header=T)
#plot the number of transcrips
#save the plot in out/DE_exp_matrix
jpeg('../out/DE_exp_matrix/DE_num_trans.jpg')
plot(data, xlim=c(-100,0), ylim=c(0,100000), t='b')
dev.off()


#load trans_matrix of D. speciosus
data = read.table("../out/DS_exp_matrix/trans_matrix.TPM.not_cross_norm.counts_by_min_TPM", header=T)
#plot the number of transcrips
#save the plot in out/DE_exp_matrix
jpeg('../out/DS_exp_matrix/DS_num_trans.jpg')
plot(data, xlim=c(-100,0), ylim=c(0,100000), t='b')
dev.off()


