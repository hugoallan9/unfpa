library(foreign, pos=15)
library(dplyr)
library(survey)
library(xlsx)
library(xlsxjars)

enei14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2014.sav", 
                    use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
colnames(enei14) <- tolower(colnames(enei14))

enei3 <- tbl_df(enei14)
#encuesta4 <- svydesign(ids = ~1, data= enei3, weights = ~factor)

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

df01 <- data.frame(makeYears(2014,3),x )
names(df01) <- c("x","y")
write.csv(df01, "1_01.csv", row.names = FALSE)

########### 2 #################
totalHombres <- enei3 %>%
  select(p03a01,ppa03,ppa02,factor)%>%
  filter(ppa03 >14,ppa02 == "Hombre") %>%
  na.omit()%>%
  count(wt=factor)

totalMujeres <- enei3 %>%
  select(p03a01,ppa03,ppa02,factor)%>%
  filter(ppa03 >14,ppa02 == "Mujer") %>%
  na.omit()%>%
  count(wt=factor)

x = rbind(as.numeric(totalHombres), as.numeric(totalMujeres))

df02 <- enei3 %>%
  select(ppa02,ppa03,p03a01,factor)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor))%>%
  mutate(conteo = conteo/x*100)



names(df02) <- c("x","y")
write.csv(df02, "1_02.csv",row.names = FALSE)

############03###########
# grupo1 <- enei3 %>%
#   select(ppa03, p03a01, factor)%>%
#   filter(ppa03>14, p03a01 == "Si")%>%
#   group_by(ppa03)%>%
#   summarise(y = sum(factor) )%>%
#   filter(ppa03 >14, ppa03 <=29)%>%
#   summarise( y=sum(y)) %>%
#   summarise(x = "15-29",y = as.numeric( y / (enei3 %>% select(ppa03, p03a01, factor)%>%
#                                                filter(ppa03 >14, ppa03 <=29)%>%
#                                                na.omit()%>%
#                                                count(wt=factor)) *100))
# 
# grupo2 <- enei3 %>%
#   select(ppa03, p03a01, factor)%>%
#   filter(ppa03>14, p03a01 == "Si")%>%
#   group_by(ppa03)%>%
#   summarise(y = sum(factor) )%>%
#   filter(ppa03 >29, ppa03 <=54)%>%
#   summarise( y=sum(y)) %>%
#   summarise(x = "30-54",y = as.numeric(y / (enei3 %>% select(ppa03, p03a01, factor)%>%
#                                               filter(ppa03 >29, ppa03 <=54)%>%
#                                               na.omit()%>%
#                                               count(wt=factor)) *100))
# 
# 
# 
# grupo3 <- enei3 %>%
#   select(ppa03, p03a01, factor)%>%
#   filter(ppa03>14, p03a01 == "Si")%>%
#   group_by(ppa03)%>%
#   summarise(y = sum(factor) )%>%
#   filter(ppa03 > 54)%>%
#   summarise( y=sum(y)) %>%
#   summarise(x = "Mayor a 54",y = as.numeric(y / (enei3 %>% select(ppa03, p03a01, factor)%>%
#                                                    filter(ppa03 >54)%>%
#                                                    na.omit()%>%
#                                                    count(wt=factor)) *100))
# 
# df03 <- rbind(grupo1,grupo2,grupo3)
# write.csv(df03, "1_03.csv",row.names = FALSE)
########### 4 #################
totalXinka <- enei3 %>%
  select(p03a01,ppa06,ppa03, factor)%>%
  filter(ppa03 >14,ppa06 == "Xinka") %>%
  na.omit()%>%
  count(wt = factor)

totalGarifuna <- enei3 %>%
  select(p03a01,ppa06,ppa03, factor)%>%
  filter(ppa03 >14,ppa06 == "Garífuna") %>%
  na.omit()%>%
  count(wt = factor)

totalLadino <- enei3 %>%
  select(p03a01,ppa06,ppa03, factor)%>%
  filter(ppa03 >14,ppa06 == "Ladino") %>%
  na.omit()%>%
  count(wt = factor)

totalExtranjero <- enei3 %>%
  select(p03a01,ppa06,ppa03, factor)%>%
  filter(ppa03 >14,ppa06 == "Extranjero") %>%
  na.omit()%>%
  count(wt = factor)

