
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

More details of the experiment design and lab metodology available in  [Disocactus_project.md](project_info/Disocactus_project.md).

</div>

<p align="center">
<img src="project_info/flores.jpg" width="800">
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

---
<div class=text-justify>

### Data information

- The sequence platform used in this study was Illumina Hiseq4000
- The samples were sequenced to 2x150PE with a depth of 20M reads per sample.
The quality of the samples were evaluated with bioanalyzer. Samples with RIN (RNA Integrity Number) values  ⋝ 7 were sequenced while samples with RINA values ⋜ 7 were resequenced.
- In total 36 samples were sequenced: 18 for *D. echlamii* and 18 for *D. speciosus*
- *D.eichlamii* samples are divided in two: nine correspond to pericarpel tissue and the oher nine correspond to perianth tissue.
- *D.speciosus* samples are divided in two: nine correspond to pericarpel tissue and the oher nine correspond to perianth tissue.
- The code use to identify the samples are the following:

**NOTE**:Once the research is published, all the data will be available in a data repository.


---
### id code pattern

All the samples independing if they correspond to RNA or they are anatomical samples have the same id code pattern in order to facilitate the identification.

Inlcuir una figura para explicar el id code

</div>

---

### Workflow

agregar figura con mi pipeline

---
### Computational prerequisites

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
---
### directories

 **[bin](/bin)**

Contains scripts used in thise project

**Note**
- `.r` scripts to run in Rstudio
- `.sh`  scripts in bash leanguage
- `.R` functions

**Scripts list**

<div class=text-justify>

- `01.data_quality_test.sh` check the quality of raw reads using fastQC and multiQC.
- `02.trimmomatic.sh` clean raw data using trimmomatic.
- `03.check_quality_clean.sh` check the quality of the clean data using fastQC and multiQC.
- `04.gunzip.sh` unzip the clean data.
- `05.fq_to_fa.sh` convert fq data to fasta format.
- `06.cat_samples.sh` concatenate de fasta files.
- `07.trinity_assembly.sh` make de novo assembly using Trinity.
- `08.kallisto_index.sh` create de index used in kallisto analysis.
- `09.Kallisto_quant.sh` quantify transcripts using kallisto.
- `10.DE_abun_est.sh` estimate abundances in DE samples through trinity.
- `11.DS_abun_est.sh` estimate abundances in DS samples through trinity.
- `12.count_expr_trans.sh` plot de number of transcripts, which use a perl function from [trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki).
- `13.plot_num_transcripts.r`plot count numbers of expressed transcripts in DS and DE.
- `14.quality_check_samples.sh` Script for quality check samples using trinity PtR script.
- `busco_figure.r` create the BUSCO figure.
- `15.dif_exp_DE.r`   make differencial expression (DE) analysis using edgeR in D. eichalmii and create heatmaps and volcano plots.
- `16.dif_exp_DS.r` make DE analysis using edgeR in D. speciosus and create heatmap and volcano plots.
- `17.puntos_aleatorios.r` add aleatorie points in epidermal cell photos.
- `18.tepalos_graph.r`  analyze tepal cell growth in *Disocactus* species and produce graphics and statistics tables.
- `dif_exp_functions.R` functions used in DE analysis.


<br>

 **[data](/data)** <br>

<div class=text-justify>

