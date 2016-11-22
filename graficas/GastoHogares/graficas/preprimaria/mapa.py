#!/usr/bin/python2.7
import ntpath
import sys
import os
from PyQt4.QtGui import *
from PyQt4.QtCore import *
from qgis.core import *
from qgis.gui import *
import subprocess
import shutil
import shlex

## En el ine "C:/OSGeo4W64/apps/qgis"
## En la casa
## En el server /usr

## En le ine C:\Users\INE\Documents\
## En la casa C:\Users\hugo_000\Documents\
## En el server /home/hugo/pruebasMapas/



def sonEnteros(lista):
    contador = 0
    enteros = False
    for dato in lista:
        dato = dato.attributes()
        dato = dato[1]
        dato = float(dato.toString())
        if dato.is_integer() == False:
            break
        else:
            contador = contador + 1
    print contador
    if lista.isClosed():
        print  "SON ENTEROS"
        return True
    else:
        print "NO SON ENTEROS"
        return False



qgis_prefix = "/usr"
if ( len(sys.argv) > 2 ):
    print "La ruta para carga de mapas es: "
    base = sys.argv[2]
else:
    base = "/home/hugo/pruebasMapas/"
if (len(sys.argv) > 4 ):
    rutaSalida = sys.argv[4]
else:
    rutaSalida = "/var/www/html/Mapas/"
app = QgsApplication([],False)
QgsApplication.setPrefixPath(qgis_prefix, True)
QgsApplication.initQgis()
mapinstance = QgsMapLayerRegistry.instance()
anchoPapel = 165.1
altoPapel = 121.87500
##Canvas
#canvas = QgsMapCanvas()
#canvas.setCanvasColor(Qt.white)
#canvas.enableAntiAliasing(True)

## En le ine C:\Users\INE\Documents\MapaRepublica\22_DEPARTAMENTOS.shp
## En la casa C:\Users\hugo_000\Documents\MapaRepublica\22_DEPARTAMENTOS.shp
## En el server /home/hugo/pruebasMapas/MapaRepublica/22_DEPARTAMENTOS.shp



##Agregando el mapa de la Republica como un layer
mapa = QgsVectorLayer(base + "/MapaDepartamentos/22_DEPARTAMENTOS.shp","","ogr")
if not mapa.isValid():
    print "El mapa no se pudo cargar"
else:
    print "El mapa ha sido cargado exitosamente"
idMapa = mapa.id()
print idMapa


## En le ine C:\Users\INE\Documents\pruebaDatos.csv
## En la casa C:\Users\hugo_000\Documents\pruebaDatos.csv
## En el server /home/hugo/pruebasMapas/pruebaDatos.csv

rutaCSV = "/home/hugo/pruebasMapas/pruebaDatos.csv"

##Agregando el CSV como una capa vectorial
print "El tamano del sys.argv es"
print len(sys.argv)
if ( len(sys.argv)  > 1):
    rutaCSV = sys.argv[1]

uri = "file:///" + rutaCSV +"?delimiter=%s&x=%s&y=%s" % (";","X","Y")
datos = QgsVectorLayer(uri, "", "delimitedtext")


if not datos.isValid():
    print "La capa de los csv no se pudo cargar"
    sys.exit()
else:
    print "Se cargo el csv exitosamente"

idDatos = datos.id()
print idDatos

## Leyendo el layer y viendo los datos
features = datos.getFeatures()

if ( len(sys.argv)  > 3):
    print sys.argv[3]
    rutaDatos = sys.argv[3]
else:
    rutaDatos = "/var/www/html/Mapas/mapasRegionales/datos.tex"

print "##############ESCRITURA DE DATOS.TEX###########"
##HOLA
file = open(rutaDatos,"w")
if sonEnteros(features) == True:
    print "Son enteros"
    convertir = True
else:
    print "No son enteros"
    convertir = False

