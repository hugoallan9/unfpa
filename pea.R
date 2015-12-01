############################ Caracterizacion escolar de la poblacion economicamente activa ################################################
################1##################
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
write.table(sep = ";", dfpea_01, "2_01.csv", row.names = FALSE)



#################2#########################
peaAlfabeta <- enei4 %>%
  select(pea, p03a01, factor_expansion, ppa03)%>%
  filter(p03a01 == "Si", pea == 1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt=factor_expansion)



temp <- enei4 %>%
  select(pea, p03a01, factor_expansion, dominio)%>%
  filter(p03a01 == "Si")%>%
  na.omit()%>%
  group_by(dominio)%>%
  summarise(y = sum(factor_expansion))

temp1 <- enei4 %>%
  select(pea, p03a01, factor_expansion, dominio)%>%
  na.omit()%>%
  group_by(dominio)%>%
  summarise(y = sum(factor_expansion))

temp$y <-temp$y/temp1$y*100

temp2 <- data.frame("Total",as.numeric(peaAlfabeta/pea4*100))
names(temp2) <- names(temp)

temp <- rbind(temp2, temp)

dfpea_02 <- temp

names(dfpea_02) <- c("x","y")

write.table(sep = ";", dfpea_02, "2_02.csv", row.names = FALSE)


