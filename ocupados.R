#####################1###################
x = c()




ocupados <- enei1 %>%
  select(ocupados, factor_exp, edad )%>%
  filter(ocupados == 1, edad > 14)%>%
  na.omit()%>%
  count(wt = factor_exp)%>%
  as.numeric()

primaria <- enei1 %>%
  select(ocupados, po3a05a, factor_exp, edad )%>%
  filter(po3a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == 1, edad > 14)%>%
  na.omit()%>%
  count(wt = factor_exp)%>%
  as.numeric()
  
x = c(x, as.numeric(primaria/ocupados*100))


ocupados <- enei2 %>%
  select(ocupados, factor, ppa03)%>%
  filter(ocupados == 1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor)%>%
  as.numeric()

primaria <- enei2 %>%
  select(ocupados, p03a03, factor, ppa03)%>%
  filter(p03a03 %in% c(NA,"Preprimaria", "Primaria" ), ocupados == 1, ppa03 > 14)%>%
  count(wt = factor)%>%
  as.numeric()

x = c(x, as.numeric(primaria/ocupados*100))


ocupados <- enei3 %>%
  select(ocupados, factor, ppa03)%>%
  filter(ocupados == 1, ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor)%>%
  as.numeric()

primaria <- enei3 %>%
  select(ocupados, p03a05a, factor, ppa03)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == 1,  ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor)%>%
  as.numeric()

x = c(x, as.numeric(primaria/ocupados*100))


ocupados <- enei4 %>%
  select(ocupados, factor_expansion, ppa03)%>%
  filter(ocupados == "Población ocupada", ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)%>%
  as.numeric()

primaria <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, ppa03)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == "Población ocupada", ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)%>%
  as.numeric()

x = c(x, as.numeric(primaria/ocupados*100))

dfocu_01 <- data.frame(makeYears(2014,3),x )
names(dfocu_01) <- c("x","y")
write.table(sep = ";", quote = F , dfocu_01, "3_01.csv", row.names = FALSE)

###########################02#######################
x = c()
abreviatura <- levels(enei4$p04c04b_1d)
agricultura <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[1], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

industriales <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[2], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

construccion <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[3], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

comercio <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[4], ppa03>14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

infoComunicaciones <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03 )%>%
  filter(p04c04b_1d == abreviatura[5], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

financieras <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[6], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

inmobiliarias <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[7], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

profesionales <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[8], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

publica <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[9], ppa03>14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

otras <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p04c04b_1d == abreviatura[10], ppa03 >14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

x = c(agricultura,industriales, construccion, comercio,
      infoComunicaciones, financieras, inmobiliarias, profesionales,
      publica, otras)

dfocu_02 <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d, ppa03)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == "Población ocupada", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p04c04b_1d)%>%
  summarise(y = sum(factor_expansion))

dfocu_02$y <- dfocu_02$y/as.numeric(x)*100

names(dfocu_02) <- c("x","y")
write.table(sep = ";", quote = F , dfocu_02, "3_02.csv", row.names = FALSE)

####################3#############################
x = c()
abreviatura <- levels(enei4$p04c02b_1d)
militares<- 0

gerentes <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[2], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

cientificos<- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[3], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

tecnicos <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[4], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

administrativo <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[5], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

vendedores <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03 )%>%
  filter(p04c02b_1d == abreviatura[6], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

agricultores <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[7], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

artesanos <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[8], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

operarios <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[9], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

elementales <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p04c02b_1d == abreviatura[10], ppa03 > 14)%>%
  na.omit()%>%
  count(wt = factor_expansion)

x = c(gerentes, cientificos, tecnicos, administrativo, vendedores, agricultores,
      artesanos, operarios, elementales)

dfocu_03 <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c02b_1d, ppa03)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == "Población ocupada", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p04c02b_1d)%>%
  summarise(y = sum(factor_expansion))

dfocu_03$y <- dfocu_03$y/as.numeric(x)*100

names(dfocu_03) <- c("x","y")
write.table(sep = ";", quote = F , dfocu_03, "3_03.csv", row.names = FALSE)


########################04################################################
totalIgss <- enei4 %>%
  select(ocupados, p03a05a, p04c25a,factor_expansion)%>%
  filter(p04c25a == "Afiliado(a)?")%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

