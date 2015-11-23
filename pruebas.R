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


############03###########
grupo1 <- enei3 %>%
  select(ppa03, p03a01, factor)%>%
  filter(ppa03>14, p03a01 == "Si")%>%
  group_by(ppa03)%>%
  summarise(y = sum(factor) )%>%
  filter(ppa03 >14, ppa03 <=29)%>%
  summarise( y=sum(y)) %>%
  summarise(x = "15-29",y = as.numeric( y / (enei3 %>% select(ppa03, p03a01, factor)%>%
                                               filter(ppa03 >14, ppa03 <=29)%>%
                                               na.omit()%>%
                                               count(wt=factor)) *100))

grupo2 <- enei3 %>%
  select(ppa03, p03a01, factor)%>%
  filter(ppa03>14, p03a01 == "Si")%>%
  group_by(ppa03)%>%
  summarise(y = sum(factor) )%>%
  filter(ppa03 >29, ppa03 <=54)%>%
  summarise( y=sum(y)) %>%
  summarise(x = "30-54",y = as.numeric(y / (enei3 %>% select(ppa03, p03a01, factor)%>%
                                              filter(ppa03 >29, ppa03 <=54)%>%
                                              na.omit()%>%
                                              count(wt=factor)) *100))



grupo3 <- enei3 %>%
  select(ppa03, p03a01, factor)%>%
  filter(ppa03>14, p03a01 == "Si")%>%
  group_by(ppa03)%>%
  summarise(y = sum(factor) )%>%
  filter(ppa03 > 54)%>%
  summarise( y=sum(y)) %>%
  summarise(x = "Mayor a 54",y = as.numeric(y / (enei3 %>% select(ppa03, p03a01, factor)%>%
                                                   filter(ppa03 >54)%>%
                                                   na.omit()%>%
                                                   count(wt=factor)) *100))

df03 <- rbind(grupo1,grupo2,grupo3)