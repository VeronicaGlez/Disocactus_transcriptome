<center>

## Summary

</center>

<br>
<div class=text-justify>

Although the Disocactus transcriptome project is unfinished, I had many good results in these months.

 **De novo Assembly of Sequencing Reads**

Before assembly, the raw reads were filtered to obtain high-quality clean reads by removing adaptor sequences and duplication sequences using trimmomatic.

The *de novo* assemblies were made following the trinity pipeline. The quality of the assemblies was evaluated N50 and Nx50 statistics produce by trinity. Finally BUSCO software was used to conduct completeness analysis of the transcriptomes.

</div>
<p align="center">
<img src="/out/BUSCO_summaries/BUSCO_figure.png" width="800">
</p>

**Transcript Quantification and Analysis of Differentially Expressed Genes (DEGs)**

Using the clean data I also generates the reads quantification using Kallisto program. With the counts and edgeR library I made the Differentially expressed genes (DEGs) analysis. DEGs were analyzed separatly for perianth and pericarpel tissues in both species *D. eichlamii* and *D. speciosus*. Differential genes were screened according to the edgeR filter criteria (FDR < 0.05 & logFC > 1 | FDR < 0.05 & logFC < -1). A volcano plots were used to display the screening results.



Finally the gene annotation was made using the Trinotate and TransDecoder programs but this analysis still in progress, so know I will not be able to give a biological sense to my DEGs results in this moment.



</div>
