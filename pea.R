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
write.table(sep = ";", dfpea_01, "2_01.csv", row.names = FALSE)
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

write.table(sep = ";", dfpea_02, "2_02.csv", row.names = FALSE)
ENC[[2]] <- dfpea_02



#####################03#############
dfpea_03 <- enei4%>%
  select(ppa03, pea, p03a05a, factor_expansion)%>%
  filter(ppa03>14,pea ==1 ) %>%
  na.omit()%>%
  group_by(p03a05a)%>%
  summarise(y = sum(factor_expansion)/as.numeric(pea4)*100)

names(dfpea_03) <- c("x", "y")
write.table(sep = ";", dfpea_03, "2_03.csv", row.names = FALSE)
ENC[[3]] <- dfpea_03


#####################04#############
niveles <- levels(enei3$p03a05a)
levels(enei3$p03a05a) <- c(levels(enei3$p03a05a)[1:6], "Postgrado", "Postgrado")
temp <- enei3%>%
  
  select(ppa03, pea, p03a05a, factor, ppa02)%>%
  filter(ppa03>14,pea ==1) %>%
  na.omit()%>%
  group_by(p03a05a, ppa02)%>%
  summarise(y = sum(factor)/as.numeric(pea3)*100)


names(temp) <- c("x", "y", "z")

x <- levels(temp$x)
y <- temp[c(1,3,5,7,9,11,13),c('z')]
z <- temp[c(2,4,6,8,10,12,14),c('z')]

dfpea_04 <- cbind(x,y,z)
names(dfpea_04) <- c("x", "Hombre", "Mujer")

write.table(sep = ";", dfpea_04, "2_04.csv", row.names = FALSE)
ENC[[4]] <- dfpea_04
levels(enei3$p03a05a) <- niveles


names(ENC) <- c("12.1", "12.2", "12.3", "12.4")


####################GENERACION DE GRAFICAS #########################
library(funcionesINE)
anual(rgb(0,0,1), rgb(0.6156862745098039,0.7333333333333333,1))




g01<- graficaLinea(ENC$"12.1", inicio=0,rotar = "h")
exportarLatex("graficas/pea/1_01.tex", g01)



g2<- graficaCol(ENC$"12.2",ancho = .40,ordenar = FALSE)
g2 <- etiquetasHorizontales(g2)
exportarLatex("graficas/pea/1_02.tex", g2)

g3<- graficaCol(ENC$"12.3",ancho = .45,ordenar = FALSE)
g3 <- etiquetasHorizontales(g3)
exportarLatex("graficas/pea/1_03.tex", g3)


g4<- graficaColCategorias(ENC$"12.4",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pea/1_04.tex", procesar = F)


g5<- graficaColCategorias(ENC$"12.5",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pea/1_05.tex")


g6<- graficaAnillo(ENC$"12.6",
                   nombre = "graficas/pea/1_06.tex",
                   preambulo=FALSE)
