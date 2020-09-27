## Comparative transcriptomics of flower development in *Disocactus* species (Hylocereae,Cactaceae)

---

#### Background

*Disocactus* is epifitic and epilitic cacti genus.
The [cDNA phylogenie](https://bioone.org/journals/willdenowia/volume-46/issue-1/wi.46.46112/Molecular-phylogeny-and-taxonomy-of-the-genus-iDisocactus-i-iCactaceae/10.3372/wi.46.46112.full) had shown that *Disocactus* is a monophyletic group altought it contrastan floral morphology. *Disocactus* has 13 species distribuited in Mexico and Central America. The principal features in *Disocactus* are flowers with vivid colors and diurnal anthesis. The morphologic diversity in the group can be observed in the size, color, hue, essence, number of periath segments, and shape (actinomorphic or zygomorphyc).

![phylogenie](phylogenie_morpho.jpg)


**Fig.1.** Phylogenie of *Disocactus* and flower morphology diversity.

![distribution](distribution.jpg)


**Fig. 2.** Distribution of *Disocactus*


---



#### Objective

Identification of genetic expresion patterns during flower development in two *Disocactus* species   and its relation with the morphologic diversity in the group.

#### Particular objectives


1. *de novo* assambly and annotation of transcriptomes from two Disocactus species.
2. Determined and compare the genetic expression patterns in flower tissue and pericarpel tissue in every developmental stage.
3. Selection of genes involved in flower development for comparative transcriptomic analysis.


---

### Material and methods

___


#### 1. Material colection

Three differente developmental stages of flower buds of *D. speciosus* and *D. eichlamii* were colected from plants of the Epiphytic Cacti Colection of the Botanical garden at UNAM.

![material](material.jpg)

---

#### 2. RNA extraction and quality assesment


For RNA extraction the flowers were disected separing flower tissue from pericarpel tissue, inmediatly the tissue was conserved in liquid nitrogen. For the extraction RNA [the spectrum plant total RNA kit](https://www.sigmaaldrich.com/catalog/product/SIGMA/STRN50?lang=es&region=MX) was used following the instructions of the kit.

The RNA quality assesment was performed using [bleach gel](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3699176/) and Invitrogen Qubit Fluorometric quantification and the RNA HS assay kit.

The RNA was analized by Bioanalyzern in the BGI lab,



![RNA-extraction](rna_extraction.jpg)



---

#### 3. Bioinformatic analysis
![pipeline](bioinformatics_methodology.jpg)

**Fig. 3**. Trancriptomics *de novo* assambly and analysis workflow. (modified from Haas *et. al*., 2013).

---

##### 3.1 Preprocesing data

![Preprocesing](preprocessing.jpg)


**Fig. 4.** Preprocesing data using [fastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/).

##### 3.2. Cleaning data

##### [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)

```
#!/bin/bash

# This script is for data cleaning using trimmomatic.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/
# Prerequisites: install trimmomatic 0.39 version

# make out directory for DE data

mkdir -p ../data/DE_clean


# Clean the DE sequences with trimmomatic

for i in `ls ../data/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do
echo ${i}
                     trimmomatic  PE -threads 4 ../data/DE/${i}_1.fq.gz ../data/DE/${i}_2.fq.gz \
                          ../data/DE_clean/${i}_1P.fq.gz  ../data/DE_clean/${i}_2P.fq.gz \
                          ../data/DE_clean/${i}_1U.fq.gz  ../data/DE_clean/${i}_1U.fq.gz \
                          ILLUMINACLIP:../data/DE/Illumina_adapters.fa:2:40:15 MINLEN:20 SLIDINGWINDOW:4:20

done

```


##### [Trimgalore](https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md)

````
#!/bin/bash

# This script is for data cleaning using trim_galore.
# Run this script from directory ~/bin/  and  the sequences are in ~/data/secuencias/DE/
# Prerequisites: install trim_galore 0.6.0_dev, Cutadapt 2.10
# memory used: 4 cores


# make out directory

mkdir -p ../data/secuencias/DE/trim


# Clean the sequences with trim_galor

for i in `ls ../data/secuencias/DE | grep ".fq.gz" | sed "s/_1.fq.gz//"| sed "s/_2.fq.gz//" | uniq` ; do

~/TrimGalore-0.6.5/trim_galore --phred33 --fastqc -illumina --gzip --paired -o ../data/secuencias/DE/trim ../data/secuencias/DE/${i}_1.fq.gz ../data/secuencias/DE/${i}_2.fq.gz;

done

````

###### Trimmomatic output


###### Trimgalore output








##### 3.4. *De novo* assambly

##### [Bridger](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-015-0596-2)

````
#!/bin/sh
# This script is for data assambling the transcriptome of D. eichlamii using Bridger.
# Run this script from directory ~/bin/  and  the data is in ~/data/DE/trim/test
# Prerequisites: install Bridger
#bridger comand
#$ -cwd
#$ -j y
#$ -V                    #export environment var
#$ -N bridger_tDE             #name Job
echo "************************************************************"
echo "*********" $HOSTNAME " ****** JOB_ID=" $JOB_ID "  *************"
echo "************************************************************"

SAMPLE="/users-d1/shinojosa/Mammillaria_Illumina/Mammilaria/Trancriptoma/Disocactus"

#bridger assambling

Bridger.pl --seqType fq --left  ${SAMPLE}/data/DE/trim/test/DE1-2PA_1_val_1.fq --right ${SAMPLE}/data/DE/trim/test/DE1-2PA_2_val_2.fq  --output ${SAMPLE}/out/bridger_DE_trim --CPU 30 --clean -k 25


````


##### [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki)