## Leyendo el layer y viendo los datos
features = datos.getFeatures()
for feat in features:
        attrs=feat.attributes()
        print attrs[0].toString()
        if convertir == True:
            numero = int(attrs[1].toString())
            nuevo = ("%.0f" % numero)
        else:
            numero = float(attrs[1].toString())
            nuevo = ("%.1f" % numero)
        print "El dato es : " + str(numero)
        if attrs[0].toString() == "1":
                file.write("\\def \\guatemala {" + nuevo  + "}\n")
        elif attrs[0].toString() == "2":
                file.write("\\def \\elProgreso {" + nuevo + "}\n")
        elif attrs[0].toString() == "3":
                file.write("\\def \\sacatepequez {" + nuevo  + "}\n")
        elif attrs[0].toString() == "4":
                file.write("\\def \\chimaltenango {" + nuevo + "}\n")
        elif attrs[0].toString() == "5":
                file.write("\\def \\escuintla {" + nuevo + "}\n")
        elif attrs[0].toString() == "6":
                file.write("\\def \\santaRosa {" + nuevo+ "}\n")
        elif attrs[0].toString() == "7":
                file.write("\\def \\solola {" + nuevo + "}\n")
        elif attrs[0].toString() == "8":
                file.write("\\def \\totonicapan {" + nuevo+ "}\n")
        elif attrs[0].toString() == "9":
                file.write("\\def \\quetzaltenango {" + nuevo + "}\n")
        elif attrs[0].toString() == "10":
                file.write("\\def \\suchitepequez {" + nuevo + "}\n")
        elif attrs[0].toString() == "11":
                file.write("\\def \\retalhuleu {" + nuevo + "}\n")
        elif attrs[0].toString() == "12":
                file.write("\\def \\sanMarcos {" + nuevo + "}\n")
        elif attrs[0].toString() == "13":
                file.write("\\def \\huehuetenango {" + nuevo+ "}\n")
        elif attrs[0].toString() == "14":
                file.write("\\def \\quiche {" + nuevo+ "}\n")
        elif attrs[0].toString() == "15":
                file.write("\\def \\bajaVerapaz {" + nuevo+ "}\n")
        elif attrs[0].toString() == "16":
                file.write("\\def \\altaVerapaz {" + nuevo+ "}\n")
        elif attrs[0].toString() == "17":
                file.write("\\def \\peten {" + nuevo + "}\n")
        elif attrs[0].toString() == "22":
                file.write("\\def \\jutiapa {" + nuevo+ "}\n")
        elif attrs[0].toString() == "18":
                file.write("\\def \\izabal {" + nuevo + "}\n")
        elif attrs[0].toString() == "19":
                file.write("\\def \\zacapa {" + nuevo+ "}\n")
        elif attrs[0].toString() == "20":
                file.write("\\def \\chiquimula {" + nuevo + "}\n")
        elif attrs[0].toString() == "21":
                file.write("\\def \\jalapa {" + nuevo+ "}\n")
        else:
                print("NO ES UN CSV DE MAPA")
                sys.exit()
file.close()

print "##############FIN DE ESCRITURA DE DATOS.TEX###########"
##Agregando el mapa a la region activa para poder ser renderizado
layerset = []
mapinstance.addMapLayer(mapa)
mapinstance.addMapLayer(datos)
layerset.append(mapa.id() )


# set extent to the extent of our layer
#canvas.setExtent(mapa.extent())
#canvas.setLayerSet([QgsMapCanvasLayer(mapa)])
#canvas.show()
#canvas.freeze(True)

##Haciendo el Join
info = QgsVectorJoinInfo()
info.joinFieldName = "X"
info.joinLayerId =  idDatos
info.targetFieldName = "DEPARTAMEN"
info.memoryCache = False
mapinstance.mapLayer(idMapa).addJoin(info)

## Aplicando el pintado con cierta graduacion
fieldName = "_Y"
fieldIndex = mapa.fieldNameIndex( fieldName )
provider = mapa.dataProvider()
numberOfClasses = 4
color1 =  QColor ( 0, 0, 128, 255 )
color2 = QColor(190,190,255,255)
color3 = QColor("white")
ramp = QgsVectorGradientColorRampV2(color2, color1)
template="%1 - %2"
formato = QgsRendererRangeV2LabelFormat()
formato.setFormat(template)
formato.setPrecision(2)
formato.setTrimTrailingZeroes(True)
props = { 'color_border' : '255,255,255,255', 'style' : 'solid', 'style_border' : 'solid' , 'width_border':'0.4'}
symbol =  QgsFillSymbolV2.createSimple(props)
renderer = QgsGraduatedSymbolRendererV2.createRenderer(mapa, fieldName, numberOfClasses, QgsGraduatedSymbolRendererV2.Quantile, symbol, ramp, legendFormat = formato)
mapa.setRendererV2( renderer )
mapinstance.addMapLayer( mapa )
print "##############PRUEBAS CON EL FORMATO###########"
ranges =  mapa.rendererV2().ranges()
print ranges
i = 0
for rng in ranges:
    print i
    label = '{:,.2f} - {:,.2f}'.format(rng.lowerValue(), rng.upperValue())
    print rng.lowerValue(), rng.upperValue(), rng.label(), rng.symbol().color().name()
    renderer.updateRangeLabel(i,label)
    i = i+1
    print i
