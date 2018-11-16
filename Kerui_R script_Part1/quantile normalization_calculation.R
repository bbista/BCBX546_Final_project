#using ggplot to see distribution of exp data before transformation
qt_transform <- read.csv("after_qt transf.csv", header = TRUE, sep = ",")
qt_log_transform <- read.csv("qt_log2_transf.csv", header = TRUE, sep = ",")
original <- read.csv("original_data.csv", header = TRUE, sep = ",")

#first convert from wide to long format to draw box plot
#https://stackoverflow.com/questions/45222685/how-to-use-ggplot-to-boxplot-a-gene-expression-dataframe-subsetting-only-a-speci
library(tidyverse)
genotype <- c(colnames(original[-1]))
df1 <-  gather(original, genotype, expression, -Gene.number)
#yfactor <- c(original$yw_FPKM, original$w1118_FPKM, original$H2O.Y_FPKM)
library(ggplot2)
p10 <- ggplot(df1, aes(x = genotype, y = expression)) + 
  geom_boxplot(fill = "gold1",colour = "goldenrod2") 
                                                                    
p10

#only qt transformation
genotype <- c(colnames(qt_transform[-1]))
df2 <-  gather(qt_transform, genotype, expression, -Gene.number)
#yfactor <- c(original$yw_FPKM, original$w1118_FPKM, original$H2O.Y_FPKM)
library(ggplot2)
p11 <- ggplot(df2, aes(x = genotype, y = expression)) + 
  geom_boxplot(fill = "gold1",colour = "goldenrod2") 

p11

#log2 and qt transformation
genotype <- c(colnames(qt_log_transform [-1]))
df3 <-  gather(qt_log_transform, genotype, expression, -Gene.number)
#yfactor <- c(original$yw_FPKM, original$w1118_FPKM, original$H2O.Y_FPKM)
library(ggplot2)
p12 <- ggplot(df3, aes(x = genotype, y = expression)) + 
  geom_boxplot(fill = "gold1",colour = "goldenrod2") 

p12
