library(tidyverse)
library(ggplot2)
library(plyr)
cuff <- read.csv("Galaxy430-Cuffdiff-gene FPKM tracking.csv", sep = ",", header = TRUE)
cuff_FPKM <- select(cuff, H2O.young_FPKM, H2O.old_FPKM, PQ.young_FPKM, PQ.old_FPKM)
cuff_FPKM_log10 <- log10(cuff_FPKM)

youngh2o <- cuff_FPKM_log10$H2O.young_FPKM
oldh2o <-  cuff_FPKM_log10$H2O.old_FPKM
youngpq <- cuff_FPKM_log10$PQ.young_FPKM
oldpq <-  cuff_FPKM_log10$PQ.old_FPKM

#Get equation and R-squared as string

#Making yH2O vs oH2O
yhoh <- data.frame(select(cuff_FPKM_log10, H2O.young_FPKM, H2O.old_FPKM))

lm_eqn = function(yhoh){
  m = lm(y ~ x, yhoh);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(coef(m)[1], digits = 2), 
                        b = format(coef(m)[2], digits = 2), 
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));                 
}

p1 <-  ggplot(yhoh, aes(H2O.young_FPKM, H2O.old_FPKM))
g <- p1 + geom_point() + geom_smooth(method = 'lm', col = "red")


plot(yhoh$H2O.young_FPKM,yhoh$H2O.old_FPKM)
abline(lm(yhoh$H2O.old_FPKM~yhoh$H2O.young_FPKM))

(db.yhoh)

#Remove all the -INF value
finite_yhoh <- yhoh[!is.infinite(rowSums(yhoh)),]
#Give you R square and other stats
summary(lm(finite_yhoh$H2O.old_FPKM~finite_yhoh$H2O.young_FPKM, finite_yhoh))
#Get equation and r-sqared as string
lm_eqn <- function(finite_yhoh){
  m <- lm(finite_yhoh$H2O.old_FPKM~finite_yhoh$H2O.young_FPKM, finite_yhoh);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(coef(m)[1], digits = 2), 
                        b = format(coef(m)[2], digits = 2), 
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));                 
}
#extract r squre values from this one:
lm_eqn(finite_yhoh)

#Plot
p1 <-  ggplot(finite_yhoh, aes(H2O.young_FPKM, H2O.old_FPKM))
p1 + geom_point() + geom_smooth(method = 'lm', col = "red") + theme_grey(base_size = 18)


#Making YH2O vs YPQ:
yh2opq <- data.frame(select(cuff_FPKM_log10, H2O.young_FPKM, PQ.young_FPKM))

#Remove all the -INF value
finite_yh2opq <- yh2opq[!is.infinite(rowSums(yh2opq)),]
#Give you R square and other stats
summary(lm(finite_yh2opq$PQ.young_FPKM~finite_yh2opq$H2O.young_FPKM, finite_yh2opq))
#Get equation and r-sqared as string
lm_eqn <- function(finite_yh2opq){
  m <- lm(finite_yh2opq$PQ.young_FPKM~finite_yh2opq$H2O.young_FPKM, finite_yh2opq);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(coef(m)[1], digits = 2), 
                        b = format(coef(m)[2], digits = 2), 
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));                 
}
#extract r squre values from this one:
lm_eqn(finite_yh2opq)

#Plot
p1 <-  ggplot(finite_yh2opq, aes(H2O.young_FPKM, PQ.young_FPKM))
p1 + geom_point() + geom_smooth(method = 'lm', col = "red") + theme_grey(base_size = 18)


#Making OH2O vs OPQ:
oh2opq <- data.frame(select(cuff_FPKM_log10, H2O.old_FPKM, PQ.old_FPKM))

#Remove all the -INF value
finite_oh2opq <- oh2opq[!is.infinite(rowSums(oh2opq)),]
#Give you R square and other stats
summary(lm(finite_oh2opq$PQ.old_FPKM~finite_oh2opq$H2O.old_FPKM, finite_oh2opq))
#Get equation and r-sqared as string
lm_eqn <- function(finite_yh2opq){
  m <- lm(finite_oh2opq$PQ.old_FPKM~finite_oh2opq$H2O.old_FPKM, finite_oh2opq);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(coef(m)[1], digits = 2), 
                        b = format(coef(m)[2], digits = 2), 
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));                 
}
#extract r squre values from this one:
lm_eqn(finite_oh2opq)

#Plot
p1 <-  ggplot(finite_oh2opq, aes(H2O.old_FPKM, PQ.old_FPKM))
p1 + geom_point() + geom_smooth(method = 'lm', col = "red") + theme_grey(base_size = 18)
