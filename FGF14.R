#loading packages
install.packages(c("readxl", "ggpmisc", "tidyverse", "rlang", "ggpubr", "modelr", 'patchwork', 'writexl'))
packages <- c("readxl", "ggpmisc", "tidyverse", "rlang", "ggpubr", "modelr", 'patchwork', 'writexl')
lapply(packages, library, character.only = T)
setwd("~/Desktop/fgf14files")
fgf14data <- read_excel("fgf14.xlsx", sheet = "Sheet1")
#creating data frame for the first allele
nanopore1 <-  fgf14data$`Nanopore Length Allele 1`
pcr1 <- fgf14data$`PCR Band Length Allele 1`

fgf14df1 <- data.frame(nanopore1,pcr1)
#fdf14mean <- aggregate(pcr1 ~ nanopore1, data = fgf14df1, FUN = mean)
#my.formula <- y~x


#Plotting results from the first allele of 7feb24
fgf14plot1 <- ggplot(data = fgf14df1, aes(x = nanopore1, y = pcr1))+
  labs(x= "Nanopore Allele 1 Length (bp)", y= "PCR Allele 1 Length (bp)", title = "Nanopore VS PCR Allele 1 Length Correlation")+
  geom_point(color= "Green")+
  geom_smooth(method = "lm", se = F, formula = my.formula, lty='dashed', color='orange')+
  stat_regline_equation(label.x = 350, label.y = 450)+
  stat_cor(label.x = 350, label.y = 420)

#ggsave("22feb24_1.jpg", dpi=300, height=6, width=8)
fgf14plot1





fgf14data2 <- read_excel("fgf14.xlsx", sheet = "Hoja1")
#creating data frame for the second allele
nanopore2 <-  fgf14data2$`Nanopore Length Allele 2`
pcr2 <- fgf14data2$`PCR Band Length Allele 2`

fgf14df2 <- data.frame(nanopore2,pcr2)
#fdf14mean <- aggregate(pcr1 ~ nanopore1, data = fgf14df1, FUN = mean)
#my.formula <- y~x


#Plotting results from the second allele of 7feb24
fgf14plot2 <- ggplot(data = fgf14df1, aes(x = nanopore2, y = pcr2))+
  labs(x= "Nanopore Allele 2 Length (bp)", y= "PCR Allele 2 Length (bp)", title = "Nanopore VS PCR Allele 2 Length Correlation")+
  geom_point(color= "Green")+
  geom_smooth(method = "lm", se = F, formula = my.formula, lty='dashed', color='orange')+
  stat_regline_equation(label.x = 640, label.y = 640)+
  stat_cor(label.x = 640, label.y = 620)

#ggsave("22feb24_2.jpg", dpi=300, height=6, width=8)
fgf14plot2



