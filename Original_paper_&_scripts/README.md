# This is a group project. There are 5 people in this group. 

# we decided to work on a paper <https://www.biorxiv.org/content/biorxiv/early/2018/02/26/272179.full.pdf>

# Especially we want to reproduce figure 3 and figure 4

# For Figure 3, there are four categories : PCA, correlation, VennDiagram and Hierarchy Clustering Analysis.

PCA___figure 3A
http://www.r-bloggers.com/computing-and-visualizing-pca-in-r/
# load, data
data(x)

head(data,3)
# log transform
log.y <- log(x[,1:4])
y.species = x[,5]
# apply PCA
# scale. = TRUE is highly advisable, but default is FALSE
y.pca <- prcomp(log.y,
                cente = TRUE,
                scale. = TRUE)
# print method
print(y.pca)
# plot method
plot(y.pca, type ='1')
# summary method
summary(y.pca)
# predict pcs
predict(y.pca,
        newdata = tail(log.y,2))
# plot with ffbiplot 
library(devtools)
install_github("ggbiplot","vqv")

library(ggbiplot)
g <- ggbiplot(y.pca, obs.scale = 1, var.scale = 1,
              groups = y.species, ellipse = TRUE,
              circle = TRUE)
g <- g + scale_color_discrete(name = '')
g = <— g + theme(legend.direction = 'horizontal',
                 legend.position = 'top')
print(g)

Correlation_figure 3B, 3C, 3D
# load data
#if .txt tab file, use this
my_data <- read.delim(file.choose())
#if .csv file, use this
my_data <- read.csv(file.choose())
#use mtcars file in R as an example
data("mtcars")#load data
mtcars
my_data <- mtcars[,c(1,3,4,5,6,7)]
head(my_data, 6) # print the first 6 rows
res <- cor(my_data)#calculate correlation coefficients between the possible pairs of variable are shown.
res
round(res, 2)#round the decimals to 2 position
cor(my_data, use = "complete.obs")#handle missing values by case-wise deletion.
install.packages("Hmisc")#Hmisc package can compute the significance levels for spearman and pearson correlations with rcorr(). It returns both the correlation coefficients and p-value of the correlation for all possible pairs of columns in the data table.
library("Hmisc")
res2 <- rcorr(as.matrix(my_data))
res2
res2$r#extract the correlation coefficients
res2$P#extract the p-values



