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