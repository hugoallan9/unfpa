#########################Generación de graficas###################3
library(funcionesINE)
anual(rgb(0,0,1), rgb(0.6156862745098039,0.7333333333333333,1))

ENC <- cargaMasiva('/mnt/datos/GitHub/unfpa/', codificacion = 'utf8')

########################ALFABETISMO###################
g<- graficaLinea(ENC$"1_01", inicio=0,rotar = "h")
exportarLatex("graficas/pet/1_01.tex", g)

g<- graficaCol(ENC$"1_02",ordenar = FALSE)
g <- etiquetasHorizontales(g)
exportarLatex("graficas/pet/1_02.tex", g)

g<- graficaCol(ENC$"1_03",ordenar = FALSE)
g <- etiquetasHorizontales(g)
exportarLatex("graficas/pet/1_03.tex", g)

g<- graficaCol(ENC$"1_04",ordenar = FALSE)
g <- etiquetasHorizontales(g)
exportarLatex("graficas/pet/1_04.tex", g)

g<- graficaColCategorias(ENC$"1_05",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pet/1_05.tex")


g<- graficaCol(ENC$"1_06",ordenar = FALSE)
g <- etiquetasHorizontales(g)
exportarLatex("graficas/pet/1_06.tex", g)



g<- graficaColCategorias(ENC$"1_07",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                         ruta = "graficas/pet/1_07.tex")




#################################PEA######################
g01<- graficaLinea(ENC$"2_01", inicio=0,rotar = "h")
exportarLatex("graficas/pea/1_01.tex", g01)



g2<- graficaCol(ENC$"2_02",ancho = .40,ordenar = FALSE)
g2 <- etiquetasHorizontales(g2)
exportarLatex("graficas/pea/1_02.tex", g2)

g3<- graficaCol(ENC$"2_03",ancho = .45,ordenar = FALSE)
g3 <- etiquetasHorizontales(g3)
exportarLatex("graficas/pea/1_03.tex", g3)


g4<- graficaColCategorias(ENC$"2_04",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pea/1_04.tex")


g5<- graficaColCategorias(ENC$"2_05",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pea/1_05.tex")


g6<- graficaAnillo(ENC$"2_06",
                   nombre = "graficas/pea/1_06.tex",
                   preambulo=FALSE)

##########################Ocupados##########################
g1<- graficaLinea(ENC$"3_01", rotar = "h", inicio=0)
exportarLatex("graficas/ocupados/1_01.tex", g1)



g2<- graficaBar(ENC$"3_02", ordenar=FALSE)
g2 <- etiquetasBarras(g2)
exportarLatex("graficas/ocupados/1_02.tex", g2)



g3<- graficaBar(ENC$"3_03", ordenar=FALSE)
g3 <- etiquetasBarras(g3)
exportarLatex("graficas/ocupados/1_03.tex", g3)




g4<- graficaCol(ENC$"3_04",ancho = .45, ordenar = FALSE)
g4 <- etiquetasHorizontales(g4)
exportarLatex("graficas/ocupados/1_04.tex", g4)


g5<- graficaCol(ENC$"3_05",ancho = .45, ordenar = FALSE)
g5 <- etiquetasHorizontales(g5)
exportarLatex("graficas/ocupados/1_05.tex", g5)


g6<- graficaCol(ENC$"3_06",ancho = .45, ordenar = FALSE)
g6 <- etiquetasHorizontales(g6)
exportarLatex("graficas/ocupados/1_06.tex", g6)

g7<- graficaCol(ENC$"3_07",ancho = .45, ordenar = FALSE)
g7 <- etiquetasHorizontales(g7)
exportarLatex("graficas/ocupados/1_07.tex", g7)


g8<- graficaCol(ENC$"3_08",ancho = .45, ordenar = FALSE)
g8 <- etiquetasHorizontales(g8)
exportarLatex("graficas/ocupados/1_08.tex", g8)


g9<- graficaCol(ENC$"3_09",ancho = .45, ordenar = FALSE)
g9 <- etiquetasHorizontales(g9)
exportarLatex("graficas/ocupados/1_09.tex", g9)


g10<- graficaColCategorias(ENC$"3_10",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,                            
                           ruta = "graficas/ocupados/1_10.tex")




# g11<- graficaLinea(ENC$"3_11", rotar = "h", inicio=0)
# exportarLatex("graficas/ocupados/1_11.tex", g11)



g12<- graficaCol(ENC$"3_12",ancho = .45, ordenar = FALSE)
g12 <- etiquetasHorizontales(g12)
exportarLatex("graficas/ocupados/1_12.tex", g12)


################Trabajo infantila###################

g1 <- graficaLinea(ENC$"4_01", rotar = "h", inicio=0)
exportarLatex("graficas/TrabajoInfantil/1_01.tex", g1)

g2 <- graficaCol(ENC$"4_02",ancho = .45, ordenar = FALSE)
g2 <- etiquetasHorizontales(g2)
exportarLatex("graficas/TrabajoInfantil/1_02.tex", g2)


g2 <- graficaCol(ENC$"4_03",ancho = .45, ordenar = FALSE)
g2 <- etiquetasHorizontales(g2)
exportarLatex("graficas/TrabajoInfantil/1_03.tex", g2)


g2 <- graficaCol(ENC$"4_04",ancho = .45, ordenar = FALSE)
g2 <- etiquetasHorizontales(g2)
exportarLatex("graficas/TrabajoInfantil/1_04.tex", g2)


g2<- graficaColCategorias(ENC$"4_05",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,                            
                           ruta = "graficas/ocupados/1_05.tex")

g2 <- graficaCol(ENC$"4_06",ancho = .45, ordenar = FALSE)
g2 <- etiquetasHorizontales(g2)
exportarLatex("graficas/TrabajoInfantil/1_06.tex", g2)