- `measurements` folder has two sub folders which contais:
  - 1) `DE` folder with 40 tables in csv format. Every table has
 measurements of epidermal cells of tepals from *D.eichalmii*. This measurements were obtained using microphotographs of tepal epidermal cells and the [ImageJ](https://imagej.nih.gov/ij/download.html) program.
  - 2) `DS` folder with 83 files in csv format. Every file has measurements of epidermal cells of tepals from *D.speciosus*.

  Those files are separated because every one corresponds to a different tepal, from a different position in the flower: the position can be internal(int) or external (ext) and, from a different developmental stage (1-3). For example, the file called **Results_DS1_ext_11.csv** means: Results from *D. speciosus* developmental stage "1", tepal from external position, number of the tepal observed "11".

  This measurements were obtained using microphotographs of tepal epidermal cells and the [ImageJ](https://imagej.nih.gov/ij/download.html) program.

  The columns in every table are the following:
    - **Area**	in micrometers (um).
    - **Mean** the mean of all the measurements in the table.
    - **StdDev** standard deviation.
    - **Min**
    - **Max**
    - **Perim.** the perimeter of the cell.
    - **Median** the "middle" of the list of numbers.


   These data were used to obtain the graphs saved in `tepal_sizes` folder using the `tepalos_graph.r` script.

**[meta](/meta)**<br>

Constains all information about samples. <br>

- `Diso_code.csv` table with information about the RNA sequentiation.
The information in the table is the following:

   - **species** column which has the names of the species used in the research that can be *D. speciosus* or *D. eichlamii*.
   - **stage** in this column is indicated with a number the developmental stage of the flower sequenced. This number can be 1, which corresponds to the smallest flower, 2 which corresponds to the intermediate flower, and 3 which correspond to the biggest flower included in the study.
   - **flower_number** in this column is indicated the number of the flower collected.
   - **tissue** in this column is indicated the type of tissue sequenced:  pericarpel or perianth.
   - **sample_code** code assigned to the flower sample collected.
   - **RNA-sample** code assigned to the RNA sample send to sequenced.
   - **Concentración(ng/ul)** RNA concentration in ng/ul in the sample.
   - **OD260/280** used as a measure of purity in both DNA and RNA extractions. A 260/280 ratio of ~2.0 is generally accepted as “pure” for RNA.
   - **OD260/230** these values indicate the purity of the nucleic acid. Expected 260/230 values are commonly in the range of 2.0-2.2.
   - **RIN	28S/18S** (RNA integrity number). Which indicates the grade of RNA integrity, High-quality RNA will contain an RIN of at least 8, where partially fragmented RNA will contain an RIN within the range of 6–8.


- `sample_size.csv` Table with information about developmental stage and flower sizes (cm) collected. The information in the table is the following:
  - **species** species name.
 - **stage** developmental stage of the flower collected.
 - **sample_code** code assigned to the flower sample collected.
 - **flower_size** the size in cm of the flower collected which was used to define the developmental stage.


- `samples.txt` Table with information used in the Diferencial Expression analysis.
The information in the table is the following:
 - **sample_name**
 - **sample_replicate_name**
 - **tissue**
 - **development_stage** developental stage, that coul be 1 to 3

**[project_info](/project_info)**

 - `Disocactus_project.md` contains project extra information like: species distribution, samples, RNA extraction methodology, etc.
 - `supertranscripts.md` contais info about supertranscripts methodology.


**[out](/out)** <br>

Contains results of all analysis made in the research

- `BUSCO_summaries` contains BUSCO out data produce by the program and bar plot whit information about .

   - `DS_trans.ca-results.txt`
   - `DE_trans.ca-results.txt`
   - `full_table` tow file one per species
   - `mising_busco_list` two files one per species
   - `short_summary` two files one per species
   - busco_figure.png
  >
- `tepal_sizes` contains graphics and tables related to cell sizes statistics analysis in different developmental stages.
   - DS_cell_growth.jpeg: *D.speciosus* graphic
   - DE_cell_growth.jpeg: *D. eichalmii* graphics
   - DE_statistics.jpeg and DS_statistics.jpeg contains table with:
    - estadio:
    - posicion:
    - Media:
    - sd:
   >
- `dif_exp_DS` contains results from differential expression analysis made with edgeR for *D. speciosus* species.
- `dif_exp_DE` contains results from differential expression analysis made with edgeR for *D. eichalmii* species.

>
---

### Discussion

The results shows that


---

**Credits:**

* **Isaura Rosas Reinhold**

**License**
