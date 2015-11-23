library(foreign, pos=15)
library(dplyr)
library(survey)
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

########COMENZANDO A HACER LAS TABLAS#####################
#ANIOS###
makeYears <- function(year, longitud = 4){
  anios <- c()
  for (x in longitud:0){
    anios <- c(anios,year - x) 
  }
  return(anios)
}


x = c()
alfa <- enei1 %>%
  select(p03a01,edad,factor_exp)%>%
  filter(p03a01 == 1, edad >14) %>%
  na.omit()%>%
  count(wt=factor_exp) 

total <- enei1 %>%
  select(p03a01,edad,factor_exp)%>%
  filter(edad >14) %>%
  na.omit()%>%
  count(wt=factor_exp)

x = c(x,as.numeric(alfa/total*100))

alfa <- enei2 %>%
  select(p03a01, ppa03,factor)%>%
  filter(p03a01 == "Si", ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor)

total <- enei2 %>%
  select(p03a01,ppa03,factor)%>%
  filter(ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor)

x = c(x,as.numeric(alfa/total*100))

alfa <- enei3 %>%
  select(p03a01, ppa03,factor)%>%
  filter(p03a01 == "Si", ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor)

total <- enei3 %>%
  select(p03a01,ppa03,factor)%>%
  filter(ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor)

x = c(x,as.numeric(alfa/total*100))

alfa <- enei4 %>%
  select(p03a01, ppa03,factor_expansion)%>%
  filter(p03a01 == "Si", ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor_expansion)

total <- enei4 %>%
  select(p03a01,ppa03,factor_expansion)%>%
  filter(ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor_expansion)

x = c(x,as.numeric(alfa/total*100))

df01 <- data.frame(makeYears(2014,3),x )
names(df01) <- c("x","y")

########### 2 #################
totalHombres <- enei4 %>%
  select(p03a01,ppa03,ppa02,factor_expansion)%>%
  filter(ppa03 >14,ppa02 == "Hombre") %>%
  na.omit()%>%
  count(wt=factor_expansion)

totalMujeres <- enei4 %>%
  select(p03a01,ppa03,ppa02,factor_expansion)%>%
  filter(ppa03 >14,ppa02 == "Mujer") %>%
  na.omit()%>%
  count(wt=factor_expansion)

x = rbind(as.numeric(totalHombres), as.numeric(totalMujeres))

df02 <- enei4 %>%
  select(ppa02,ppa03,p03a01,factor_expansion)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion))%>%
  mutate(conteo = conteo/x*100)



names(df02) <- c("x","y")

############03###########
grupo1 <- enei4 %>%
  select(ppa03, p03a01, factor_expansion)%>%
  filter(ppa03>14, p03a01 == "Si")%>%
  group_by(ppa03)%>%
  summarise(y = sum(factor_expansion) )%>%
  filter(ppa03 >14, ppa03 <=29)%>%
  summarise( y=sum(y)) %>%
  summarise(x = "15-29",y = as.numeric( y / (enei4 %>% select(ppa03, p03a01, factor_expansion)%>%
                     filter(ppa03 >14, ppa03 <=29)%>%
                     na.omit()%>%
                     count(wt=factor_expansion)) *100))

grupo2 <- enei4 %>%
  select(ppa03, p03a01, factor_expansion)%>%
  filter(ppa03>14, p03a01 == "Si")%>%
  group_by(ppa03)%>%
  summarise(y = sum(factor_expansion) )%>%
  filter(ppa03 >29, ppa03 <=54)%>%
  summarise( y=sum(y)) %>%
  summarise(x = "30-54",y = as.numeric(y / (enei4 %>% select(ppa03, p03a01, factor_expansion)%>%
                                   filter(ppa03 >29, ppa03 <=54)%>%
                                   na.omit()%>%
                                   count(wt=factor_expansion)) *100))
  
  

grupo3 <- enei4 %>%
  select(ppa03, p03a01, factor_expansion)%>%
  filter(ppa03>14, p03a01 == "Si")%>%
  group_by(ppa03)%>%
  summarise(y = sum(factor_expansion) )%>%
  filter(ppa03 > 54)%>%
  summarise( y=sum(y)) %>%
  summarise(x = "Mayor a 54",y = as.numeric(y / (enei4 %>% select(ppa03, p03a01, factor_expansion)%>%
                                   filter(ppa03 >54)%>%
                                   na.omit()%>%
                                   count(wt=factor_expansion)) *100))

