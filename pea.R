############################ Caracterizacion escolar de la poblacion economicamente activa ################################################
################1##################
ENC <- list()
x = c()
pet4 <- enei4 %>%
  select(ppa03,factor_expansion)%>%
  filter(ppa03 >14) %>%
  na.omit()%>%
  count(wt=factor_expansion)%>%
  as.numeric()

pea4 <- enei4 %>%
  select(pea, factor_expansion, ppa03)%>%
  filter(pea == 1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt=factor_expansion)
x = c(as.numeric(pea4/pet4*100),x)

pet3 <- enei3 %>%
  select(ppa03,factor)%>%
  filter( ppa03 > 14) %>%
  na.omit()%>%
  count(wt=factor)


pea3 <- enei3 %>%
  select(pea, factor, ppa03)%>%
  filter(pea ==1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt=factor)

x = c(as.numeric(pea3/pet3*100),x)

pet2 <- enei2%>%
  select(ppa03,factor)%>%
  filter( ppa03 > 14) %>%
  na.omit()%>%
  count(wt=factor)


pea2 <- enei2 %>%
  select(pea, factor, ppa03)%>%
  filter(pea ==1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt=factor)

x = c(as.numeric(pea2/pet2*100),x)

pet1 <- enei1%>%
  select(edad,factor_exp)%>%
  filter( edad > 14) %>%
  na.omit()%>%
  count(wt=factor_exp)


pea1 <- enei1 %>%
  select(pea, factor_exp, edad)%>%
  filter(pea ==1, edad > 14)%>%
  na.omit()%>%
  count(wt=factor_exp)

x = c(as.numeric(pea1/pet1*100),x)


dfpea_01 <- data.frame(makeYears(2014,3),x )
names(dfpea_01) <- c("x","y")
write.table(sep = ";", quote = F,  dfpea_01, "2_01.csv", row.names = FALSE)
ENC[[1]] <- dfpea_01


#################2#########################
peaAlfabeta <- enei4 %>%
  select(pea, p03a01, factor_expansion, ppa03)%>%
  filter(p03a01 == "Si", pea == 1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt=factor_expansion)



temp <- enei4 %>%
  select(pea, p03a01, factor_expansion, dominio, ppa03)%>%
  filter(p03a01 == "Si", ppa03 > 14)%>%
  na.omit()%>%
  group_by(dominio)%>%
  summarise(y = sum(factor_expansion))

temp1 <- enei4 %>%
  select(pea, p03a01, factor_expansion, dominio, ppa03)%>%
  filter(ppa03 > 14)%>%
  na.omit()%>%
  group_by(dominio)%>%
  summarise(y = sum(factor_expansion))

temp$y <-temp$y/temp1$y*100

temp2 <- data.frame("Total",as.numeric(peaAlfabeta/pea4*100))
names(temp2) <- names(temp)

temp <- rbind(temp2, temp)

dfpea_02 <- temp

names(dfpea_02) <- c("x","y")

write.table(sep = ";", quote = F,  dfpea_02, "2_02.csv", row.names = FALSE)
ENC[[2]] <- dfpea_02



#####################03#############
dfpea_03 <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion)%>%
  filter(ppa03>14,pea ==1 ) %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(pea4)*100)

names(dfpea_03) <- c("x", "y")
write.table(sep = ";", quote = F,  dfpea_03, "2_03.csv", row.names = FALSE)
ENC[[3]] <- dfpea_03


#####################04#############
peaHombre <- enei4 %>%
  select(pea, factor_expansion, ppa03, ppa02)%>%
  filter(pea == 1, ppa03 > 14, ppa02 == "Hombre")%>%
  na.omit()%>%
  count(wt=factor_expansion)

peaMujer <- enei4 %>%
  select(pea, factor_expansion, ppa03, ppa02)%>%
  filter(pea == 1, ppa03 > 14, ppa02 == "Mujer")%>%
  na.omit()%>%
  count(wt=factor_expansion)

niveles <- levels(enei4$p03a05a)
levels(enei4$p03a05a) <- c(levels(enei4$p03a05a)[1:6], "Postgrado", "Postgrado")

tempHombre <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03>14,pea ==1, ppa02 == "Hombre") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(peaHombre)*100)

tempMujer <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion, ppa02)%>%
  filter(ppa03>14,pea ==1, ppa02 == "Mujer") %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(peaMujer)*100)





dfpea_04 <- data.frame(tempHombre$p03a05a,tempHombre$y,tempMujer$y)
names(dfpea_04) <- c("x", "Hombre", "Mujer")

write.table(sep = ";", quote = F,  dfpea_04, "2_04.csv", row.names = FALSE)
ENC[[4]] <- dfpea_04
levels(enei4$p03a05a) <- niveles


names(ENC) <- c("12.1", "12.2", "12.3", "12.4")







