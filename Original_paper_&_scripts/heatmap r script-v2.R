library(gplots)
reads <- read.csv("heatmap reads.csv", sep = ",")
reads2 <- reads[1:13926, 1:5]
rownames(reads) <- make.names(reads$Flybase.ID, unique = TRUE)

#clean the first column and log2 transform
reads$Flybase.ID <- NULL
matrix <- data.matrix (reads) + 1
log_matrix <- log2(matrix)
matrixnew <- log_matrix[1:13925, 1:4]

#cluster it
hr <- hclust(as.dist(1-cor(t(matrixnew), method = "pearson")), method = "complete")

# define some clusters
mycl <- cutree(hr, h=max(hr$height/1.5))

# get a color palette equal to the number of clusters
clusterCols <- rainbow(length(unique(mycl)))

# create vector of colors for side bar
myClusterSideBar <- clusterCols[mycl]

# choose a color palette for the heat map
myheatcol <- rev(redblue(75))

# draw the heat map
heatmap.2(matrixnew, main="Hierarchical Cluster", Rowv=as.dendrogram(hr), dendrogram = "row", Colv=NA,  scale="row", col=myheatcol, density.info="none", trace="none", RowSideColors= myClusterSideBar, margins = c(10,8))

#add the cluster ID to my data
foo <- cbind(matrixnew, clusterID= mycl)
cluster <- foo[hr$order,]
write.table(cluster, file = "cluster_data.csv", sep = ",")
