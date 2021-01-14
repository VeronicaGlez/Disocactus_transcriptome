#Script to plot the number of transcripts
# Plotting the number of transcripts as a function of minimum TPM threshold

data = read.table("../out/DE_exp_matrix/trans_matrix.TPM.not_cross_norm.counts_by_min_TPM", header=T)
plot(data, xlim=c(-100,0), ylim=c(0,100000), t='b')
