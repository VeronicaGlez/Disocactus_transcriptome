library(imager)
library(reshape2)
library(dplyr)
library(ggplot2)
library(ggpubr)
library(gtools)

# get tif files
x<-list.files(paste0("../Fotos/"))
tif_file<-x[grep("*.tif", x) ]

tif_df <- data.frame()

## plot photos for every file
for (j in 1:length(tif_file)){
  # read Q file
  tif_photo <- load.image(paste0("../Fotos/", tif_file[j]))
  
  #Crear los puntos aleatorios 
  x2 <- runif(30, 0, 2048)
  x2 <- data.frame(x2) 
  y2 <- runif(30, 0, 2048)
  y2 <- data.frame(y2)
  
  #crear la matriz con los puntos
  data_points <- cbind(x2, y2)
  
  #Convertir a data.frame
  tif_df[j] <- as.data.frame(tif_photo, wide="c") %>% mutate(rgb.val=rgb(c.1,c.2,c.3))
  
  #Graficar
 plt <-  ggplot(data_points, aes(x = x2, y = y2)) +
    background_image(tif_photo)+
    geom_point(aes(), alpha = 0.3, size = 0.5, colour = "red")
  
 # Salvar
 ggsave(plt, file=paste0(tif_file[j],".png"), width = 14, height = 10, units = "cm", path = "../Out")
  
}
