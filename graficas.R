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

g<- graficaColCategorias(ENC$"1_05",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pea/1_05.tex", procesar = F)


g<- graficaCol(ENC$"1_06",ordenar = FALSE)
g <- etiquetasHorizontales(g)
exportarLatex("graficas/pet/1_06.tex", g)



g<- graficaColCategorias(ENC$"1_07",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                         ruta = "graficas/pea/1_07.tex", procesar = F)




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
                          ruta = "graficas/pea/1_04.tex", procesar = F)


g5<- graficaColCategorias(ENC$"2_05",etiquetasCategorias = "a",etiquetas = "h", ancho=0.65,
                          ruta = "graficas/pea/1_05.tex")


g6<- graficaAnillo(ENC$"2_06",
                   nombre = "graficas/pea/1_06.tex",
                   preambulo=FALSE)