totalMaya <- enei3 %>%
  select(p03a01,ppa06,ppa03, factor)%>%
  filter(ppa03 >14,ppa06 == "Maya") %>%
  na.omit()%>%
  count(wt = factor)


x = c(totalXinka, totalGarifuna, totalLadino,totalExtranjero,totalMaya)

df04 <- enei3 %>%
  select(ppa03,ppa06,p03a01, factor)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa06)%>%
  summarise(conteo = sum(factor)) %>%
  mutate(conteo = conteo/as.numeric(x)*100)

names(df04) <- c("x","y")
write.csv(df04, "1_04.csv",row.names = FALSE)

########### 5 #################
xinka <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02,factor)%>%
  filter(ppa03 >14,ppa06 == "Xinka", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor))

totalXinka <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Xinka") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor))

garifuna <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Garífuna", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor))

totalGarifuna <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Garífuna") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor))

ladino <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Ladino", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )

totalLadino <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Ladino") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )

extranjero <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Extranjero", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )

totalExtranjero <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02,factor)%>%
  filter(ppa03 >14,ppa06 == "Extranjero") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )

maya <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Maya", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )


totalMaya <- enei3 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,ppa06 == "Maya") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor))

f1 <- c('Xinka', xinka$conteo/totalXinka$conteo * 100)
f2 <- c('Garífuna', garifuna$conteo/totalGarifuna$conteo * 100)
f3 <- c('Ladino', ladino$conteo/totalLadino$conteo * 100)
f4 <- c('Extranjero', extranjero$conteo/totalExtranjero$conteo * 100)
f5 <- c('Maya', maya$conteo/totalMaya$conteo * 100)

df05 <- data.frame(rbind(f1,f2,f3,f4,f5)) 
names(df05) <- c('x','Hombre','Mujer')
write.csv(df05, "1_05.csv",row.names = FALSE)

########### 6 #################
totalUrbano <- enei3 %>%
  select(p03a01,area,ppa03, factor)%>%
  filter(ppa03 >14, area == "Urbano") %>%
  na.omit()%>%
  count(wt = factor)

totalRural <- enei3 %>%
  select(p03a01,area,ppa03, factor)%>%
  filter(ppa03 >14, area == "Rural") %>%
  na.omit()%>%
  count(wt = factor)

x = c(totalUrbano, totalRural)

df06 <- enei3 %>%
  select(area,ppa03,p03a01, factor)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  na.omit()%>%
  group_by(area)%>%
  summarise(conteo = sum(factor) ) %>%
  mutate(conteo = conteo/as.numeric(x)*100)

names(df06) <- c("x","y")
write.csv(df06, "1_06.csv",row.names = FALSE)

########### 7 #################
urbana <- enei3  %>%
  select(p03a01,area,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,area == "Urbano", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor ) )

totalUrbana <- enei3 %>%
  select(p03a01,area,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,area == "Urbano") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor ) )

rural <- enei3 %>%
  select(p03a01,area,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,area == "Rural", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )

totalRural <- enei3 %>%
  select(p03a01,area,ppa03, ppa02, factor)%>%
  filter(ppa03 >14,area == "Rural") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor) )




f1 <- c('Urbano', urbana$conteo/totalUrbana$conteo * 100)
f2 <- c('Rural', rural$conteo/totalRural$conteo * 100)

df07 <- data.frame(rbind(f1,f2)) 
names(df07) <- c('x','Hombre','Mujer')


tabla <- enei4 %>%
  select(num_hogar, ppa03, pea) %>%
  filter(ppa03 <= 14, ppa03 >6) %>%
  na.omit()

tablaJefe <- enei4 %>%
  select(num_hogar, ppa05,p03a05a) %>%
  filter(num_hogar %in% tabla$num_hogar, ppa05 == 'Jefe(a) del hogar?', p03a05a ==  'Diversificado') 
  
proporcionGastoEdu <- consumo4 %>%
  select(numhog, educa3, agreg3 , factor3) %>%
  na.omit()%>%
  summarise(y = weighted.mean(educa3/agreg3, factor3))

gastoEducacion <- encoviPer14 %>%
  select(numhog, thogar, factor, p06a03b, p06a04b, p06a05b, p06a06b, p06a07b, p06a08b, p06a09b, p06b12b, p06b13b, p06b14b, p06b20b, p06b21b) %>%
  group_by(numhog) %>%
  mutate(gastoEdu = ( sum(p06a03b, p06a04b, p06a05b, 
                          p06a06b, p06a07b, p06a08b, 
                          p06a09b, p06b12b, p06b13b, 
                          p06b14b, p06b20b, p06b21b,
                          na.rm = TRUE) ) ) 


