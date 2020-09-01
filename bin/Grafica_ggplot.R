Est <- rep(c("A", "B", "C"), each = 300)

Ser <- rep(c("Ext", "Int"), times = 450)

cell <- round(runif(900,10,100), 2)

Cell <- as.data.frame(cell)

prueb_tep <- as.data.frame(cbind(Est, Ser))

prueb_tep <- cbind(prueb_tep, Cell)


library(ggplot2)

head(prueb_tep)

str(prueb_tep)


library(ggplot2)

DS <- read.csv("")

ggplot(prueb_tep, aes(x=Est, y=cell)) +
  geom_boxplot(aes(fill=Ser)) 
