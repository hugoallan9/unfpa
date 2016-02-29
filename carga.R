library(foreign, pos=15)
#library(plyr)
library(dplyr)
library(survey)
library(xlsx)
library(xlsxjars)
setwd('/mnt/datos/GitHub/unfpa/')
enei14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2014.sav", 
                    use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei14) <- tolower(colnames(enei14))

enei4 <- tbl_df(enei14)
#encuesta4 <- svydesign(ids = ~1, data= enei4, weights = ~factor_expansion)

enei13 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2013.sav", 
                    use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei13) <- tolower(colnames(enei13))

enei3 <- tbl_df(enei13)

enei12 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2012.sav", 
                    use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei12) <- tolower(colnames(enei12))

enei2 <- tbl_df(enei12)

enei <- tbl_df(enei14)
enei11 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2011.sav", 
                    use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei11) <- tolower(colnames(enei11))

enei1 <- tbl_df(enei11)


encovi14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/encoviHogares2014.sav", 
                    use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(encovi14) <- tolower(colnames(encovi14))

encovi4 <- tbl_df(encovi14)


consumo14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/consumo2014.sav", 
                      use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(consumo14) <- tolower(colnames( consumo14 ))

consumo4 <- tbl_df( consumo14 ) 

encoviPer14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/encoviPersonas2014.sav", 
                      use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(encoviPer14) <- tolower(colnames(encoviPer14))

encovi4 <- tbl_df(encoviPer14)

#ANIOS###
makeYears <- function(year, longitud = 4){
  anios <- c()
  for (x in longitud:0){
    anios <- c(anios,year - x) 
  }
  return(anios)
}