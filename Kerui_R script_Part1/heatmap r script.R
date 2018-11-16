library(gplots)
hm <- read.csv("Transform of mev.csv", sep= ",")

hm <- hm[order(hm$H2O.Young),]

hm$X <- NULL
hm_matrix <- data.matrix(hm)
hm_heatmap <- heatmap (hm_matrix, Rowv=NA , Colv=NA, col = cm.colors(256), scale="column", margins = c(5,10))
heatmap.2(hm_matrix, xlab = "Treatments", ylab = "Genes", labRow = FALSE, 
          labCol = FALSE,  margins = c(10,10), main = "Heatmap analysis", scale = "row", trace = "none")
