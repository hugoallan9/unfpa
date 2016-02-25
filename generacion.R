

########COMENZANDO A HACER LAS TABLAS#####################



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
write.table(sep = ";", quote = F , df01, "1_01.csv", row.names = FALSE)

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

nacional <- c("Nacional", as.numeric(alfa/total*100))

df02 <- data.frame(rbind(nacional, df02))

names(df02) <- c("x","y")

df02$x <- c("Nacional", "Hombre", "Mujer")
write.table(sep = ";", quote = F , df02, "1_02.csv" , row.names = FALSE)

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

df03 <- rbind(nacional, grupo1,grupo2,grupo3)
write.table(sep = ";", quote = F , df03, "1_03.csv",row.names = FALSE)
########### 4 (Se puede hacer mas fácil la consulta) #################
niveles <- levels(enei4$ppa06)
levels(enei4$ppa06) <- c("Indígena", "Indígena", "No indígena","No indígena","Indígena" )

totalIndigena <- enei4 %>%
  select(p03a01,ppa06,ppa03, factor_expansion)%>%
  filter(ppa03 >14,ppa06 == "Indígena") %>%
  na.omit()%>%
  count(wt = factor_expansion)

totalNoIndigena <- enei4 %>%
  select(p03a01,ppa06,ppa03, factor_expansion)%>%
  filter(ppa03 >14,ppa06 == "No indígena") %>%
  na.omit()%>%
  count(wt = factor_expansion)



indigena <- as.numeric(totalIndigena)
noIndigena <- as.numeric(totalNoIndigena)
                                                          
  
x = c(indigena, noIndigena)

df04 <- enei4 %>%
  select(ppa03,ppa06,p03a01, factor_expansion)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa06)%>%
  summarise(conteo = sum(factor_expansion)) %>%
  mutate(conteo = conteo/as.numeric(x)*100)

nacional <- c("Nacional", as.numeric(alfa/total*100))

df04 <- data.frame(rbind(nacional, df04))




names(df04) <- c("x","y")
df04$x <- c("Nacional", "Indígena", "No indígena")

write.table(sep = ";", quote = F , df04, "1_04.csv",row.names = FALSE)



########### 5 #################
indigena <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02,factor_expansion)%>%
  filter(ppa03 >14,ppa06 == "Indígena", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion))

totalIndigena <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,ppa06 == "Indígena") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion))
  
noIndigena <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,ppa06 == "No indígena", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion))

totalNoIndigena <- enei4 %>%
  select(p03a01,ppa06,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,ppa06 == "No indígena") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion))



f1 <- c('Indígena', indigena$conteo/totalIndigena$conteo * 100)
f2 <- c('No indígena', noIndigena$conteo/totalNoIndigena$conteo * 100)

df05 <- data.frame(rbind(f1,f2)) 
names(df05) <- c('x','Hombre','Mujer')
write.table(sep = ";", quote = F , df05, "1_05.csv",row.names = FALSE)
  
########### 6 #################
totalUrbano <- enei4 %>%
  select(p03a01,area,ppa03, factor_expansion)%>%
  filter(ppa03 >14, area == "URBANA") %>%
  na.omit()%>%
  count(wt = factor_expansion)

totalRural <- enei4 %>%
  select(p03a01,area,ppa03, factor_expansion)%>%
  filter(ppa03 >14, area == "RURAL") %>%
  na.omit()%>%
  count(wt = factor_expansion)

x = c(totalUrbano, totalRural)

df06 <- enei4 %>%
  select(area,ppa03,p03a01, factor_expansion)%>%
  filter(ppa03 >14, p03a01 == "Si") %>%
  na.omit()%>%
  group_by(area)%>%
  summarise(conteo = sum(factor_expansion) ) %>%
  mutate(conteo = conteo/as.numeric(x)*100)

df06 <- data.frame(rbind(nacional,df06))

names(df06) <- c("x","y")
df06$x <- c("Nacional","Urbano", "Rural")
write.table(sep = ";", quote = F , df06, "1_06.csv",row.names = FALSE)
  
########### 7 #################
urbana <- enei4  %>%
  select(p03a01,area,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,area == "URBANA", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion ) )

totalUrbana <- enei4 %>%
  select(p03a01,area,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,area == "URBANA") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion ) )

rural <- enei4 %>%
  select(p03a01,area,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,area == "RURAL", p03a01 == "Si") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion) )

totalRural <- enei4 %>%
  select(p03a01,area,ppa03, ppa02, factor_expansion)%>%
  filter(ppa03 >14,area == "RURAL") %>%
  na.omit()%>%
  group_by(ppa02)%>%
  summarise(conteo = sum(factor_expansion) )




f1 <- c('Urbano', urbana$conteo/totalUrbana$conteo * 100)
f2 <- c('Rural', rural$conteo/totalRural$conteo * 100)

df07 <- data.frame(rbind(f1,f2)) 
names(df07) <- c('x','Hombre','Mujer')
write.table(sep = ";", quote = F , df07, "1_07.csv",row.names = FALSE)









