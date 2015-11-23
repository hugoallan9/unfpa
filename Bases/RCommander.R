
library(foreign, pos=15)
enei14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2014.sav", 
  use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei14) <- tolower(colnames(enei14))
library(relimp, pos=16)
View(enei14)
enei13 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2013.sav", 
  use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei13) <- tolower(colnames(enei13))
enei12 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2012.sav", 
  use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei12) <- tolower(colnames(enei12))
enei11 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2011.sav", 
  use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei11) <- tolower(colnames(enei11))
library(abind, pos=17)
View(enei11)
summary(enei11)
sapply(enei11, function(x)(sum(is.na(x)))) # NA counts
library(e1071, pos=18)
numSummary(enei11[,"p03a01"], statistics=c("mean", "sd", "IQR", 
  "quantiles"), quantiles=c(0,.25,.5,.75,1))
MergedDataset <- mergeRows(enei11, enei12, common.only=FALSE)
View(MergedDataset)
View(enei11)

