
#!/bin/bash
#Script to calculate ExN50 in two different trinity assemblies
#Run this script after generate expression matrix with kallisto


#Script to calculate Ex90N50 using trinity


contig_ExN50_statistic.pl ../out/DE_exp_matrix/DE.isoform.TMM.EXPR.matrix \  #ExN50 trinity command
                          ../out/DE_Trinity_clean/Trinity.fasta | tee ExN50.stats

#Convert ExN50.stats to pdf

cd ../out/DE_Trinity_clean #enter to out directory

plot_ExN50_statistic.Rscript ExN50.stats #convert to pdf

xpdf ExN50.stats.plot.pdf


#Script to calculate Ex90N50 using trinity

contig_ExN50_statistic.pl ../out/DS_exp_matrix/DS.isoform.TMM.EXPR.matrix \  #ExN50 trinity command
                          ../out/DS_Trinity_clean/Trinity.fasta | tee ExN50.stats


#Convert ExN50.stats to pdf

cd ../out/DS_Trinity_clean #enter to out directory

plot_ExN50_statistic.Rscript ExN50.stats #convert to pdf

xpdf ExN50.stats.plot.pdf
