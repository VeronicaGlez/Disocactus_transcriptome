
# **Comparative transcriptomics of flower development of *Disocactus* genus (Hylocereae, Cactaceae)**

---


## *Disocactus* background
<br>
<div class=text-justify>

*Disocactus* is an epiphytic cacti genus, principaly distribuited in Mexico but is also present in Central America. The genus is confomerd by 13 species, with constrastant flower morphology like: color hues, sizes, variation in number of perianth elements, and form (zygomorphic or actinomorphic). This characteristics make *Disocactus* a model genus to studie flower diversification in epiphytic cacti. [Phylogenetic studies made with cDNA](https://bioone.org/journals/willdenowia/volume-46/issue-1/wi.46.46112/Molecular-phylogeny-and-taxonomy-of-the-genus-iDisocactus-i-iCactaceae/10.3372/wi.46.46112.full) had shown that *Disocactus* is a monophyletic group member of [Hylocereeae tribe](https://www.researchgate.net/publication320829990_A_phylogenetic_framework_for_the_Hylocereeae_Cactaceae_and_implications_for_the_circumscription_of_the_genera) and sister to *Epiphyllum* and *Pseudorhipsalis* genus.<br>
<br>
In this project I used RNA-seq data from flowers buds of two different species of *Disocactus*: *D. speciosus* and *D. eichlamii* (Fig.1).  The flowers buds were collected from The Epiphytic Cacti Collection at [UNAM Botanical Garden](http://www.ib.unam.mx/jardin/) and from the Reserva del Pedregal de San Angel [(REPSA)](http://www.repsa.unam.mx/).The samples were processed at the Botanical Garden, UNAM and the RNA was sequenced at Beiging Genomic Center [(BGI)](BGI) in Hong Kong, China.Most of the bioinformatic analysis were made through Hercules cluster in Barcelona, Spain. <br>
<br>
In this repository you will find RNA-seq data from cacti flower buds of two species *Disocactus* genus: *D. speciosus* and *D. eichlamii* and scripts of  *de novo* assembly, annotation and differential expression analysis.

</div>

<p align="center">
<img src="figures/flores.jpg" width="800">
</p>
<br>
<center>

**Fig. 1.** flowers of *D. speciosus* and *D. eichlamii* in anthesis. Photos by Isaura Rosas Reinhold

</center>
<br>


---


### General objective

<div class=text-justify>

Identification of genetic expression patterns during flower development in two *Disocactus* species and its relation with morphologic diversity in the group.

</div>


<div class=text-justify>

#### Particular objectives <br>

**1.** *De novo* assembly and annotation of transcriptomes from two *Disocactus* species.


**2.** Determined and compare the genetic expression patterns in flower tissue and pericarpel tissue in every developmental stage.


**3.** Selection of genes involved in flower development for comparative transcriptomic analysis.

</div>

<br>

---
### Prerequisites

#### Operative system

- [Ubuntu 20.04.1 LTS](https://www.ubuntu.com/)

#### Software

- [Trimmomatic v0.32](http://www.usadellab.org/cms/?page=trimmomatic)<br>
- [fastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)<br>
- [multiQC](https://multiqc.info/)
- [Trinity v2.4.0](https://github.com/trinityrnaseq/trinityrnaseq/wiki)<br>
- [Trinity v2.11.0](https://anaconda.org/bioconda/trinity)
- [Kallisto v0.43.0](https://pachterlab.github.io/kallisto) <br>
- [Kallisto v0.46.2](https://anaconda.org/bioconda/kallisto)
- [R v4.0.3](https://www.r-project.org/)<br>
- [Trinotate v3.1.1](https://github.com/Trinotate/Trinotate.github.io/wiki)
- [Transdecoder v5.5.0](https://github.com/TransDecoder/TransDecoder/wiki)<br>
- [BUSCO v4.1.4](https://busco.ezlab.org/busco_userguide.html)


#### R packages

- [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)<br>
- [tidyverse](https://www.tidyverse.org/)
- [ggplot2](https://ggplot2.tidyverse.org/)
- [edgeR](https://bioconductor.org/packages/release/bioc/html/edgeR.html)
- [PCAtools](https://bioconductor.org/packages/release/bioc/html/PCAtools.html)
- [marray](https://www.bioconductor.org/packages/release/bioc/html/marray.html)
- [pheatmap](https://cran.r-project.org/web/packages/pheatmap/pheatmap.pdf)
- [tximport](https://bioconductor.org/packages/release/bioc/html/tximport.html)
- [rhdf5](bioconductor.org/packages/release/bioc/html/rhdf5.html)
- [dplyr]()
- [limma](https://bioconductor.org/packages/release/bioc/html/limma.html)

#### Other programs used in this research

- [gVolante](https://gvolante.riken.jp/)
- [Galaxy]()

<br>
<br>

---
### directories

 **[bin](/bin)**

Contains scripts used in thise project

 - `.r` scripts
 - `.sh`  scripts
 - `.R` functions

<br>

 **[data](/data)** <br>

Contains all the data used in the analysis.

- `measures` folder wich contains epidermal cell sizes organized in two different folders: 1) `DE` folder and 2) `DS` folder

**[meta](/meta)**<br>

Constains information about samples. <br>

- `Diso_code.csv` Table with information of species names, sample names, tissue type, identification code and RNA quality information.

- `sample_size.csv` Table with information about developmental stage and flower sizes.
- `samples.txt` Table with information used in Diferencial Expression analysis


**[figures](/figures)**

In this folder you will find figures and photografies used to illustrate the project.


**[project_info](/project_info)**

 - `Disocactus_project.md` contains project extra information like: species distribution, samples, RNA extraction methodology, etc.
 - `Supertranscripts.md` contais info about supertranscripts methodology


**[out](/out)** <br>

Contains results of all analysis made in the research

- `BUSCO_summaries` contains BUSCO out data and plot
<br>
- `tepal_sizes` graphics and tables related to cell sizes statistics analysis in different developmental stages.
<br>
- `dif_exp_DS` contains results from differential expression analysis made with edgeR for *D. speciosus* specie.
 <br>
- `dif_exp_DE` contains results from differential expression analysis made with edgeR for *D. eichalmii* specie.
<br>




**Credits:**

* **Isaura Rosas Reinhold**