mapa.setRendererV2( renderer )
mapinstance.addMapLayer( mapa )
print "##############FIN DE PRUEBAS CON EL FORMATO###########"
layerset = [idMapa]
print mapinstance.mapLayers()
## Haciendo el composer
settings = QgsMapSettings()
list = [idMapa]
settings.setLayers(list)
size = QSize(700,478)
settings.setOutputSize(size)
#settings.setFlag(settings.UseAdvancedEffects,True)
mapRenderer = QgsMapRenderer()
mapRectangle = QgsRectangle(312452,1519135,744215,1970752)
#mapRectangle = QgsRectangle(312452,1519135,744215,1970752)
settings.setExtent(mapRectangle)
print "##############ALGUNOS DATOS UTILES##################"
print "El Label format es"
print renderer.labelFormat()
print "El settings del canvas esta bien"
#print canvas.mapSettings().hasValidSettings()
print "El settings del Settings esta bien"
print settings.hasValidSettings()
print "El out put size del canvas es"
#print canvas.mapSettings().outputSize()
print "El extent del canvas es:"
#print canvas.mapSettings().extent().toString()
print "##############FIN DE LOS DATOS UTILES################"
lst = [idMapa]
mapRenderer.setLayerSet(lst)
print mapRenderer.setExtent(mapRectangle)
print "El extent del mapa es: "
print mapRenderer.extent().yMaximum ()
c = QgsComposition(settings)
print "El layer set es: "
print mapRenderer.layerSet()[0]
mapRenderer.updateScale ()
c.setPlotStyle(QgsComposition.Print)
c.setPaperSize(anchoPapel, altoPapel)

##Agregando el mapa al composer
x, y = 0, 0
w, h = c.paperWidth(), c.paperHeight()
composerMap = QgsComposerMap(c, x ,y, w, h)
composerMap.setItemPosition(0,0)
composerMap.setBackgroundColor(QColor(255,255,255))
c.addItem(composerMap)




##Agregando la leyenda
#legend = QgsComposerLegend(c)
#colorLeyenda = QColor(255,255,255)
#legend.model().setLayerSet(mapRenderer.layerSet())
#legend.setItemPosition(0,10,False)
#legend.setBackgroundEnabled(False)
#legend.setColumnCount(6)
#legend.setSplitLayer(True)
#legend.setTitle("")
#fuente = QFont("Open Sans Condensed Light", pointSize = 11)
#estiloFuente = QgsComposerLegendStyle()
#estiloFuente.setFont(fuente)
#legend.setStyle(estiloFuente.SymbolLabel, estiloFuente)
#print "EL MARGEN PARA LA FUENTE ES"
#legend.setColumnSpace(10)
#legend.setBoxSpace(10)
#c.addItem(legend)




##Exportando a pdf
printer = QPrinter()
printer.setOutputFormat(QPrinter.PdfFormat)
print rutaSalida + "/" +os.path.splitext(os.path.basename(sys.argv[1]))[0] + ".pdf"
printer.setOutputFileName(rutaSalida + "/"+ os.path.splitext(os.path.basename(sys.argv[1]))[0] + ".pdf" )
printer.setPaperSize(QSizeF(c.paperWidth(), c.paperHeight()), QPrinter.Millimeter)
printer.setFullPage(True)
printer.setColorMode(QPrinter.Color)
printer.setResolution(c.printResolution())

pdfPainter = QPainter(printer)
paperRectMM = printer.pageRect(QPrinter.Millimeter)
paperRectPixel = printer.pageRect(QPrinter.DevicePixel)
c.render(pdfPainter, paperRectPixel, paperRectMM)
pdfPainter.end()


##Haciendo el etiquetado
shutil.copy2    (rutaSalida + "/"+ os.path.splitext(os.path.basename(sys.argv[1]))[0] + ".pdf", rutaSalida + "/mapasDepartamentales/mapa.pdf")
os.system('cd ' + rutaSalida + '/mapasDepartamentales/ && xelatex mapaAnotado.tex')
os.system('pdfcrop ' +rutaSalida + "/mapasDepartamentales/mapaAnotado.pdf " +  rutaSalida + "/" +os.path.splitext(os.path.basename(sys.argv[1]))[0] + ".pdf")
print "ACA TERMINA EL PROGRAMA"

print "ACA TERMINA EL PROGRAMA"
#app.exec_()
##Cerrando la aplicacion
#QgsApplication.exitQgis()






