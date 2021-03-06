######################################
#
# BUSCO summary figure
# @version 3.0.0
# @since BUSCO 2.0.0
#
# Copyright (c) 2016-2017, Evgeny Zdobnov (ez@ezlab.org)
# Licensed under the MIT license. See LICENSE.md file.
#
######################################

#Run this script from directory ~/bin/ and the data are in ~/out/BUSCO_summaries/

#set working dir
setwd("~/Documentos/EpiDiso/Disocactus_transcriptome/bin")

# Load the required libraries
library(ggplot2)
library("grid")

# !!! CONFIGURE YOUR PLOT HERE !!!
# Output
my_output <- paste("../out/BUSCO_summaries/","busco_figure.png",sep="/") 
my_width <- 20
my_height <- 15
my_unit <- "cm"

# Colors
my_colors <- rev(c("#56B4E9", "#3492C7", "#F0E442", "#F04442")) #modified from the original
# Bar height ratio
my_bar_height <- 0.75

# Legend
my_title <- "BUSCO Assessment Results"

# Font
my_family <- "sans"
my_size_ratio <- 1

# !!! SEE YOUR DATA HERE !!!
# Your data as generated by python, remove or add more
my_species <- c('202011110210-B1YMW2LFF1NY5T3G_DE_trans', '202011110210-B1YMW2LFF1NY5T3G_DE_trans', '202011110210-B1YMW2LFF1NY5T3G_DE_trans', '202011110210-B1YMW2LFF1NY5T3G_DE_trans', '202011130225-2UYQ7UZQW196S6XC_DS_trans', '202011130225-2UYQ7UZQW196S6XC_DS_trans', '202011130225-2UYQ7UZQW196S6XC_DS_trans', '202011130225-2UYQ7UZQW196S6XC_DS_trans')
my_species <- factor(my_species)
my_species <- factor(my_species,levels(my_species)[c(length(levels(my_species)):1)]) # reorder your species here just by changing the values in the vector :
my_percentage <- c(10.8, 77.2, 3.6, 8.4, 8.8, 75.9, 4.4, 10.9)
my_values <- c(156, 1111, 52, 121, 127, 1093, 63, 157)

######################################
######################################
######################################
# Code to produce the graph
labsize = 1
if (length(levels(my_species)) > 10){
 labsize = 0.66
}
print("Plotting the figure ...")
category <- c(rep(c("S","D","F","M"),c(1)))
category <-factor(category)
category = factor(category,levels(category)[rev(c(4,1,2,3))]) #modified from the original
df = data.frame(my_species,my_percentage,my_values,category)

figure <- ggplot() +

  geom_bar(aes(y = my_percentage, x = my_species, fill = category), data = df, stat="identity", width=my_bar_height) +
  coord_flip() +
  theme_gray(base_size = 8) +
  scale_y_continuous(labels = c("0","20","40","60","80","100"), breaks = c(0,20,40,60,80,100)) + #modified from the original
  scale_fill_manual(values = my_colors,
                    labels =c("S" ="Complete (C) and single-copy (S)",
                              "D" = "Complete (C) and duplicated (D)",
                              "F" = "Fragmented (F)",
                              "M" = "Missing (M)")) +
  ggtitle(my_title) +
  xlab("") +
  ylab("\n%BUSCOs") +

  theme(plot.title = element_text(family=my_family, colour = "black", size = rel(2.2)*my_size_ratio, face = "bold")) +
  theme(legend.position="top",legend.title = element_blank()) +
  theme(legend.text = element_text(family=my_family, size = rel(1.2)*my_size_ratio)) +
  theme(panel.background = element_rect(color="#FFFFFF", fill="white")) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.grid.major = element_blank()) +
  theme(axis.text.y = element_text(family=my_family, colour = "black", size = rel(1.66)*my_size_ratio)) +
  theme(axis.text.x = element_text(family=my_family, colour = "black", size = rel(1.66)*my_size_ratio)) +
  theme(axis.line = element_line(size=1*my_size_ratio, colour = "black")) +
  theme(axis.ticks.length = unit(.85, "cm")) +
  theme(axis.ticks.y = element_line(colour="white", size = 0)) +
  theme(axis.ticks.x = element_line(colour="#222222")) +
  theme(axis.ticks.length = unit(0.4, "cm")) +
  theme(axis.title.x = element_text(family=my_family, size=rel(1.2)*my_size_ratio)) +

  guides(fill = guide_legend(override.aes = list(colour = NULL))) +
  guides(fill = guide_legend(reverse=T))  ### to change the order of the labels in the legend box (modified from the original)

  for(i in rev(c(1:length(levels(my_species))))){
    detailed_values <- my_values[my_species==my_species[my_species==levels(my_species)[i]]]
    total_buscos <- sum(detailed_values)
    figure <- figure +
    annotate("text", label=paste("C:", detailed_values[1] + detailed_values[2], " [S:", detailed_values[1], ", D:", detailed_values[2], "], F:", detailed_values[3], ", M:", detailed_values[4], ", n:", total_buscos, sep=""),
             y=3, x = i, size = labsize*4*my_size_ratio, colour = "black", hjust=0, family=my_family)
  }

ggsave(figure, file=my_output, width = my_width, height = my_height, unit = my_unit)
print("Done")