x = c()
x = c("Total", as.numeric(sum(totalIgss$y)/ocupados*100))
ocupadaEducada <- enei4 %>%
  select(ocupados, p03a05a,factor_expansion, ppa03)%>%
  filter(p03a05a != "Preprimaria", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))


dfocu_04 <- data.frame(totalIgss$p03a05a, totalIgss$y/ocupadaEducada$y*100)
dfocu_04 <- data.frame(rbind(x, dfocu_04))
names(dfocu_04) <- c("x","y")
dfocu_04$x <- c("Total","Ninguno", "Primaria","Básico", "Diversificado", "Superior", "Maestría", "Doctorado") 
write.table(sep = ";", quote = F , dfocu_04, "3_04.csv", row.names = FALSE)


########################05#############################################
totalInformal <- enei4 %>%
  select(ocupados, p03a05a, formal_informal ,factor_expansion, ppa03)%>%
  filter(formal_informal == "INFORMAL", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

x = c()
x = c("Total", sum(totalInformal$y)/ocupados*100)

ocupadaInformal <- enei4 %>%
  select(ocupados, p03a05a,factor_expansion, formal_informal, ppa03)%>%
  filter(p03a05a != "Doctorado", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))


dfocu_05 <- data.frame(totalInformal$p03a05a, totalInformal$y/ocupadaInformal$y*100)
dfocu_05 <- data.frame(rbind(x, dfocu_05))
names(dfocu_05) <- c("x","y")
dfocu_05$x <- c("Total", "Ninguno", "Preprimaria", "Primaria","Básico", "Diversificado", "Superior", "Maestría")
write.table(sep = ";", quote = F , dfocu_05, "3_05.csv", row.names = FALSE)


#################06#########################
abre <- levels(enei4$p04c06)
asalariada <- enei4%>%
  select(p04c06, factor_expansion, p03a05a)%>%
  filter(p04c06 %in% abre[1:4])%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

contratada <- enei4%>%
  select(ocupados, p04c06, factor_expansion, p03a05a, p04c07, ppa03)%>%
  filter(p04c06 %in% abre[1:4], p04c07 == "Si", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))
x = c()
x = c("Total", sum(contratada$y)/sum(asalariada$y)*100)

dfocu_06 <- data.frame(contratada$p03a05a, contratada$y/asalariada$y*100)
dfocu_06 <- data.frame(rbind(x, dfocu_06))
names(dfocu_06) <- c("x","y")
dfocu_06$x <- c("Total", "Ninguno", "Preprimaria", "Primaria","Básico", "Diversificado", "Superior", "Maestría","Doctorado")
write.table(sep = ";", quote = F , dfocu_06, "3_06.csv", row.names = FALSE)


#################07#########################
abre <- levels(enei4$p04c06)
asalariada <- enei4%>%
  select(p04c06, factor_expansion, p03a05a)%>%
  filter(p04c06 %in% abre[1:4])%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

aguinaldo <- enei4%>%
  select(ocupados,p04c06, factor_expansion, p03a05a, p04c14a, ppa03)%>%
  filter(p04c06 %in% abre[1:4], p04c14a == "Si", ppa03 > 14, ocupados)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))
x = c()
x = c("Total", sum(aguinaldo$y)/sum(asalariada$y)*100)

dfocu_07 <- data.frame(aguinaldo$p03a05a, aguinaldo$y/asalariada$y*100)
dfocu_07 <- data.frame(rbind(x, dfocu_07))
names(dfocu_07) <- c("x","y")
dfocu_07$x <- c("Total", "Ninguno", "Preprimaria", "Primaria","Básico", "Diversificado", "Superior", "Maestría","Doctorado")
write.table(sep = ";", quote = F , dfocu_07, "3_07.csv", row.names = FALSE)

########################08#######################
abre <- levels(enei4$p04c06)
asalariada <- enei4%>%
  select(p04c06, factor_expansion, p03a05a, ppa03)%>%
  filter(p04c06 %in% abre[1:4], ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

aguinaldo <- enei4%>%
  select(p04c06, factor_expansion, p03a05a, p04c15a, ppa03)%>%
  filter(p04c06 %in% abre[1:4], p04c15a == "Si", ppa03)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))
