
# **Comparative transcriptomics of flower development of *Disocactus* genus (Hylocereae, Cactaceae)**

---

In this repository you will find RNA-seq data analysis and scripts of  *de novo* assembly and annotation from cacti flower development of two species *Disocactus* genus: *D. speciosus* and *D. eichlamii* (Fig. 1).
## *Disocactus* background
<br>

*Disocactus* is an epiphytic cacti genus, principaly distribuited in Mexico but is also present in centralamericas. The genus is confomerd by 13 species, with constrastant flower morphology making *Disocactus* a model genus to studie flower diversification in cacti. [Phylogenetic studies made with cDNA](https://bioone.org/journals/willdenowia/volume-46/issue-1/wi.46.46112/Molecular-phylogeny-and-taxonomy-of-the-genus-iDisocactus-i-iCactaceae/10.3372/wi.46.46112.full) had shown that *Disocactus* is a monophyletic group member of [Hylocereeae tribe](https://www.researchgate.net/publication320829990_A_phylogenetic_framework_for_the_Hylocereeae_Cactaceae_and_implications_for_the_circumscription_of_the_genera) and sister to *Epiphyllum* and *Pseudorhipsalis* genus.<br>
<br>
In this project I used RNA-seq data from flowers of two different species of *Disocactus*: *D. speciosus* and *D. eichlamii*.  The flowers were collected from The Epiphytic Cacti Collection at [UNAM Botanical Gaden]().<br>
<br>
The samples were processed at the Botanical Garden, UNAM and sequenced at Beiging Genomic Center [(BGI)](BGI).

![flores](flores.jpg)
<br>

**Fig. 1. flowers of *D. speciosus* and *D. eichlamii* in anthesis**. Photos by Isaura Rosas Reinhold
<br>
<br>
<br>

---
#### Objective

Identification of genetic expression patterns during flower development in two *Disocactus* species   and its relation with morphologic diversity in the group.
<br>
<br>
#### Particular objectives <br>

**1.** *De novo* assembly and annotation of transcriptomes from two *Disocactus* species.


**2.** Determined and compare the genetic expression patterns in flower tissue and pericarpel tissue in every developmental stage.


**3.** Selection of genes involved in flower development for comparative transcriptomic analysis.

<br>

---
#### Prerequisites
##### Software:
- [trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)<br>
- [fastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)<br>
- [Bridger](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-015-0596-2)<br>
- [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki)<br>
- [Kallisto](https://pachterlab.github.io/kallisto) <br>
- [R](https://www.r-project.org/)<br>
- [Transdecoder](https://github.com/TransDecoder/TransDecoder/wiki)<br>


##### R packages
- [DeSeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)<br>

##### PC info <br>

#### directories:

 **bin**

 - ```.r``` scripts
 -     ```.sh```  scripts
 - the ```unused``` folder contais scripts to probe and practice finall analisys

Contains:<br>


 **data** <br>

Contains<br>

- ```measures``` folder wich contains epidermal cell measures organized in two different folders: 1) ```DE``` folder and 2) ```DS``` folder

**meta**<br>

Constains information about samples <br>

- ```Diso_code.csv```Table with information of specie names, sample names, tissue type, identification code and RNA quality information.


**out** <br>

Contains results of all analysis made in the research

- assembly
- Quantification
- Expression clusters
- BUSCO
- Gene annotation



**Credits:**

* **Isaura Rosas Reinhold**
