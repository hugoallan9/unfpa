#####################1###################
x = c()




ocupados <- enei1 %>%
  select(ocupados, factor_exp)%>%
  filter(ocupados == 1)%>%
  na.omit()%>%
  count(wt = factor_exp)%>%
  as.numeric()

primaria <- enei1 %>%
  select(ocupados, po3a05a, factor_exp)%>%
  filter(po3a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == 1)%>%
  na.omit()%>%
  count(wt = factor_exp)%>%
  as.numeric()
  
x = c(x, as.numeric(primaria/ocupados*100))


ocupados <- enei2 %>%
  select(ocupados, factor)%>%
  filter(ocupados == 1)%>%
  na.omit()%>%
  count(wt = factor)%>%
  as.numeric()

primaria <- enei2 %>%
  select(ocupados, p03a03, factor)%>%
  filter(p03a03 %in% c(NA,"Preprimaria", "Primaria" ), ocupados == 1)%>%
  count(wt = factor)%>%
  as.numeric()

x = c(x, as.numeric(primaria/ocupados*100))


ocupados <- enei3 %>%
  select(ocupados, factor)%>%
  filter(ocupados == 1)%>%
  na.omit()%>%
  count(wt = factor)%>%
  as.numeric()

primaria <- enei3 %>%
  select(ocupados, p03a05a, factor)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == 1)%>%
  na.omit()%>%
  count(wt = factor)%>%
  as.numeric()

x = c(x, as.numeric(primaria/ocupados*100))


ocupados <- enei4 %>%
  select(ocupados, factor_expansion)%>%
  filter(ocupados == "Población ocupada")%>%
  na.omit()%>%
  count(wt = factor_expansion)%>%
  as.numeric()

primaria <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == "Población ocupada")%>%
  na.omit()%>%
  count(wt = factor_expansion)%>%
  as.numeric()

x = c(x, as.numeric(primaria/ocupados*100))

dfocu_01 <- data.frame(makeYears(2014,3),x )
names(dfocu_01) <- c("x","y")
write.table(sep = ";", quote = F , dfocu_01, "3_01.csv", row.names = FALSE)

###########################02#######################


dfocu_02 <- enei4 %>%
  select(ocupados, p03a05a, factor_expansion, p04c04b_1d)%>%
  filter(p03a05a %in% c("Ninguno", "Preprimaria", "Primaria" ), ocupados == "Población ocupada")%>%
  na.omit()%>%
  group_by(p04c04b_1d)%>%
  summarise(y = sum(factor_expansion))

