library(tidyverse)
normal <-  read.csv("normalized_log2_reads_3.csv", header = TRUE, sep = ",")
enriched <- read.csv("enriched genes_v2.csv", header = TRUE, sep = ",")
reads <- normal[, 2:4]

#un log2 transform all the values
log2 <-  as.data.frame(2^reads[1:3])
#adding a pseudo value of 1 to each expression
nozero_pseudo <- log2 [, c(1:3) ] + 1
#add back fly id
nozero_pseudo$Flybase <- normal$FlyBase.Gene.ID
# filter all the values that are <= 0.01
nozero <- nozero_pseudo[-which(rowMeans(nozero_pseudo[,1:3]) <= 0.01), ]



#Calculating enrichement score(es):
nozero_pseudo$es <- nozero_pseudo$H2O.Y_FPKM/((nozero_pseudo$yw_FPKM + nozero_pseudo$w1118_FPKM)/2)

#Sort genes according to es values:
tope <- arrange(nozero_pseudo, desc(es))
#Save file as csv:
write.csv(tope, file = "enriched genes_v5_qt_log2.csv", col.names = TRUE)
