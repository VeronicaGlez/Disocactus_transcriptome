
#Script to generate aleatory points over photographs of epidermall cells
##Run this script from directory ~/bin/ and the data are in ~/fotos/

# load packages
library(imager)
library(reshape2)
library(dplyr)
library(ggplot2)
library(ggpubr)
library(gtools)

#set working dir
setwdsetwd("~/Documentos/EpiDiso/Disocactus_transcriptome/bin")

# get tif files
x<-list.files(paste0("../fotos/"))
tif_file<-x[grep("*.tif", x) ]

tif_df <- data.frame()

## plot photos for every file
for (j in 1:length(tif_file)){
  # read Q file
  tif_photo <- load.image(paste0("../fotos/", tif_file[j]))
  
  #Create the aleatory point 
  x2 <- runif(30, 0, 2048)
  x2 <- data.frame(x2) 
  y2 <- runif(30, 0, 2048)
  y2 <- data.frame(y2)
  
  #Crate the matrix with points
  data_points <- cbind(x2, y2)
  
  #Convert to a data.frame
  tif_df[j] <- as.data.frame(tif_photo, wide="c") %>% mutate(rgb.val=rgb(c.1,c.2,c.3))
  
  #Graph
 plt <-  ggplot(data_points, aes(x = x2, y = y2)) +
    background_image(tif_photo)+
    geom_point(aes(), alpha = 0.3, size = 0.5, colour = "red")
  
 # Save the photos with the aleatory points in the ../out/photos/ folder
 ggsave(plt, file=paste0(tif_file[j],".png"), width = 14, height = 10, units = "cm", path = "../out/photos/")
  
}
