#Script to compare epidermal cell sizes in tepals of DS and DE in three developmental stages
## library used 
library(dplyr)
library(ggplot2)
library(pander)
library(formattable)
library(tidyr)

# charge data from D. eichlammi specie
int_files <- list.files("../data/measures/DE/", pattern = "int|Int")

int_df <- data.frame()

for (i in 1:length(int_files)) {
  for (k in c("DE1", "DE2", "DE3")) {
   
    if (grepl(k, int_files[i]) == TRUE) {
    
    int <- read.csv(paste0("../data/measures/DE/", int_files[i]))
    
    est <- data.frame(estadio = rep(k, times = nrow(int))) 
    
    int <- cbind(int, est)
    
    int <- int %>% 
      select(Area, estadio)
    
    int_df <- rbind(int_df, int) }
            
  }
}


int_name <- data.frame(posicion = rep("int", times = nrow(int_df)))

int_df <- cbind(int_df, int_name)



ext_files <- list.files("../data/measures/DE/", pattern = "ext")

ext_df <- data.frame()

for (i in 1:length(ext_files)) {
  for (k in c("DE1", "DE2", "DE3")) {
    
    if (grepl(k, ext_files[i]) == TRUE) {
      
      ext <- read.csv(paste0("../data/measures/DE/", ext_files[i]))
      
      est <- data.frame(estadio = rep(k, times = nrow(ext))) 
      
      ext <- cbind(ext, est)
      
      ext <- ext %>% 
        select(Area, estadio)
      
      ext_df <- rbind(ext_df, ext) }
    
  }
}


ext_name <- data.frame(posicion = rep("ext", times = nrow(ext_df)))

ext_df <- cbind(ext_df, ext_name)

Dis_eich <-rbind(ext_df, int_df)


# D_eichlamii boxplot comparig developmental stage versus cell area in um
# position int-ext is the position of the tepal in the perigon's flower

Dis_eich %>% 
  filter(Area < 75000) %>%
  ggplot(aes(x = estadio, y = Area, color = posicion)) +
  geom_boxplot() +
  ylab("Área (um)")
    

# D_eichlamii table wiht statistics data: mean and sd in md format

Dis_stats <- Dis_eich %>%
  dplyr::group_by(estadio, posicion) %>%
  summarise(media = mean(Area), sd = sd(Area))

pander(Dis_stats, style = 'rmarkdown')

formattable(Dis_stats, align = c("c", "c", "c", "c"))


## Compare sizes between itern and extern tepals in D. speciosus
## charge data of D. speciosus 

DS_int_files <- list.files("../data/measures/DS/")

DS_df <- data.frame()

for (i in DS_int_files) {
  for (k in c("int", "ext")) {
  
    if (grepl(k, i) == TRUE){
      
      df_file <- read.csv(paste0("../data/measures/DS/", i))
      
      Id <- data.frame(Id = (rep(stringr::str_extract(i, pattern = paste0("DS[1-3]_", k)), times = nrow(df_file))))
      
      df_file <- cbind(df_file, Id)
      
      df_file <- df_file %>% 
        select(Area, Id)
      
      DS_df <- rbind(DS_df, df_file)
      
    }
  }
}



#DS bloxplot 

DS_df %>% 
  separate(Id, c("estadio", "posicion")) %>%
  filter(Area < 75000) %>%
  ggplot(aes(x = estadio, y = Area, color = posicion)) +
  geom_boxplot() +
  ylab("Área (um)")



# DS table with mean and ds








            