gastoEducacion <- encoviPer14 %>%
  select(numhog, thogar, factor, p06a03b, p06a04b, p06a05b, p06a06b, p06a07b, p06a08b, p06a09b, p06b12b, p06b13b, p06b14b, p06b18b, p06b19b, p06b20b, p06b21b) %>%
  group_by(numhog) %>%
  mutate(gastoEdu = ( sum(p06a03b, p06a04b, p06a05b, 
                          10*p06a06b, 10*p06a07b, 10*p06a08b, 
                          p06a09b, p06b12b, p06b13b, 
                           p06b14b,10*p06b18b, 10*p06b19b,
                          10*p06b20b, p06b21b,
                          na.rm = TRUE) ) )

promedioGasto <- gastoEducacion %>%
  group_by(numhog, factor3) %>%
  summarise(y = sum(gastoEdu/thogar))


gastoEducacioHogares <- consumo4 %>%
  select(educa3, factor3) %>%
  summarise(y = weighted.mean(educa3, factor3) )


promedioGastoTotal <- consumo4 %>%
  select(agreg3, factor3) %>%
  summarise(y = weighted.mean(agreg3, factor3) )

proporcionGastoEdu <- gastoEducacioHogares/promedioGastoTotal * 100



reduccionGenero <- encoviPer14 %>%
  select(numhog, ppa02, ppa05) %>%
  filter(ppa05 == 'JEFE DEL HOGAR')

reduccionGeneroGasto <- inner_join(consumo4, reduccionGenero)

promedioEduGenero <- reduccionGeneroGasto %>%
  group_by(ppa02) %>%
  summarise(y = weighted.mean(educa3/agreg3, factor3)*100)

promedioGastoGenero <- reduccionGeneroGasto %>%
  group_by(ppa02) %>%
  summarise(y = weighted.mean(agreg3, factor3))

promedioEduAgre <- promedioEduGenero$y / promedioGastoGenero$y * 100


reduccionEtnia <- encoviPer14 %>%
  select(numhog, factor, p04a11a, ppa05) %>%
  filter(ppa05 == 'JEFE DEL HOGAR')




reduccionEtniaGasto <- inner_join(consumo4, reduccionEtnia)

levels(reduccionEtniaGasto$p04a11a) <- plyr::mapvalues(reduccionEtniaGasto$p04a11a, from = c("K´iche´" ,
                                           "Q´eqchi´" , 
                                           "Kaqchiquel" ,
                                           "Mam", 
                                           " Q´anjob´al",
                                           "Achi", 
                                           "Ixil",
                                           "Poqomchi´",
                                           "Chuj",
                                           "Awateko",
                                           "Pokoman",
                                           "Ch´orti ",
                                           "Jakalteko (popti)",
                                           "Mopan",
                                           "Uspanteko",
                                           " Tz´utujil ",
                                           "Chalchiteko",
                                           "Akateko" , 
                                           "Xinka",
                                           "Garifuna", 
                                           "Ladino",
                                           "Extranjero"), 
          to =  c(
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "Indígena",
            "No indígena",
            "No indígena"))


promedioEtnia <- reduccionEtniaGasto %>%
  group_by(p04a11a) %>%
  summarise(y  = weighted.mean(educa3,factor3) )

promedioGastoEtnia <- reduccionEtniaGasto %>%
  group_by(p04a11a) %>%
  summarise(y = weighted.mean(agreg3, factor))

promedioEtniaAgre <- promedioEtnia$y / promedioGastoEtnia$y * 100


promedioPobreza <- consumo4 %>%
  select(educa3, factor3, pobreza) %>%
  group_by(pobreza)%>%
  summarise(y = weighted.mean(educa3, factor3))



promedioResidencia <- consumo4 %>%
  select(educa3, factor3, area) %>%
  group_by(area)%>%
  summarise(y = weighted.mean(educa3, factor3))


promedioDepto <- consumo4 %>%
  select(educa3, factor, depto) %>%
  group_by(depto)%>%
  summarise(y = weighted.mean(educa3, factor))