df03 <- rbind(grupo1,grupo2,grupo3)

########### 4 #################
totalXinka <- enei4 %>%
  select(p03a01,ppa06,ppa03)%>%
  filter(ppa03 >14,ppa06 == "Xinka") %>%
  na.omit()%>%
  nrow()

totalGarifuna <- enei4 %>%
  select(p03a01,ppa06,ppa03)%>%
  filter(ppa03 >14,ppa06 == "Garífuna") %>%
  na.omit()%>%
  nrow()

totalLadino <- enei4 %>%
  select(p03a01,ppa06,ppa03)%>%
  filter(ppa03 >14,ppa06 == "Ladino") %>%
  na.omit()%>%
  nrow()

totalExtranjero <- enei4 %>%
  select(p03a01,ppa06,ppa03)%>%
  filter(ppa03 >14,ppa06 == "Extranjero") %>%
  na.omit()%>%
  nrow()

totalMaya <- enei4 %>%
  select(p03a01,ppa06,ppa03)%>%
  filter(ppa03 >14,ppa06 == "Maya") %>%
  na.omit()%>%
  nrow()


x = c(totalXinka, totalGarifuna, totalLadino,totalExtranjero,totalMaya)

df04 <- enei4 %>%
  select(ppa03,ppa06,p03a01)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  group_by(ppa06)%>%
  summarise(conteo = n()) %>%
  mutate(conteo = conteo/x*100)

names(df04) <- c("x","y")


########### 5 #################
xinka <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Xinka", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalXinka <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Xinka") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())
  
garifuna <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Garífuna", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalGarifuna <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Garífuna") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

ladino <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Ladino", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalLadino <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Ladino") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

extranjero <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Extranjero", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalExtranjero <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Extranjero") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

maya <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Maya", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalMaya <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02)%>%
  filter(ppa03 >14,ppa06 == "Maya") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

f1 <- c('Xinka', xinka$conteo/totalXinka$conteo * 100)
f2 <- c('Garífuna', garifuna$conteo/totalGarifuna$conteo * 100)
f3 <- c('Ladino', ladino$conteo/totalLadino$conteo * 100)
f4 <- c('Extranjero', extranjero$conteo/totalExtranjero$conteo * 100)
f5 <- c('Maya', maya$conteo/totalMaya$conteo * 100)

df05 <- data.frame(rbind(f1,f2,f3,f4,f5)) 
names(df05) <- c('x','Hombre','Mujer')

  
########### 6 #################
totalUrbano <- enei4 %>%
  select(p03a01,area,ppa03)%>%
  filter(ppa03 >14, area == "URBANA") %>%
  na.omit()%>%
  nrow()

totalRural <- enei4 %>%
  select(p03a01,area,ppa03)%>%
  filter(ppa03 >14, area == "RURAL") %>%
  na.omit()%>%
  nrow()

x = c(totalUrbano, totalRural)

df06 <- enei4 %>%
  select(area,ppa03,p03a01)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  group_by(area)%>%
  summarise(conteo = n()) %>%
  mutate(conteo = conteo/x*100)

names(df06) <- c("x","y")
  
########### 7 #################
urbana <- enei  %>%
  select(p03a01,area,ppa03, ppa02)%>%
  filter(ppa03 >14,area == "URBANA", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalUrbana <- enei4 %>%
  select(p03a01,area,ppa03, ppa02)%>%
  filter(ppa03 >14,area == "URBANA") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

rural <- enei4 %>%
  select(p03a01,area,ppa03, ppa02)%>%
  filter(ppa03 >14,area == "RURAL", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())

totalRural <- enei4 %>%
  select(p03a01,area,ppa03, ppa02)%>%
  filter(ppa03 >14,area == "RURAL") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = n())




f1 <- c('Urbano', urbana$conteo/totalUrbana$conteo * 100)
f2 <- c('Rural', rural$conteo/totalRural$conteo * 100)

df07 <- data.frame(rbind(f1,f2)) 
names(df07) <- c('x','Hombre','Mujer')








