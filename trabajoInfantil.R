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


##########################################02##############################################################
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

write.table(sep = ";", quote = F,  dfti_02, "4_02.csv", row.names = FALSE)
levels(enei4$p03a05a) <- niveles


##########################################02****##############################################################
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





