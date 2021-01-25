<center>

## Summary

</center>

<br>
<div class=text-justify>

Although the Disocactus transcriptome project is unfinished, I had many good results and progress in these months.

 **RNA-seq and de novo assembly**

 To compare comprehensive gene expression profiles and characterization of the two *Disocactus* species flowers at three stages of development, transcriptome sequencing and analysis were performed. Following the removal of adaptor and low quality sequences, the clean reads were assembled into expressed sequence tag clusters (contigs) and de novo assembled into transcripts using the Trinity in paired-end method, which yielded a total of 148,690 unigenes with an average length of N50 of 1476 bp, and a GC content of 42.12 % *D. eichlamii* while in *D. speciosus* 123,809 unigenes with an average length of N50 of 1442 bp, and GC content of 42.82% (Table 1). Thus, the assembly quality of the transcriptome was satisfactory.

 Table 1.

 |species   	    |  N50 	    | E90N50   	| %GC   	|
 |---       	    |---	      |---	      |---	    |
 | D. eichlamii 	|   1476	  |  37176    |   42.12	|
 | D. speciosus  	|   1442	  |  41613	  |   42.82 |

 BUSCO software was used to conduct completeness analysis of the transcriptome.


</div>
<p align="center">
<img src="../out/BUSCO_summaries/busco_figure.png" width="800">
</p>

**Transcript Quantification and Analysis of Differentially Expressed Genes (DEGs)**

Transcript quantification was performed using kallisto software.Based on the transcript abundance estimates for each of the 36 samples, a matrix of counts and a matrix of normalized expression values were constructed using edgeR package. Analysis of differentially expressed genes (DEGs) was conducted using the edgeR package (Robinson et al., 2010).

DEGs were analyzed separatly for perianth and pericarpel tissues in both species *D. eichlamii* and *D. speciosus*. Differential genes were screened according to the edgeR filter criteria (FDR < 0.05 & logFC > 1 | FDR < 0.05 & logFC < -1). A volcano plots were used to display the screening results.

### DEGs in D. speciosus

To identify DEGs during flower development, we compared transcript levels of each unigene between developmental stages. In total, 36,668 genes were differentially expressed at different stages in *D. speciosus*. In the DS1_PA vs. DS2_PA comparison, 622 DEGs were detected, including 168 that were up-regulated and 454 that were down-regulated. In the DS2_PA vs. DS3_PA comparison, 7627 up-regulated and 5286 down-regulated transcripts were found. In the comparison of DS1_PA vs. DS3_PA, 9031 up-regulated and 7263 down-regulated transcripts were detected. In the comparison of DS1_PC vs. DS2_PC, 8 up-regulated and 11 down-regulated transcripts were revealed. In the DS2_PC vs. DS3_PC, 1200 up-regulated and 979 down-regulated. In the DS1_PC vs. DS3_PC, 2258 transcripts were up-regulated and 2383 down-regulated (Table 2).

In order to know the DEGs expressed between tissues from the same developmental stage. In total 9057 genes were differentially expressed in the different tissues. First, we compare DS1_PA vs. DS1_PC and 25 DEGs were detected, 9 up-regulated and 16 dow-regulated. In the DS2_PA vs. DS2_PC comparison, 976 DEGs were found, 461 up-regulated and 515 dow-regulated. Finally, in the DS3_PA vs. DS3_PC comparison 8056 DEGs were identified, 3180 up-regulated and 4876 down-regulated.

Table 2. DEGs identified in the differente comparisons made.

|  comparison 	|  up-regulated 	| down-regulated  	| total  	|
|---	          |---	            |---	              |---	    |
| DS1_PAvsDS2_PA|   168	          |    454            | 622     |
| DS2_PAvsDS3_PA|   7627          |   5286	          | 12913   |
| DS1_PAvsDS3_PA|   9031	        |   7263            | 16294   |
| DS1_PCvsDS2_PC|   8            	|   11	            | 19      |
| DS2_PCvsDS3_PC|   1200	        |  979              | 2179    |
| DS1_PCvsDS3_PC|   2258          |  2383 	          | 4641    |
| DS1_PAvsDS1_PC|   9             | 16  	            | 25      |
| DS2_PAvsDS2_PC|   461	          | 515               | 976     |
| DS3_PAvsDS3_PC|    3180         |   4876	          | 8056    |

### DEGs in D. eichlamii

To identify DEGs during flower development in *D. eichlamii*, we compared transcript levels of each unigene between developmental stages. In total, 17,852 genes were differentially expressed at different stages. In the DE1_PA vs. DE2_PA comparison, 873 DEGs were detected, including 231 that were up-regulated and 642 that were down-regulated. In the DE2_PA vs. DE3_PA comparison, 2960 up-regulated and 3390 down-regulated transcripts were found from 6350 genes. In the comparison of DE1_PA vs. DE3_PA, 4357 up-regulated and 5075 down-regulated transcripts were detected. In the comparison of DE1_PC vs. DE2_PC, 284 up-regulated and 418 down-regulated transcripts were revealed. In the DE2_PC vs. DE3_PC, 286 up-regulated and 170 down-regulated. In the DE1_PC vs. DE3_PC, 284 transcripts were up-regulated and 418 down-regulated (Table 3).

In order to know the DEGs expressed between tissues from the same developmental stage, we compare DEGs in the perianth vs. pericarpel corresponding to the same stage of development. In total 7616 genes were differentially expressed in the different tissues. we compare DE1_PA vs. DE1_PC and 454 DEGs were detected, 278 up-regulated and 176 dow-regulated. In the DE2_PA vs. DE2_PC comparison, 1325 DEGs were found, 759 up-regulated and 566 dow-regulated. Finally, in the DE3_PA vs. DE3_PC comparison 5837 DEGs were identified, 3208 up-regulated and 2696 down-regulated.


Table 3.

|  comparison 	|  up-regulated 	| down-regulated  	| total  	|
|---	          |---	            |---	              |---	    |
| DE1_PAvsDE2_PA| 231  	          |  642              | 873     |
| DE2_PAvsDE3_PA| 2960            | 3390  	          | 6350    |
| DE1_PAvsDE3_PA| 4357  	        | 5075              | 9432    |
| DE1_PCvsDE2_PC| 5              	|  34 	            | 39      |
| DE2_PCvsDE3_PC| 286  	          |  170              | 456     |
| DE1_PCvsDE3_PC| 284             |  418 	            | 702     |
| DE1_PAvsDE1_PC| 278             | 176  	            | 454     |
| DE2_PAvsDE2_PC| 759  	          |566                | 1325    |
| DE3_PAvsDE3_PC| 3208            | 2629  	          | 5837    |

</div>
<p align="center">
<img src="../project_info/volcano_DE.jpg" width="800">
</p>

Finally the gene annotation was made using the Trinotate and TransDecoder programs but this analysis still in progress, so know I will not be able to give a biological sense to my DEGs results in this moment.



</div>
