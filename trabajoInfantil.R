x = c()

ninosTrabajadores <- enei4 %>%
  select(pea, ppa03, factor_expansion) %>%
  filter(ppa03 <=14) %>%
  na.omit()%>%
  count(wt =  factor_expansion)

ninos <- enei4 %>%
  select(ppa03, factor_expansion, pet) %>%
  filter(ppa03 <=14) %>%
  na.omit()%>%
  count(wt =  factor_expansion)

tasa4 <- ninosTrabajadores/ninos * 100

x = c(as.numeric(tasa4), x)


ninosTrabajadores <- enei3 %>%
  select(pea, ppa03, factor) %>%
  filter(ppa03 <=14) %>%
  na.omit()%>%
  count(wt =  factor)

ninos <- enei3 %>%
  select(ppa03, factor, pet) %>%
  filter(ppa03 <=14) %>%
  na.omit()%>%
  count(wt =  factor)

tasa3 <- ninosTrabajadores/ninos * 100

x = c(as.numeric(tasa3), x)


ninosTrabajadores <- enei2 %>%
  select(pea, ppa03, factor) %>%
  filter(ppa03 <=14, pea == 1) %>%
  na.omit()%>%
  count(wt =  factor)

ninos <- enei2 %>%
  select(ppa03, factor, pet) %>%
  filter(ppa03 <=14, pet == 1) %>%
  na.omit()%>%
  count(wt =  factor)

tasa2 <- ninosTrabajadores/ninos * 100

x = c(as.numeric(tasa2), x)

dfti_01 <- data.frame(makeYears(2014,2),x )
names(dfti_01) <- c("x","y")
write.table(sep = ";", quote = F,  dfti_01, "4_01.csv", row.names = FALSE)

#################02##############################
ninosSexo <- enei4 %>%
  select(factor_expansion, ppa03, ppa02)%>%
  filter(ppa03 <= 14, ppa03 > 6)%>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(y = sum(factor_expansion))

trabajoInfatilSexo <- enei4 %>%
  select(factor_expansion, ppa03, ppa02, pea)%>%
  filter(ppa03 <= 14, ppa03 > 6, pea == 1)%>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(y = sum(factor_expansion))

dfti_04 <- data.frame(ninosSexo$ppa02,trabajoInfatilSexo$y/ninosSexo$y*100)
names(dfti_04) <- c("x", "y")

write.table(sep = ";", quote = F,  dfti_04, "4_02.csv", row.names = FALSE)



##########################################05##############################################################
peaNino <- enei4 %>%
  select(pea, factor_expansion, ppa03, ppa02)%>%
  filter(pea == 1, ppa03 <= 14, ppa02 == "Hombre")%>%
  na.omit()%>%
  count(wt=factor_expansion)

peaNina <- enei4 %>%
  select(pea, factor_expansion, ppa03, ppa02)%>%
  filter(pea == 1, ppa03<= 14, ppa02 == "Mujer")%>%
  na.omit()%>%
  count(wt=factor_expansion)

niveles <- levels(enei4$p03a05a)
levels(enei4$p03a05a) <- c(levels(enei4$p03a05a)[1:6], "Postgrado", "Postgrado")

tempHombre <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03 <= 14,pea ==1, ppa02 == "Hombre") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(peaNino)*100)

tempMujer <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03 <= 14,pea ==1, ppa02 == "Mujer") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(peaNina)*100)





dfti_02 <- data.frame(tempHombre$p03a05a,tempHombre$y,tempMujer$y)
names(dfti_02) <- c("x", "Hombre", "Mujer")

write.table(sep = ";", quote = F,  dfti_02, "4_05.csv", row.names = FALSE)
levels(enei4$p03a05a) <- niveles


##########################################05****##############################################################
niveles <- levels(enei4$p03a05a)
levels(enei4$p03a05a) <- c(levels(enei4$p03a05a)[1:6], "Postgrado", "Postgrado")

ninosEducacion <- enei4%>%
  select(ppa03, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03 <= 14,ppa03 > 6,  ppa02 == "Hombre") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

ninasEducacion <- enei4%>%
  select(ppa03, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03 <= 14,ppa03 > 6,  ppa02 == "Mujer") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))


tempHombre <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03 <= 14,pea ==1, ppa02 == "Hombre") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

tempMujer <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03 <= 14,pea ==1, ppa02 == "Mujer") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

dfti_03 <- data.frame(tempHombre$p03a05a,tempHombre$y/ninosEducacion$y[1:4]*100, tempMujer$y/ninasEducacion$y[1:4]*100)
names(dfti_03) <- c("x", "Hombre", "Mujer")

write.table(sep = ";", quote = F,  dfti_03, "4_03.csv", row.names = FALSE)
levels(enei4$p03a05a) <- niveles

################################03#################################################

ninosDominio <- enei4 %>%
  select(ppa03, dominio, factor_expansion)%>%
  filter(ppa03 <= 14, ppa03 > 6 )%>%
  na.omit()%>%
  group_by(dominio)%>%
  summarise(y = sum(factor_expansion))
  
trabajoInfantilDominio <- enei4 %>%
  select(ppa03, dominio, factor_expansion, pea)%>%
  filter(ppa03 <= 14, pea ==1)%>%
  na.omit()%>%
  group_by(dominio)%>%
  summarise(y = sum(factor_expansion))

dfti_04 <- data.frame(ninosDominio$dominio,trabajoInfantilDominio$y/ninosDominio$y*100)
names(dfti_04) <- c("x", "y")

write.table(sep = ";", quote = F,  dfti_04, "4_03.csv", row.names = FALSE)

###########################04####################

trabajoInfatilEducacion <- enei4 %>%
  select(ppa03, p03a05a , factor_expansion, pea)%>%
  filter(ppa03 <= 14, pea ==1)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

infantesEducacion <- enei4 %>%
  select(ppa03, p03a05a , factor_expansion)%>%
  filter(ppa03 <= 14, ppa03 > 6)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

dfti_04 <- data.frame(trabajoInfatilEducacion$p03a05a,trabajoInfatilEducacion$y/infantesEducacion$y[1:4]*100)
names(dfti_04) <- c("x", "y")

write.table(sep = ";", quote = F,  dfti_04, "4_04.csv", row.names = FALSE)



########################################06###########################################
tabla <- enei4 %>%
  select(num_hogar, ppa03, pea, factor_expansion) %>%
  filter(ppa03 <= 14, ppa03 >6) %>%
  na.omit()

tablaJefe <- enei4 %>%
  select(num_hogar, ppa05,p03a05a, factor_expansion) %>%
  filter(num_hogar %in% tabla$num_hogar, ppa05 == 'Jefe(a) del hogar?') 

tablaAux <- enei4 %>%
  select(num_hogar, ppa03, pea, factor_expansion, p03a05a) %>%
  filter(ppa03 <= 14, ppa03 >6, num_hogar %in% tablaJefe$num_hogar) %>%
  na.omit() %>%
  group_by(p03a05a)
tablaAux <-  inner_join(tabla, tablaJefe)

educacionJefe <- tablaAux %>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(ninosTrabajadores)*100)

names(educacionJefe) <- c("x", "y")
educacionJefe$x <- addNA(educacionJefe$x)
levels(educacionJefe$x)[9] <- "Desconocido"

write.table(sep = ";", quote = F,  educacionJefe, "4_06.csv", row.names = FALSE)



