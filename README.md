
# **Comparative transcriptomics of flower development of *Disocactus* genus (Hylocereae, Cactaceae)**

---

In this repository you will find RNA-seq data analysis and scripts of  *de novo* assembly and annotation from cacti flower development of two species *Disocactus* genus: *D. speciosus* (Fig. 1) and *D. eichlamii* (Fig. 2).
## Disocactus background
<br>

*Disocactus* is an epiphytic cacti genus, principaly distribuited in Mexico but is also present in centralamericas. The genus is confomerd by 13 species, with constrastant flower morphology making *Disocactus* a model genus to studie flower diversification in cacti. [Phylogenetic studies made with cDNA](https://bioone.org/journals/willdenowia/volume-46/issue-1/wi.46.46112/Molecular-phylogeny-and-taxonomy-of-the-genus-iDisocactus-i-iCactaceae/10.3372/wi.46.46112.full) had shown that *Disocactus* is a monophyletic group member of [Hylocereeae tribe](https://www.researchgate.net/publication320829990_A_phylogenetic_framework_for_the_Hylocereeae_Cactaceae_and_implications_for_the_circumscription_of_the_genera) and sister to *Epiphyllum* and *Pseudorhipsalis* genus.<br>
<br>

![D.speciosus](D.speciosus.JPG)
<br>

**Fig. 1. *D. speciosus*, anthesis flower**. Photo by Isaura Rosas Reinhold
<br>
<br>

![D.eichlamii](D.eichlamii.jpg)

**Fig. 2. *D. eichlamii***<br>
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
- trimmomatic<br>
- fastQC<br>
- Bridger<br>
- Trinity<br>
- Kallisto<br>
- Rstudio<br>
- Transdecoder<br>


##### R packages
- DeSeq2<br>

##### PC info <br>

#### directories:

 **bin**

 - ```.r``` scripts
 -     ```.sh``` scripts
 - the ```unused``` folder contais scripts to probe and practice finall analisys

Contains:<br>


 **data** <br>

Contains<br>

- ```measures``` folder wich contains epidermal cell measures organized in two different folders: 1) ```DE``` folder and 2) ```DS``` folder

**meta**<br>

Constains information about samples <br>

- ```Diso_names.csv```Table with sample names and identification code

 **The id code** follows the next order: **DE** for *D.eichlamii* and **DS** for *D.speciosus*, then the number of the developmental stage 1-3, then separeted by a - is the collection number and finally are two words PA if the tissue belongs to perianth or PC if the tissue belongs to pericarpel. For example **DE1-4PA**.

**out** <br>

Contains results of all analysis

- assembly
- Quantification
- 



**Credits:**

* **Isaura Rosas Reinhold**
