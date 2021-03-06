#Script to compare epidermal cell sizes in tepals of DS and DE in three developmental stages
#Run this script from directory ~/bin/ and the data are in ~/data/measures/DE/

## load library 
library(dplyr)
library(ggplot2)
library(pander)
library(formattable)
library(tidyr)

#set working dir
setwd("~/Documentos/EpiDiso/Disocactus_transcriptome/bin")

# charge data with internal tepal measuerments from D. eichlammi species
int_files <- list.files("../data/measurments/DE/", pattern = "int|Int")

#Create a empty data frame
int_df <- data.frame()
#loop to create a data frame with area, estadio and postion info for internal tepals
for (i in 1:length(int_files)) {
  for (k in c("DE1", "DE2", "DE3")) { #developmental stages
     if (grepl(k, int_files[i]) == TRUE) {
    int <- read.csv(paste0("../data/measurments/DE/", int_files[i])) #read files with measurments of internal tepals (int)
    est <- data.frame(estadio = rep(k, times = nrow(int))) #data frame with developmental stages
    int <- cbind(int, est)
     int <- int %>% 
      select(Area, estadio)
    
    int_df <- rbind(int_df, int) } #data frame with area and estadio (developmental stage)
            
  }
}

int_name <- data.frame(posicion = rep("int", times = nrow(int_df))) #column with position 
int_df <- cbind(int_df, int_name) #cbind to combine int_df with int_name

#charge data with external tepal measurments
ext_files <- list.files("../data/measurments/DE/", pattern = "ext")
#empty data frame
ext_df <- data.frame()
#loop for
for (i in 1:length(ext_files)) {
  for (k in c("DE1", "DE2", "DE3")) { #developmental stages
    if (grepl(k, ext_files[i]) == TRUE) {
      ext <- read.csv(paste0("../data/measurments/DE/", ext_files[i])) #load data with external tepal measurments
      est <- data.frame(estadio = rep(k, times = nrow(ext))) #data frame with estadio column 
      ext <- cbind(ext, est) #data frame with estadio and area column
      ext <- ext %>% 
        select(Area, estadio)
     ext_df <- rbind(ext_df, ext) } #area and estadio data frame
  }
}

ext_name <- data.frame(posicion = rep("ext", times = nrow(ext_df)))

ext_df <- cbind(ext_df, ext_name) #final data frame with area, position and developental stage from external tepals

#Create a new data frame with internal and external measurments
Dis_eich <-rbind(ext_df, int_df)

# D_eichlamii boxplot comparig developmental stage versus cell area in um
# position int-ext is the position of the tepal in the perigon's flower

Dis_eich %>% 
  filter(Area < 75000) %>%
  ggplot(aes(x = estadio, y = Area, fill = posicion)) +
  geom_boxplot(outlier.colour="black", outlier.size=1) +
  xlab("Developmental stage") +
  ylab("Cell area (um)")

# Statistic analysis using the data in the Dis_eich object

Dis_stats <- Dis_eich %>%
  dplyr::group_by(estadio, posicion) %>%
  summarise(media = mean(Area), sd = sd(Area))

#Make table using pander library with statistic information
pander(Dis_stats, style = 'rmarkdown')

formattable(Dis_stats, align = c("c", "c", "c", "c"))

## Compare sizes between itern and extern tepals in D. speciosus
## load data of D. speciosus 
DS_int_files <- list.files("../data/measurments/DS/")
#Create an empty data frame
DS_df <- data.frame()
#loop to create a data frame with internal and external tepal measuerments
for (i in DS_int_files) {
  for (k in c("int", "ext")) {
    if (grepl(k, i) == TRUE){
      df_file <- read.csv(paste0("../data/measurments/DS/", i)) 
      Id <- data.frame(Id = (rep(stringr::str_extract(i, pattern = paste0("DS[1-3]_", k)), times = nrow(df_file))))
      df_file <- cbind(df_file, Id)
      df_file <- df_file %>% 
        select(Area, Id)
      DS_df <- rbind(DS_df, df_file) #data frame with area and Id (position and developmental stage) columns
    }
  }
}

# D_speciosus boxplot comparig developmental stage versus cell area in um
DS_df %>% 
  separate(Id, c("estadio", "posicion")) %>% #separete Id into estadio and position columns
  filter(Area < 75000) %>%
  ggplot(aes(x = estadio, y = Area, fill = posicion)) +
  geom_boxplot(outlier.colour = "black", outlier.size = 1) +
  ylab("Cell area (um)") +
  xlab("Developmental stage")

#Separate estadio and position and create a new column in the object Dis_esp
Dis_esp<-separate(DS_df, col = Id, c("estadio", "posicion"), sep = "_")

# Statistic analysis using the data in Dis_espe object
Dis_stats_spe <- Dis_esp %>%
  dplyr::group_by(Area, estadio) %>%
  summarise(media = mean(Area), sd = sd(Area))

#create a table with statistics using pander library
pander(Dis_stats_spe, style = 'rmarkdown')

formattable(Dis_stats, align = c("c", "c", "c", "c"))


sessionInfo()




            