x = c()
x = c("Total", sum(aguinaldo$y)/sum(asalariada$y)*100)

dfocu_08 <- data.frame(aguinaldo$p03a05a, aguinaldo$y/asalariada$y*100)
dfocu_08 <- data.frame(rbind(x, dfocu_08))
names(dfocu_08) <- c("x","y")
dfocu_08$x <- c("Total", "Ninguno", "Preprimaria", "Primaria","Básico", "Diversificado", "Superior", "Maestría","Doctorado")
write.table(sep = ";", quote = F , dfocu_08, "3_08.csv", row.names = FALSE)


################################09#######################
na.zero <- function (x) {
  x[is.na(x)] <- 0
  return(x)
}

#p04c22, p04c23
promedioSalario <- enei4%>%
  select(ocupados, factor_expansion, p04c10, p03a05a, ppa03)%>%
  filter(ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y=weighted.mean(x = p04c10, w = factor_expansion))

totalPromedio <- enei3%>%
  select(ocupados, factor, p04c10, p03a05a, ppa03)%>%
  filter(ppa03 > 14) %>%
  na.omit()%>%
  summarise(y=weighted.mean(x = p04c10, w = factor))
x = c("Total", as.numeric(totalPromedio))
dfocu_09 <- data.frame(rbind(x, promedioSalario))


names(dfocu_09) <- c("x","y")
dfocu_09$x <- c("Total", "Ninguno", "Preprimaria", "Primaria","Básico", "Diversificado", "Superior", "Maestría","Doctorado")
write.table(sep = ";", quote = F , dfocu_09, "3_09.csv", row.names = FALSE)

############################10##########################
na.zero <- function (x) {
  x[is.na(x)] <- 0
  return(x)
}

#p04c22, p04c23
promedioSalarioHombre <- enei4%>%
  select(ocupados, factor_expansion, p04c10, p03a05a, ppa02, ppa03)%>%
  filter(ppa02 == "Hombre", p03a05a != "Doctorado", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y=weighted.mean(x = p04c10, w = factor_expansion))

promedioSalarioMujer <- enei4%>%
  select(ocupados, factor_expansion, p04c10, p03a05a, ppa02, ppa03)%>%
  filter(ppa02 == "Mujer", ppa03 > 14)%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y=weighted.mean(x = p04c10, w = factor_expansion))

totalPromedio <- enei3%>%
  select(ocupados, factor, p04c10, p03a05a, ppa02, ppa03)%>%
  filter(ppa03 > 14 ) %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(y=weighted.mean(x = p04c10, w = factor))


dfocu_10 <- data.frame(promedioSalarioHombre$p03a05a, promedioSalarioHombre$y, promedioSalarioMujer$y)
dfocu_10 <- rbind(c("Total",totalPromedio$y),dfocu_10)

names(dfocu_10) <- c("x","Hombre","Mujer")
dfocu_10$x <- c("Total", "Ninguno", "Preprimaria", "Primaria","Básico", "Diversificado", "Superior", "Maestría")
write.table(sep = ";", quote = F , dfocu_10, "3_10.csv", row.names = FALSE)


####################12################################
totalDesocupados <- enei4 %>%
  select(desocupados, p03a05a,factor_expansion, ppa03)%>%
  filter(ppa03 > 14 )
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))

educada <- enei4 %>%
  select(p03a05a,factor_expansion)%>%
  filter( ! (p03a05a %in%  c("Preprimaria", "Maestría", "Doctorado") ) )%>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion))


x = c()
x = c("Total", sum(totalDesocupados$y)/sum(educada$y)*100)




dfocu_12 <- data.frame(totalDesocupados$p03a05a, totalDesocupados$y/educada$y*100)
dfocu_12 <- data.frame(rbind(x, dfocu_12))
names(dfocu_12) <- c("x","y")
dfocu_12$x <- c("Total", "Ninguno", "Primaria","Básico", "Diversificado", "Superior")
write.table(sep = ";", quote = F , dfocu_12, "3_12.csv", row.names = FALSE)
