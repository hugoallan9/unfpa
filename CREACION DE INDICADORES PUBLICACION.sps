***************************DEPARTAMENTO DE ANALISIS ESTADISTICO DIC 2015 *********************************************************************************************
********************************************************************************************************************************************************************************************
*****************SINTAXIS PARA EL LLENADO DE CUADROS ESTADISTICOS DE PUBLICACION ENEI ******************************************************************** 
********************************************************************************************************************************************************************************************

**** CREAR VARIABLES A SER UTILIZADAS EN LA ELABORACIÓN DE LA PUBLICACIÓN***************.

****crear variable grupo etnico***

RECODE PPA06 (3 THRU 4=2) (1 thru 2=1) (5=1) INTO etnicidad.
VARIABLE LABELS  etnicidad 'Pertencia étnica'.
VALUE LABELS etnicidad
1 'Indígena'
2 'No indígena'.
EXECUTE.


VALUE LABELS PPA02
1 'Hombre'
2 'Mujer'.
EXECUTE.


VALUE LABELS DOMINIO
1 'Urbano Metropolitano'
2 'Resto Urbano'
3 'Rural Nacional'.
EXECUTE.

*** crear variable grupo de edad*****.

RECODE PPA03 (15 thru 24=1) (25 thru 97=2) INTO G_edad.
VARIABLE LABELS  G_edad 'Grupos de edad'. 
VALUE LABELS G_edad
1 '15 - 24'
2 '25 y más'.
EXECUTE.

*********************VARIABLES A UN DÍGITO*********.

*P04C02B_1D P04C04B_1D.

COMPUTE P04C02B_2D=P02C02B.
COMPUTE P04C04B_2D=P02C04B.
EXECUTE.

IF(P02C02B=96)P04C02B_1D=9.
IF(P02C02B=95)P04C02B_1D=9.
IF(P02C02B=94)P04C02B_1D=9.
IF(P02C02B=93)P04C02B_1D=9.
IF(P02C02B=92)P04C02B_1D=9.
IF(P02C02B=91)P04C02B_1D=9.
IF(P02C02B=83)P04C02B_1D=8.
IF(P02C02B=82)P04C02B_1D=8.
IF(P02C02B=81)P04C02B_1D=8.
IF(P02C02B=75)P04C02B_1D=7.
IF(P02C02B=74)P04C02B_1D=7.
IF(P02C02B=73)P04C02B_1D=7.
IF(P02C02B=72)P04C02B_1D=7.
IF(P02C02B=71)P04C02B_1D=7.
IF(P02C02B=63)P04C02B_1D=6.
IF(P02C02B=62)P04C02B_1D=6.
IF(P02C02B=61)P04C02B_1D=6.
IF(P02C02B=54)P04C02B_1D=5.
IF(P02C02B=53)P04C02B_1D=5.
IF(P02C02B=52)P04C02B_1D=5.
IF(P02C02B=51)P04C02B_1D=5.
IF(P02C02B=44)P04C02B_1D=4.
IF(P02C02B=43)P04C02B_1D=4.
IF(P02C02B=42)P04C02B_1D=4.
IF(P02C02B=41)P04C02B_1D=4.
IF(P02C02B=35)P04C02B_1D=3.
IF(P02C02B=34)P04C02B_1D=3.
IF(P02C02B=33)P04C02B_1D=3.
IF(P02C02B=32)P04C02B_1D=3.
IF(P02C02B=31)P04C02B_1D=3.
IF(P02C02B=26)P04C02B_1D=2.
IF(P02C02B=25)P04C02B_1D=2.
IF(P02C02B=24)P04C02B_1D=2.
IF(P02C02B=23)P04C02B_1D=2.
IF(P02C02B=22)P04C02B_1D=2.
IF(P02C02B=21)P04C02B_1D=2.
IF(P02C02B=14)P04C02B_1D=1.
IF(P02C02B=13)P04C02B_1D=1.
IF(P02C02B=12)P04C02B_1D=1.
IF(P02C02B=11)P04C02B_1D=1.
IF(P02C02B=1)P04C02B_1D=0.
IF(P02C04B=99)P04C04B_1D=10.
IF(P02C04B=98)P04C04B_1D=10.
IF(P02C04B=97)P04C04B_1D=10.
IF(P02C04B=96)P04C04B_1D=10.
IF(P02C04B=95)P04C04B_1D=10.
IF(P02C04B=94)P04C04B_1D=10.
IF(P02C04B=93)P04C04B_1D=10.
IF(P02C04B=92)P04C04B_1D=10.
IF(P02C04B=91)P04C04B_1D=10.
IF(P02C04B=90)P04C04B_1D=10.
IF(P02C04B=87)P04C04B_1D=9.
IF(P02C04B=86)P04C04B_1D=9.
IF(P02C04B=85)P04C04B_1D=9.
IF(P02C04B=84)P04C04B_1D=9.
IF(P02C04B=82)P04C04B_1D=8.
IF(P02C04B=81)P04C04B_1D=8.
IF(P02C04B=80)P04C04B_1D=8.
IF(P02C04B=79)P04C04B_1D=8.
IF(P02C04B=78)P04C04B_1D=8.
IF(P02C04B=77)P04C04B_1D=8.
IF(P02C04B=75)P04C04B_1D=8.
IF(P02C04B=74)P04C04B_1D=8.
IF(P02C04B=73)P04C04B_1D=8.
IF(P02C04B=72)P04C04B_1D=8.
IF(P02C04B=71)P04C04B_1D=8.
IF(P02C04B=70)P04C04B_1D=8.
IF(P02C04B=69)P04C04B_1D=8.
IF(P02C04B=68)P04C04B_1D=7.
IF(P02C04B=65)P04C04B_1D=6.
IF(P02C04B=64)P04C04B_1D=6.
IF(P02C04B=63)P04C04B_1D=5.
IF(P02C04B=62)P04C04B_1D=5.
IF(P02C04B=61)P04C04B_1D=5.
IF(P02C04B=60)P04C04B_1D=5.
IF(P02C04B=59)P04C04B_1D=5.
IF(P02C04B=58)P04C04B_1D=5.
IF(P02C04B=56)P04C04B_1D=4.
IF(P02C04B=55)P04C04B_1D=4.
IF(P02C04B=53)P04C04B_1D=4.
IF(P02C04B=52)P04C04B_1D=4.
IF(P02C04B=51)P04C04B_1D=4.
IF(P02C04B=49)P04C04B_1D=4.
IF(P02C04B=47)P04C04B_1D=4.
IF(P02C04B=46)P04C04B_1D=4.
IF(P02C04B=45)P04C04B_1D=4.
IF(P02C04B=43)P04C04B_1D=3.
IF(P02C04B=42)P04C04B_1D=3.
IF(P02C04B=41)P04C04B_1D=3.
IF(P02C04B=38)P04C04B_1D=2.
IF(P02C04B=36)P04C04B_1D=2.
IF(P02C04B=35)P04C04B_1D=2.
IF(P02C04B=33)P04C04B_1D=2.
IF(P02C04B=32)P04C04B_1D=2.
IF(P02C04B=31)P04C04B_1D=2.
IF(P02C04B=29)P04C04B_1D=2.
IF(P02C04B=28)P04C04B_1D=2.
IF(P02C04B=25)P04C04B_1D=2.
IF(P02C04B=24)P04C04B_1D=2.
IF(P02C04B=23)P04C04B_1D=2.
IF(P02C04B=22)P04C04B_1D=2.
IF(P02C04B=21)P04C04B_1D=2.
IF(P02C04B=20)P04C04B_1D=2.
IF(P02C04B=18)P04C04B_1D=2.
IF(P02C04B=17)P04C04B_1D=2.
IF(P02C04B=16)P04C04B_1D=2.
IF(P02C04B=15)P04C04B_1D=2.
IF(P02C04B=14)P04C04B_1D=2.
IF(P02C04B=13)P04C04B_1D=2.
IF(P02C04B=11)P04C04B_1D=2.
IF(P02C04B=10)P04C04B_1D=2.
IF(P02C04B=8)P04C04B_1D=2.
IF(P02C04B=7)P04C04B_1D=2.
IF(P02C04B=6)P04C04B_1D=2.
IF(P02C04B=2)P04C04B_1D=1.
IF(P02C04B=1)P04C04B_1D=1.
EXECUTE.

VALUE LABELS P04C02B_1D
0 ' Ocupaciones militares ' 
1 ' Directores y gerentes ' 
2 ' Profesionales científicos e intelectuales ' 
3 ' Técnicos y profesionales de nivel medio ' 
4 ' Personal de apoyo administrativo ' 
5 ' Trabajadores de los servicios y vendedores de comercios y mercados ' 
6 ' Agricultores y trabajadores calificados agropecuarios, forestales y pesqueros ' 
7 ' Operarios y artesanos de artes mecanicas y de otros oficios ' 
8 ' Operadores de instalaciones y máquinas y ensambladores ' 
9 ' Ocupaciones elementales ' .
EXECUTE.

VALUE LABELS P04C02B_2D
1 ' Oficiales de las fuerzas armadas ' 
11 ' Directores ejecutivos, personal directivo de la administración pública..... ' 
12 ' Directores administradores y comerciales ' 
13 ' Directores y gerentes de producción y operaciones ' 
14 ' Gerentes de hoteles, restaurantes, comercios y otros servicios ' 
21 ' Profesionales de las ciencias y de la ingeniería ' 
22 ' Profesionales de la salud ' 
23 ' Profesionales de la enseñanza ' 
24 ' Especialistas en organización de la administración publica y de empresas ' 
25 ' Profesionales de tecnología de la información y las comunicaciones ' 
26 ' Profesionales en derecho, en ciencias sociales y culturales ' 
31 ' Profesionales de las ciencias y la ingeniería de nivel medio ' 
32 ' Profesionales de nivel medio de la salud ' 
33 ' Profesionales de nivel medio en operaciones financieras y administrativas ' 
34 ' Profesionales de nivel medio de servicios jurídicos, sociales, culturales y afines ' 
35 ' Técnicos de la tecnología de la información y las comunicaciones ' 
41 ' Oficinistas ' 
42 ' Empleados en trato directo con el público ' 
43 ' Empleados contables y encargados del registro de materiales ' 
44 ' Otro personal de apoyo administrativo ' 
51 ' Trabajadores de los servicios personales ' 
52 ' Vendedores ' 
53 ' Trabajadores de los cuidados personales ' 
54 ' Personal de los servicios de protección ' 
61 ' Agricultores y trabajadores calificados de explotaciones agropecuarias con destino al mercado ' 
62 ' Trabajadores forestales calificados, pescadores y cazadores ' 
63 ' Trabajadores agropecuarios, pescadores, cazadores y recolectores de subsistencia ' 
71 ' Oficiales y operarios de la construcción excluyendo electricistas ' 
72 ' Oficiales y operarios de la metalurgia, la construcción mecánica y afines ' 
73 ' Artesanos y operarios de las artes gráficas ' 
74 ' Trabajadores especializados en electricidad y la elecrotecnología ' 
75 ' Operarios y oficiales de procesamiento de alimentos, de la confección, ebanistas, otros artesanos y afines ' 
81 ' Operadores de instalaciones fijas y máquinas ' 
82 ' Ensambladores ' 
83 ' Conductores de vehículos y operadores de equipos pesados móviles ' 
91 ' Limpiadores y asistentes ' 
92 ' Peones agropecuarios, pesqueros y forestales ' 
93 ' Peones de la minería, la construcción, la industria manufacturera y el transporte ' 
94 ' Ayudantes de preparación de alimentos ' 
95 ' Vendedores ambulantes de servicios y afines ' 
96 ' Recolectores de desechos y otras ocupaciones elementales ' .
EXECUTE.


VALUE LABELS P04C04B_1D
1 ' Agricultura, ganadería, silvicultura y pesca ' 
2 ' Industrias manufactureras, explotación de minas y canteras, y otras actividades industriales ' 
3 ' Construcción ' 
4 ' Comercio al por mayor y al por menor, transporte y almacenamiento, actividades de alojamiento y de servicio de comidas ' 
5 ' Información y comunicaciones ' 
6 ' Actividades financieras y de seguros ' 
7 ' Actividades inmobiliarias ' 
8 ' Actividades profesionales, científicas, técnicas, y de servicios administrativos y de apoyo ' 
9 ' Actividades de administración pública y defensa, de enseñanza, actividades de atención en salud, y de asistencia social ' 
10 ' Otras actividades de servicios ' .
EXECUTE.

VALUE LABELS P04C04B_2D
1 ' Agricultura, ganadería, caza y actividades de servicios conexas ' 
2 ' Silvicultura y extracción de madera ' 
6 ' Extracción de petróleo crudo y gas natural ' 
7 ' Extracción de minerales metaliferos ' 
8 ' Explotación de otras minas y canteras ' 
10 ' Elaboración de productos alimenticios ' 
11 ' Elaboración de bebidas ' 
13 ' Fabricación de productos textiles ' 
14 ' Fabricación de prendas de vestir ' 
15 ' Fabricación de productos de cuero y productos conexos ' 
16 ' Producción de madera y fabricación de productos de madera y corcho, excepto.. ' 
17 ' Fabricación de papel y de productos de papel ' 
18 ' Impresión y reproducción de grabaciones ' 
20 ' Fabricación de sustancias y productos químicos ' 
21 ' Fabricación de productos farmacéuticos sustancias químicas medicinales y productos botánicos de uso farmacéutico ' 
22 ' Fabricación de productos de caucho y de plástico ' 
23 ' Fabricación de otros productos minerales no metálicos ' 
24 ' Fabricación de metales comunes ' 
25 ' Fabricación de productos elaborados de metal, excepto maquinaria y equipo ' 
28 ' Fabricación de maquinaria  y equipo n.c.p. ' 
29 ' Fabricación de vehículos automotores, remolques y semirremolques ' 
31 ' Fabricación de muebles ' 
32 ' Otras industrias manufactureras ' 
33 ' Reparación e instalación de maquinaria y equipo ' 
35 ' Suministro de electricidad, gas, vapor y aire acondicionado ' 
36 ' Captación, tratamiento y distribución de agua ' 
38 ' Recogida, tratamiento y eliminación de desechos; recuperación de materiales ' 
41 ' Construcción de edificios ' 
42 ' Obras de ingeniería civil ' 
43 ' Actividades especializadas de construcción ' 
45 ' Comercio al por mayor y al por menor y reparación de vehículos automotores y motocicletas ' 
46 ' Comercio al por mayor, excepto el de vehículos automotores y motocicletas ' 
47 ' Comercio al por menor, excepto el de vehículos automotores y motocicletas ' 
49 ' Transporte por vía terrestre y transporte por tuberías ' 
51 ' Transporte por vía aérea ' 
52 ' Almacenamiento y actividades de apoyo al transporte ' 
53 ' Actividades postales y de mensajería ' 
55 ' Actividades de alojamiento ' 
56 ' Actividades de servicio de comidas y bebidas ' 
58 ' Actividades de edición ' 
59 ' Actividades de producción de películas cinematográficas, vídeos y programas de televisión.... ' 
60 ' Actividades de programación y transmisión ' 
61 ' Telecomunicaciones ' 
62 ' Programación informática, consultoría de informática y actividades conexas ' 
63 ' Actividades de servicios de información ' 
64 ' Actividades de servicios financieros, excepto las de seguros y fondos de pensiones ' 
65 ' Seguros, reaseguros y fondos de pensiones, excepto planes de seguridad social de afiliación obligatoria ' 
68 ' Actividades inmobiliarias ' 
69 ' Actividades jurídicas y de contabilidad ' 
70 ' Actividades de oficinas principales; actividades de consultoría de gestión ' 
71 ' Actividades de arquitectura e ingeniería; ensayos y análisis técnicos ' 
72 ' Investigación científica y desarrollo ' 
73 ' Publicidad y estudios de mercado ' 
74 ' Otras actividades profesionales, científicas y técnicas ' 
75 ' Actividades veterinarias ' 
77 ' Actividades de alquiler y arrendamiento ' 
78 ' Actividades de empleo ' 
79 ' Actividades de agencias de viajes y operadores turísticos y servicios de reservas y actividades conexas ' 
80 ' Actividades de seguridad e investigación ' 
81 ' Actividades de servicios a edificios y de paisajismo ' 
82 ' Actividades administrativas y de apoyo de oficina y otras actividades de apoyo a las empresas ' 
84 ' Administración pública y defensa; planes de seguridad social de afiliación obligatoria ' 
85 ' Enseñanza ' 
86 ' Actividades de atención de la salud humana ' 
87 ' Actividades de atención en instituciones ' 
90 ' Actividades creativas, artísticas y de entretenimiento ' 
91 ' Actividades de biblioteca, archivos y museos y otras actividades culturales ' 
92 ' Actividades de juegos de azar y apuestas ' 
93 ' Actividades deportivas, de esparcimiento y recreativas ' 
94 ' Actividades de asociaciones ' 
95 ' Reparación de ordenadores y de efectos personales y enseres domésticos ' 
96 ' Otras actividades de servicios personales ' 
97 ' Actividades de los hogares como empleadores de personal doméstico ' 
98 ' Actividades no diferenciadas de los hogares como productores de bienes y servicios para uso propio ' 
99 ' Actividades de organizaciones y órganos extraterritoriales ' .
EXECUTE.


**************************************************************************************************************************************************
********************   CREACIÓN DE VARIABLE CONDICION DE TRABAJO QUE PERMITE LA FORMACIÓN DEL DATO *******
********************   PARA EL PUNTO 3.9 "CONDICIONES DE TRABAJO" (facilidades que otorgan en el trabajo)            ********
***************************************************************************************************************************************************.

IF(P04C34A=1) CONDICION=1.
IF(P04C34B=1) CONDICION=2.
IF(P04C34C=1) CONDICION=3.
IF(P04C34D=1) CONDICION=4.
IF(P04C34E=1) CONDICION=5.
VALUE LABELS CONDICION
1 'Tomar vacaciones'
2 'Permiso por motivos familiares'
3 'Ir al médico'
4 'Permiso de maternidad o paternidad'
5 'Fallecimiento de un familiar'.
EXECUTE.


**************************************************************************************************************************************************
********************   CREACIÓN DE VARIABLE FACTORES DE RIESGO   QUE PERMITE LA FORMACIÓN DEL DATO *******
********************   PARA EL PUNTO 3.10 "CONDICIONES DE TRABAJO"                                                                   ********
***************************************************************************************************************************************************

IF(P04C35A=1) FACTOR_RIESGO=1.
IF(P04C35B=1) FACTOR_RIESGO=2.
IF(P04C35C=1) FACTOR_RIESGO=3.
IF(P04C35D=1) FACTOR_RIESGO=4.
IF(P04C35E=1) FACTOR_RIESGO=5.
IF(P04C35F=1) FACTOR_RIESGO=6.
IF(P04C35G=1) FACTOR_RIESGO=7.
VALUE LABELS FACTOR_RIESGO
1 'Temperaturas extremas'
2 'Humedad'
3 'Ruido'
4 'Vibraciones'
5 'Iluminación deficiente'
6 'Sustancias tóxicas'
7 'Humo y polvo'.
EXECUTE.

*****SE REALIZA EL FILTRO PARA OBTENER DATOS DE PARENTESCO O POSICION DENTRO DEL HOGAR********************.

RECODE PPA05 (1=1) (2=2) (3=3) (4 thru 13=4) INTO PosicionHogar.
VARIABLE LABELS  PosicionHogar 'Posición en el hogar'.
VALUE LABELS PosicionHogar
1 'Jefe(a) del hogar'
2 'Esposo(a) o compañero(a)'
3 'Hijo(a)'
4 'Otros parientes y no parientes'.
EXECUTE.

******SE REALIZA EL FILTRO PARA OBTENER DATOS DE ESTADO CONYUGAL*************************
.
RECODE PPA09 (7=1) (1 thru 2=2) (3 thru 6=3) INTO Est_conyugal.
VARIABLE LABELS  Est_conyugal 'Estado conyugal'.
VALUE LABELS Est_conyugal
1 'Soltero(a)'
2 'Casado(a) o unido(a)'
3 'Viudo(a), separado(a), divorciado(a)'.
EXECUTE.

******SE REALIZA EL FILTRO PARA OBTENER DATOS DE JORNADA LABORAL*******************.

*****************SUMATORIA DE TODAS LAS HORAS REPORTADAS DE LA PREGUNTA P04C28A - P04C28G***********************.

COMPUTE Jornada_laboral=P04C28A + P04C28B + P04C28C + P04C28D + P04C28E + P04C28F + P04C28G.
VARIABLE LABELS  Jornada_laboral 'Jornada laboral'.
EXECUTE.

***********SE AGRUPAN LAS HORAS PARA LA CREACION DE RANGOS HORARIOS********************.

RECODE Jornada_laboral (0 thru 19=1) (20 thru 40=2) (41 thru 48=3) (48 thru 168=4) INTO Jornada.
VARIABLE LABELS  Jornada 'Jornada laboral'.
VALUE LABELS Jornada
1 'Menos de 20 horas a la semana'
2 'Entre 20 y 40 horas a la semana'
3 'Entre 41 y 48 horas a la semana'
4 'Más de 48 horas a la semana'.
EXECUTE.


*******************SE REALIZA FILTRO PARA OBTENER ASEGURADOS O NO ASEGURADOS DEL IGSS**************************

*************************se debe realizar filtro de la base de 15 años y mas****************************************************

RECODE P04C25A (1=1) (2=1) (3=1) (4=4) INTO IGSS.
VARIABLE LABELS  IGSS 'IGSS'.
VALUE LABELS IGSS
1 'Asegurado'
4 'No asegurado'.
EXECUTE.

*********************************************ELABORACION DE UNA VARIABLE QUE CONTENGA NIVELES EDUCATIVOS************************************
**********************************NOTA: LA SIGUIENTE SINTAXIS CONTEMPLA SI LAS PERSONAS CUENTAN CON EL TITULO*****************************
********************************************ESTA SINTAXIS PRESENTA UN NIVEL MAS ALTO DE DESAGREGACION******************************************* .

*********************AÑOS DE ESTUDIO********************************************************.
**********

COMPUTE GRADOS_ESTUDIO=(P03A05A+1) * 10.
EXECUTE.

*RECODE P03A05A P03A05B (SYSMIS=0).
*EXECUTE.
IF(P03A05A=0 OR P03A05A=1)GRADO=0.
IF(P03A05A>1)GRADO=P03A05B.
EXECUTE.

COMPUTE AÑOS_ESTUDIADOS=GRADO + GRADOS_ESTUDIO.
EXECUTE.

IF (AÑOS_ESTUDIADOS=10) INCOMPLETA_COMPLETA=0.
IF (AÑOS_ESTUDIADOS=20) INCOMPLETA_COMPLETA=0.
IF (AÑOS_ESTUDIADOS=21) INCOMPLETA_COMPLETA=0.
IF (AÑOS_ESTUDIADOS=31) INCOMPLETA_COMPLETA=1.
IF (AÑOS_ESTUDIADOS=32) INCOMPLETA_COMPLETA=1.
IF (AÑOS_ESTUDIADOS=33) INCOMPLETA_COMPLETA=1.
IF (AÑOS_ESTUDIADOS=34) INCOMPLETA_COMPLETA=1.
IF (AÑOS_ESTUDIADOS=35) INCOMPLETA_COMPLETA=1.
IF (AÑOS_ESTUDIADOS=36) INCOMPLETA_COMPLETA=2.
IF (AÑOS_ESTUDIADOS=41) INCOMPLETA_COMPLETA=3.
IF (AÑOS_ESTUDIADOS=42 ) INCOMPLETA_COMPLETA=3.
IF (AÑOS_ESTUDIADOS=43) INCOMPLETA_COMPLETA=3.
IF (AÑOS_ESTUDIADOS=54) INCOMPLETA_COMPLETA=3.
IF (AÑOS_ESTUDIADOS=55) INCOMPLETA_COMPLETA=3.
IF (AÑOS_ESTUDIADOS=56) INCOMPLETA_COMPLETA=4.
IF (AÑOS_ESTUDIADOS=57) INCOMPLETA_COMPLETA=4.
IF (AÑOS_ESTUDIADOS=61) INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=62) INCOMPLETA_COMPLETA=5.
EXECUTE.

********temporalmente se cambio la p03a06 por P03A06B***.

IF (AÑOS_ESTUDIADOS=63 AND P03A06B <=1000  ) INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=63 AND P03A06B >=1001 ) INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=64 AND P03A06B <=1000 ) INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=64 AND P03A06B >=1001 ) INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=65 AND P03A06B <=1000)  INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=65 AND P03A06B >=1001)  INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=66 AND  P03A06B<=1000)  INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=66 AND  P03A06B>=1001)  INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=71 AND  P03A06B<=1000)  INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=71 AND  P03A06B>=1001)  INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=72 AND  P03A06B<=1000)  INCOMPLETA_COMPLETA=5.
IF (AÑOS_ESTUDIADOS=72 AND  P03A06B>=1001)  INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=81)  INCOMPLETA_COMPLETA=6.
IF (AÑOS_ESTUDIADOS=82)  INCOMPLETA_COMPLETA=6.
EXECUTE.

IF (P03A06B>=103 & P03A06B<=174) INCOMPLETA_COMPLETA=4.
IF (P03A06B=199) INCOMPLETA_COMPLETA=4.
IF (P03A06B=404) INCOMPLETA_COMPLETA=4.
*IF(SYSMIS(INCOMPLETA_COMPLETA))INCOMPLETA_COMPLETA=0.
EXECUTE.

VALUE LABELS   INCOMPLETA_COMPLETA
0 'Ninguno'
1  'Primaria incompleta'
2  'Primaria completa'
3  'Diversificado incompleto'
4  'Diversificado completo'
5  'Superior incompleto'
6  'Superior completo'.

FREQUENCIES VARIABLES=INCOMPLETA_COMPLETA
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=P03A05A
  /ORDER=ANALYSIS.

*RECODE P03A05A P03A05B (0=SYSMIS).
*EXECUTE.

*******************************************************************************************************************************************************
****************************************************CALCULO DE LOS PRINCIPALES INDICADORES*****************************************
********************************************************************************************************************************************************.
********************************************************************************************************************************************************.
***********************************************************OCUPADOS*******************************************************************************.
*********************************************************************************************************************************************************

IF ((PPA03>=7) AND (p04a02=1 OR p04a03=1 OR p04a04= 1 OR  p04a05= 1 OR p04a07<6 OR p04a08=1 OR p04a09<3)) OCUPADOS =1.
EXECUTE.

VARIABLE LABELS OCUPADOS 'PEA OCUPADA'.

VALUE LABELS OCUPADOS
1 'Población ocupada'.

********************************************************************************************************************************************************
**********************************************POBLACION EN EDAD DE TRABAJAR************************************************************.
********************************************************************************************************************************************************

IF (PPA03>=7) PET = 1.
EXECUTE.

VARIABLE LABELS PET 'POBLACION EN EDAD DE TRABAJAR'.

********************************************************************************************************************************************************
************************************************POBLACION EN SUBEMPLEO VISIBLE*********************************************************
********************************************************************************************************************************************************

***DEFINICION: PARA EL SECTOR PUBLICO SON LOS QUE TRABAJAN MENOS DE 40 HORAS A LA SEMANA
***Y DESEAN TRABAJAR MAS HORAS,Y ESTAN DISPONIBLES***.

***PARA EL SECTOR PRIVADO SON LOS QUE TRABAJAN MENOS DE 48 HORAS, DESEAN MAS HORAS Y ESTAN DISPONIBLES.

***EMPLEADOS PUBLICOS**.

IF (PPA03>=7 AND P04C06=1) HTSECPUB =p04C28A + p04C28B+ p04C28C+ p04C28D + p04C28E+ p04C28F + p04C28G. 
EXECUTE.


IF ( HTSECPUB <40 AND p04E01=1 AND p04E05= 1)  SUBVISIB = 1.
EXECUTE.


*********************************************EMPLEADOS PRIVADOS****************************************************************************.

IF (PPA03>=7 AND P04C06>1) HTSECPRI = p04C28A + p04C28B+ p04C28C+ p04C28D + p04C28E+ p04C28F + p04C28G.   
EXECUTE.

IF ( HTSECPRI<48 AND p04E01=1 AND p04E05=1)  SUBVISIB = 1.
EXECUTE.

VARIABLE LABELS SUBVISIB 'SUBEMPLEADOS VISIBLES O POR HORAS'.

COMPUTE SUBVISIBLES=SUBVISIB.
EXECUTE.

**************************Hacer variable de total de horas trabajadas del sector público y privado********************************************.

RECODE HTSECPUB HTSECPRI (SYSMIS=0).
EXECUTE.


IF (PPA03>=7) TOTAL_HORAS_TRABAJADAS=HTSECPUB + HTSECPRI.
EXECUTE.

RECODE HTSECPUB HTSECPRI TOTAL_HORAS_TRABAJADAS (0=SYSMIS).
EXECUTE.

***********************************************************************************************************************************************************.
*********************************************POBLACION DESEMPLEADA **************************************************************************.
***********************************************************************************************************************************************************.

IF (PPA03>=7 AND  P04B05=2) DESOCUPADOS=1.
EXECUTE.


****************************************************************************************************************************************************************
*******************************POBLACION ECONOMICAMENTE ACTIVA -PEA-***********************************************************************
*****************************************************************************************************************************************************************

IF (PPA03>=7) POBECA=0.
EXECUTE.

IF (PPA03>=7 AND OCUPADOS=1) POBECA = 1.
IF (PPA03>=7 AND DESOCUPADOS=1) POBECA = 1.
EXECUTE.


VARIABLE LABELS POBECA 'POBLACION ECONOMICAMENTE ACTIVA'.

COMPUTE PEA=POBECA.
EXECUTE.

***************************************************************************************************************************************************************************************
*******************************************************POBLACION ECONOMICAMENTE INACTIVA**************************************************************************.
***************************************************************************************************************************************************************************************.


IF (PPA03>=7 AND POBECA = 0) POBINAC = 1.
EXE.

VARIABLE LABELS POBINAC 'POBLACION ECONOMICAMENTE INACTIVA'.

COMPUTE INACTIVOS=POBINAC.
EXECUTE.


************************EMPLEO FORMAL E INFORMAL*******************************.
*************************************************************************************************.
*************************************************************************************************.

USE ALL.
COMPUTE filter_$=(PPA03 > 14).
VARIABLE LABEL filter_$ 'PPA03 > 14 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

IF (PPA03>6) FORMAL_INFORMAL=0.
EXECUTE.

***CAT OCUPACIONAL = EMPLEADO GOBIERNO, ES FORMAL*****.
IF (PPA03>6 & P04C06=1 & OCUPADOS=1) FORMAL_INFORMAL=2.
EXECUTE.

***CAT OCUPACIONAL =PRIVADO ES INFORMAL SI CUMPLE CON MENOS DE 6 EMPLEADOS*****.
IF (PPA03>6 & P04C06=2 & P04C05<6 & OCUPADOS=1) FORMAL_INFORMAL=1.
EXECUTE.

***CAT OCUPACIONAL = PRIVADO ES FORMAL SI CUMPLE CON MAS DE 5 EMPLEADOS*****.
IF (PPA03>6 & P04C06=2 & P04C05>=6 & OCUPADOS=1) FORMAL_INFORMAL=2.
EXECUTE.

***CAT OCUPACIONAL = PEON ES INFORMAL*****.
IF (PPA03>6 & P04C06=3 & OCUPADOS=1) FORMAL_INFORMAL=1.
EXECUTE.

***CAT OCUPACIONAL = EMPLEADO CASA PARTICULAR ES INFORMAL*****.
IF (PPA03>6 & P04C06=4 & OCUPADOS=1) FORMAL_INFORMAL=1.
EXECUTE.

***CAT OCUPACIONAL = CUENTA PROPIA  SI TIENE MENOS DE 6 TRABAJADORES Y NO ES PROFESIONAL (NIVEL EDUCATIVO) ES INFORMAL*****.
IF (PPA03>6 & P04C06=5 & P03A05A<5 & OCUPADOS=1) FORMAL_INFORMAL=1.
IF (PPA03>6 & P04C06=7 & P03A05A<5 & OCUPADOS=1) FORMAL_INFORMAL=1.
EXECUTE.

***CAT OCUPACIONAL = PATRON, EMPLEADORES, SOCIOS SI TIENE MENOS DE 6 EMPLEADOS Y SI NO ES 
*PROFESIONAL (NIVEL EDUCATIVO) ES INFORMAL*****.

IF (PPA03>6 & P04C06=6 & P04C05<6 & P03A05A<5 & OCUPADOS=1) FORMAL_INFORMAL=1.
IF (PPA03>6 & P04C06=8 & P04C05<6 & P03A05A<5 & OCUPADOS=1) FORMAL_INFORMAL=1.
EXECUTE.

***CAT OCUPACIONAL = NO REMUNERADO(A) ES INFORMAL*****.
IF (PPA03>6 & P04C06=9 & OCUPADOS=1) FORMAL_INFORMAL=1.
EXECUTE.

***BUSCANDO LAS CATEGORIAS DE FORMAL NO ENCONTRADAS EN OTRA PARTE***********************.
IF (FORMAL_INFORMAL<>1 & OCUPADOS=1)FORMAL_INFORMAL=2.
EXECUTE.

VALUE LABELS FORMAL_INFORMAL
1 'Informal'
2 'Formal'.



DO IF (FORMAL_INFORMAL=0).
RECODE FORMAL_INFORMAL ( ELSE=SYSMIS).
END IF.
EXECUTE.

****************************FIN DE SINTAXIS DE INDICADORES DE EMPLEO****************************************.
**********EQUIPO DE TRABAJO ENEI 1-2015*****************************************************************************.
************************************************************************************************************************************.

********************   CREACIÓN DE VARIABLE CONTRATO QUE PERMITE LA FORMACIÓN DEL DATO *******
********************   PARA EL PUNTO 3.6 "SEGÚN TIPO DE CONTRATO"                                             ********
*********************************************************************************************************************************.

IF(P04C07=2) CONTRATO=1. 
IF(P04C08A=1) CONTRATO=2. 
IF(P04C08A=2) CONTRATO=3.
VALUE LABELS CONTRATO
1 'No tiene'
2 'Por tiempo indefinido'
3 'Temporal o termino fijo'.
EXECUTE.


********************************CREANDO LA VARIABLE DE TIEMPO BUSCANDO EMPLEO*************************************************************

RECODE P04F01 (0 thru 4=1) (5 thru 8=2) (9 thru 12=3) (13 thru 15=4) (16 thru 97=5) INTO TIEMPOBUSC.    
VARIABLE LABELS  TIEMPOBUSC 'Tiempo de busqueda'.
VALUE LABELS TIEMPOBUSC
1 '4 Semanas o menos'
2 'Entre 5 y 8 semanas'
3 'Entre 9 y 12 semanas'
4 'Entre 13 y 15 semanas'
5 'Más de 15 semanas'. 
EXECUTE.


***********************************************GENERACION DE LA VARIABLE DE INGRESO*************************************************************.

***SINTAXIS PARA LA REVISIÓN DE LAS VARIABLES SALARIO Y GANACIA PARA PUBLICACIÓN. 
***ENEI 1-2015.

***Revisión de los casos extremos para las variables salario y ganancia. 
***Según lo acordado, la publicación incluirá solo resultados para estas variables, no así para agregados de ingresos laborales. 
***Para el análisis de consistencia y revisión de extremos usaremos la base sin expandir. 

WEIGHT OFF.

*************************************************************************************************************************************.
***********************************************************SALARIO***************************************************************. 
*************************************************************************************************************************************.
*************************************************************************************************************************************.
*-----------------------------------------------Consistencia estructural-----------------------------------------------------------------------------------. 
*************************************************************************************************************************************.

***El primer paso para la revisión de cualquier variable es: una frecuencia simple. 
FREQUENCIES P04C10.

***Revisamos que solo las categorías ocupacionales que corresponden reporten valor en esta variable. 
TEMPORARY.
SELECT IF (P04C10>0).
FREQUENCIES P04C06.

***Efectivamente solo reportan un salario: empleados del gobierno, empleados privados, jornaleros y empleadas domésticas. 
***La consistencia la haremos en función de la categoría ocupacional. 

***Revisión de casos extremos. 
***********************************.
***Una primera revisión permite ver la distribución y otras medidas de tendencia central según categoría ocupacional. 
***Si bien hay algunos valores altos en las cuatro categorías, en primer momento parecen aceptables. 
***Los valores más altos de la distribución corresponden a las categorías empleado de gobierno y empleado privado. 

EXAMINE VARIABLES=P04C10 BY P04C06
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

***Construimos un indicador para ver a cuántas desviaciones estándar de su sub grupo se encuentran los casos.
***Listaremos los que estén a más de 3 desviaciones estándar para una revisión más detallada. 
***Segmentamos por categoría ocupacional.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=P04C06
  /P04C10_mean=MEAN(P04C10) 
  /P04C10_median=MEDIAN(P04C10) 
  /P04C10_sd=SD(P04C10).

***Calculamos el indicador. 
***El sufijo DSM hace referencia a : desviaciones estándar de la media. 
***Nótese que se constuirá para cada una de las categorías ocupacionales (a cuántas desviaciones estándar de la media de la categoría). 

COMPUTE DSM_P04C10 = RND ((P04C10 - P04C10_mean) / P04C10_sd).
EXECUTE.

FREQUENCIES DSM_P04C10.

TEMPORARY.
SELECT IF (DSM_P04C10>3). 
FREQUENCIES P04C10.

***Listamos los casos a revisar (que estén a más de tres DS de la media de su sub grupo). por categoría. 
***Para mayor control hacemos la revisión por categorías. 
 
TEMPORARY . 
SELECT IF (DSM_P04C10>3 and P04C06=1).
SUMMARIZE
  /TABLES=dominio PPA02 PPA03 P03A05A P03A05B P04C06 P04C10 TOTAL_HORAS_TRABAJADAS DSM_P04C10
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

TEMPORARY . 
SELECT IF (DSM_P04C10>3 and P04C06=2).
SUMMARIZE
  /TABLES= NUM_HOGAR dominio PPA02 PPA03 P03A05A P03A05B P04C06 P04C10 TOTAL_HORAS_TRABAJADAS DSM_P04C10
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

TEMPORARY . 
SELECT IF (DSM_P04C10>3 and P04C06=3).
SUMMARIZE
  /TABLES= NUM_HOGAR dominio PPA02 PPA03 P03A05A P03A05B P04C06 P04C10 TOTAL_HORAS_TRABAJADAS DSM_P04C10
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

TEMPORARY . 
SELECT IF (DSM_P04C10>3 and P04C06=4).
SUMMARIZE
  /TABLES= NUM_HOGAR dominio PPA02 PPA03 P03A05A P03A05B P04C06 P04C10 TOTAL_HORAS_TRABAJADAS DSM_P04C10
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

*************************************************************************************************************************************.
***********************************************************GANANCIA*************************************************************. 
*************************************************************************************************************************************.

***Repetimos los pasos explicados en párrafos anteriores. 

******************************************************************.
**********Ganancia no agrícola********************************. 
**Tanto en la variable de ganancia no agrícola como casos de cuenta propia + patron no agrícola. 

FREQUENCIES P04C22 .
FREQUENCIES P04C06.

EXAMINE VARIABLES=P04C22 BY P04C06
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=P04C06
  /P04C22_mean=MEAN(P04C22) 
  /P04C22_median=MEDIAN(P04C22) 
  /P04C22_sd=SD(P04C22).


COMPUTE DSM_P04C22 = RND ((P04C22 - P04C22_mean) / P04C22_sd).
EXECUTE.

FREQUENCIES DSM_P04C22.

***************************.
**Cuenta propia no agro. 
***************************.
TEMPORARY . 
SELECT IF (DSM_P04C22>3 and P04C06=5).
SUMMARIZE
  /TABLES=dominio NUM_HOGAR CP PPA02 PPA03 P03A05A P03A05B P04C06 P04C22 TOTAL_HORAS_TRABAJADAS DSM_P04C22
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

*******************.
**Patron no agro.
*******************.
TEMPORARY . 
SELECT IF (DSM_P04C22>3 and P04C06=6).
SUMMARIZE
  /TABLES=dominio  NUM_HOGAR CP PPA02 PPA03 P03A05A P03A05B P04C06 P04C22 TOTAL_HORAS_TRABAJADAS DSM_P04C22
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

FREQUENCIES P04C23.

******************************************************************.
**********Ganancia agrícola***********************************. 
**Tanto en la variable de ganancia agrícola como casos de cuenta propia + patron agrícola. 

FREQUENCIES P04C23 .
FREQUENCIES P04C06.

**Son 638 casos tanto para ganancia como en la categoría ocupacional (trabajador por cuenta propia agro + patrón agro).

EXAMINE VARIABLES=P04C23 BY P04C06
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

AGGREGATE
  /OUTFILE=* MODE=ADDVARIABLES
  /BREAK=P04C06
  /P04C23_mean=MEAN(P04C23) 
  /P04C23_median=MEDIAN(P04C23) 
  /P04C23_sd=SD(P04C23).

COMPUTE DSM_P04C23 = RND ((P04C23 - P04C23_mean) / P04C23_sd).
EXECUTE.

FREQUENCIES DSM_P04C23.

TEMPORARY . 
SELECT IF (DSM_P04C23>3 and P04C06=7).
SUMMARIZE
  /TABLES=dominio  NUM_HOGAR CP PPA02 PPA03 P03A05A P03A05B P04C06 P04C23 TOTAL_HORAS_TRABAJADAS DSM_P04C23
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

TEMPORARY . 
SELECT IF (DSM_P04C23>3 and P04C06=8).
SUMMARIZE
  /TABLES=dominio  NUM_HOGAR CP PPA02 PPA03 P03A05A P03A05B P04C06 P04C23 TOTAL_HORAS_TRABAJADAS DSM_P04C23
  /FORMAT=VALIDLIST NOCASENUM TOTAL LIMIT=100
  /TITLE='Resúmenes de casos'
  /MISSING=VARIABLE
  /CELLS=COUNT.

***Corregida la base. No se harán imputaciones para ningún caso. 

***Creamos la variable Ylab_publi (Ingreso laboral).
***Según lo acordado con Carlos Mancia, se dejarán fuera los casos missing que corresponden a rechazo, es decir, no se les imputará. 

FREQUENCIES P04C06.

FREQUENCIES P04C10 P04C22 P04C23.
EXECUTE.

EXAMINE VARIABLES=P04C22 BY P04C06
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

EXAMINE VARIABLES=P04C23 BY P04C06
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

compute YLAB_PUBLI=sum.1 (P04C10, P04C22, P04C23).
exe. 

VARIABLE LABELS YLAB_PUBLI 'Ingreso laboral'.

FREQUENCIES  YLAB_PUBLI.

***Calculamos promedios. 

WEIGHT BY Factor_expansion.

TEMPORARY. 
SELECT IF (ppa03>14).
* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=PPA02 DOMINIO YLAB_PUBLI DISPLAY=LABEL
  /TABLE PPA02 + DOMINIO BY YLAB_PUBLI [MEAN]
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=AFTER
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=AFTER.

if (ppa03>14 and (P04C10>0 and P04C10<9)) uno=1.
EXECUTE.

TEMPORARY.
SELECT IF (ppa03>14).
RANK VARIABLES=YLAB_PUBLI (A) BY uno
  /RANK
  /NTILES(5)
  /PRINT=NO
  /TIES=MEAN.

TEMPORARY.
SELECT IF (ppa03>14).
MEANS TABLES=YLAB_PUBLI BY NYLAB_PU
  /CELLS MEAN COUNT STDDEV.

if ( P04C06>0 and P04C06<5)tipo_trab=1.
if ( P04C06>4 and P04C06<9)tipo_trab=2.
EXECUTE.

FREQUENCIES P04C06 tipo_trab.

value labels tipo_trab
1 'Asalariados'
2 'Trabajadores independientes'.


********************************************************************************************************************************************************************************************
***********************************************SINTAXIS PARA EL LLENADO DE CUADROS ESTADISTICOS DE PUBLICACION ENEI ************************************** .
***************************************************************************ANEXO 3*******************************************************************************************************
****************************FILTRO DE POBLACION DE 15 AÑOS Y MAS*******************************************************************

USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1).
VARIABLE LABELS filter_$ 'PPA03 >= 15 & PPA12 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*****************************CUADRO 1 VARIABLES DEL MERCADO DE TRABAJO POR DOMINIOS DE ESTUDIO, POBLACION TOTAL*********************************

CTABLES
  /VLABELS VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS DOMINIO 
    DISPLAY=LABEL
  /TABLE PET [C] + PEA [C] + OCUPADOS [C] + DESOCUPADOS [C] + SUBVISIBLES [C] + INACTIVOS [C] BY 
    DOMINIO [C][COUNT F40.0]
  /CATEGORIES VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

****************************CUADRO 3 VARIABLES DEL MERCADO DE TRABAJO POR SEXO********************************************************************************.

CTABLES
  /VLABELS VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS PPA02 
    DISPLAY=LABEL
  /TABLE PET [C][COUNT F40.0] + PEA [C][COUNT F40.0] + OCUPADOS [C][COUNT F40.0] + DESOCUPADOS 
    [C][COUNT F40.0] + SUBVISIBLES [C][COUNT F40.0] + INACTIVOS [C][COUNT F40.0] BY PPA02
  /CATEGORIES VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=PPA02 ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

********************************************TABLA ESPECIFICA DEL CUADRO 5****************************************************************************************************.
CTABLES
  /VLABELS VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS etnicidad 
    DISPLAY=LABEL
  /TABLE PET [C][COUNT F40.0] + PEA [C][COUNT F40.0] + OCUPADOS [C][COUNT F40.0] + DESOCUPADOS 
    [C][COUNT F40.0] + SUBVISIBLES [C][COUNT F40.0] + INACTIVOS [C][COUNT F40.0] BY etnicidad
  /CATEGORIES VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=etnicidad ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

******************************************LA TABLA GENERA INFORMACION PARA LLENAR CUADROS DEL 7 AL 12*******************************************************

CTABLES
  /VLABELS VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS DOMINIO PPA02 
    DISPLAY=LABEL
  /TABLE PET [C][COUNT F40.0] + PEA [C][COUNT F40.0] + OCUPADOS [C][COUNT F40.0] + DESOCUPADOS 
    [C][COUNT F40.0] + SUBVISIBLES [C][COUNT F40.0] + INACTIVOS [C][COUNT F40.0] BY DOMINIO > PPA02
  /CATEGORIES VARIABLES=PET PEA OCUPADOS DESOCUPADOS SUBVISIBLES INACTIVOS ORDER=A KEY=VALUE 
    EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=PPA02 ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


***************************************CUADRO 13 POBLACION OCUPADA POR DOMINIOS DE ESTUDIO SEGUN CARACTERISTICAS SELECCIONADAS************.
***********CUADROS ESTADISTICOS GRANDES: PROCEDIMIENTO A UTILIZAR, SE EXTRAERAN LOS FILTROS (CADA UNO SERA UNA VARIABLE NUEVA)  
QUE COMPONEN LA TABLA GENERAL,  PARA POR ULTIMO GENERAR LA TABLA GENERAL POR MEDIO DE UNA CUSTOM TABLES***************************.

****************************FILTRADO DE EDAD MAYOR DE 15, RESULTADO DE LA ENTREVISTA COMPLETA Y QUE SEAN OCUPADOS***********

FILTER OFF.

USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1 & OCUPADOS = 1).
VARIABLE LABEL filter_$ 'PPA03 >= 15 & PPA12 = 1 & OCUPADOS = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*********************************************************TABLA 13****************************************************************************************************************************.

CTABLES
  /VLABELS VARIABLES=PPA02 G_edad etnicidad PosicionHogar Est_conyugal Jornada IGSS  FORMAL_INFORMAL INCOMPLETA_COMPLETA  P04C08A 
    DOMINIO 
    DISPLAY=LABEL
  /TABLE PPA02 [C] + G_edad [C] + etnicidad [C] + PosicionHogar [C] + Est_conyugal [C] + Jornada 
    [C] + IGSS [C] + FORMAL_INFORMAL [C] + INCOMPLETA_COMPLETA [C] + CONTRATO [C] BY DOMINIO [C][COUNT F40.0, COLPCT.COUNT 'Column N' 
    F40.1]
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=G_edad PosicionHogar Est_conyugal Jornada IGSS FORMAL_INFORMAL INCOMPLETA_COMPLETA CONTRATO ORDER=A 
    KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=etnicidad ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

***************************************************************************************************************************************************************************
**************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 14****************************************************
***************************************************************************************************************************************************************************

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=P04C06 P04C02B_1D P04C04B_1D DOMINIO DISPLAY=LABEL
  /TABLE P04C06 [C] + P04C02B_1D [C] + P04C04B_1D [C] BY DOMINIO [C][COUNT F40.0, COLPCT.COUNT 
    F40.1]
  /CATEGORIES VARIABLES=P04C06 P04C02B_1D P04C04B_1D ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

***************************************************************************************************************************************************************************
**************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 15****************************************************
***************************************************************************************************************************************************************************

* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=DOMINIO G_edad etnicidad PosicionHogar Est_conyugal Jornada IGSS 
    FORMAL_INFORMAL INCOMPLETA_COMPLETA CONTRATO PPA02 
    DISPLAY=LABEL
  /TABLE DOMINIO [C][COUNT F40.0, COLPCT.COUNT F40.1] + G_edad [C][COUNT F40.0, COLPCT.COUNT F40.1] 
    + etnicidad [C][COUNT F40.0, COLPCT.COUNT F40.1] + PosicionHogar [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] + Est_conyugal [C][COUNT F40.0, COLPCT.COUNT F40.1] + Jornada [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] + IGSS [C][COUNT F40.0, COLPCT.COUNT F40.1] + FORMAL_INFORMAL [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] + INCOMPLETA_COMPLETA [C][COUNT F40.0, COLPCT.COUNT F40.1] + CONTRATO [C][COUNT F40.0, 
    COLPCT.COUNT F40.1] BY PPA02 [C]
  /CATEGORIES VARIABLES=DOMINIO PPA02 ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=G_edad PosicionHogar Est_conyugal Jornada IGSS FORMAL_INFORMAL 
    INCOMPLETA_COMPLETA CONTRATO ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=etnicidad [2.00, 1.00, OTHERNM] EMPTY=INCLUDE.

***************************************************************************************************************************************************************************
*************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 16****************************************************
***************************************************************************************************************************************************************************

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=P04C06 P04C02B_1D P04C04B_1D PPA02 DISPLAY=LABEL
  /TABLE P04C06 [C][COUNT F40.0, COLPCT.COUNT COMMA40.1] + P04C02B_1D [C][COUNT F40.0, COLPCT.COUNT 
    COMMA40.1] + P04C04B_1D [C][COUNT F40.0, COLPCT.COUNT COMMA40.1] BY PPA02 [C]
  /CATEGORIES VARIABLES=P04C06 P04C02B_1D P04C04B_1D ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

***************************************************************************************************************************************************************************
************PARA LA GENERACION DE LOS CUADROS QUE SIGUEN SE DEBE REALIZAR EL FILTRO DE SUB EMPLEO VISIBLE*****************
***************************************************************************************************************************************************************************

filter off.

USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1 & SUBVISIBLES = 1).
VARIABLE LABEL filter_$ 'PPA03 >= 15 & PPA12 = 1 & SUBVISIBLES = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

***************************************************************************************************************************************************************************
**************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 17****************************************************
***************************************************************************************************************************************************************************

* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=PPA02 G_edad etnicidad PosicionHogar Est_conyugal Jornada IGSS FORMAL_INFORMAL 
    INCOMPLETA_COMPLETA CONTRATO DOMINIO 
    DISPLAY=LABEL
  /TABLE PPA02 [C][COUNT F40.0, COLPCT.COUNT F40.1] + G_edad [C][COUNT F40.0, COLPCT.COUNT F40.1] + 
    etnicidad [C][COUNT F40.0, COLPCT.COUNT F40.1] + PosicionHogar [C][COUNT F40.0, COLPCT.COUNT F40.1] 
    + Est_conyugal [C][COUNT F40.0, COLPCT.COUNT F40.1] + Jornada [C][COUNT F40.0, COLPCT.COUNT F40.1] 
    + IGSS [C][COUNT F40.0, COLPCT.COUNT F40.1] + FORMAL_INFORMAL [C][COUNT F40.0, COLPCT.COUNT F40.1] 
    + INCOMPLETA_COMPLETA [C][COUNT F40.0, COLPCT.COUNT F40.1] + CONTRATO [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] BY DOMINIO [C]
  /CATEGORIES VARIABLES=PPA02 DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=G_edad PosicionHogar Est_conyugal Jornada IGSS FORMAL_INFORMAL 
    INCOMPLETA_COMPLETA CONTRATO ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=etnicidad [2.00, 1.00, OTHERNM] EMPTY=INCLUDE.


***************************************************************************************************************************************************************************
**************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 18****************************************************
***************************************************************************************************************************************************************************

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=P04C06 P04C02B_1D P04C04B_1D DOMINIO DISPLAY=LABEL
  /TABLE P04C06 [C] + P04C02B_1D [C] + P04C04B_1D [C] BY DOMINIO [C][COUNT F40.0, COLPCT.COUNT 
    COMMA40.1]
  /CATEGORIES VARIABLES=P04C06 P04C02B_1D P04C04B_1D ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.

***************************************************************************************************************************************************************************
**************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 19****************************************************
***************************************************************************************************************************************************************************

* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=DOMINIO G_edad etnicidad PosicionHogar Est_conyugal Jornada IGSS 
    FORMAL_INFORMAL INCOMPLETA_COMPLETA CONTRATO PPA02 
    DISPLAY=LABEL
  /TABLE DOMINIO [C][COUNT F40.0, COLPCT.COUNT F40.1] + G_edad [C][COUNT F40.0, COLPCT.COUNT F40.1] 
    + etnicidad [C][COUNT F40.0, COLPCT.COUNT F40.1] + PosicionHogar [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] + Est_conyugal [C][COUNT F40.0, COLPCT.COUNT F40.1] + Jornada [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] + IGSS [C][COUNT F40.0, COLPCT.COUNT F40.1] + FORMAL_INFORMAL [C][COUNT F40.0, COLPCT.COUNT 
    F40.1] + INCOMPLETA_COMPLETA [C][COUNT F40.0, COLPCT.COUNT F40.1] + CONTRATO [C][COUNT F40.0, 
    COLPCT.COUNT F40.1] BY PPA02 [C]
  /CATEGORIES VARIABLES=DOMINIO PPA02 ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=G_edad PosicionHogar Est_conyugal Jornada IGSS FORMAL_INFORMAL 
    INCOMPLETA_COMPLETA CONTRATO ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=etnicidad [2.00, 1.00, OTHERNM] EMPTY=INCLUDE.


***************************************************************************************************************************************************************************
**************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 20****************************************************
***************************************************************************************************************************************************************************

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=P04C06 P04C02B_1D P04C04B_1D PPA02 DISPLAY=LABEL
  /TABLE P04C06 [C][COUNT F40.0, COLPCT.COUNT COMMA40.1] + P04C02B_1D [C][COUNT F40.0, COLPCT.COUNT 
    COMMA40.1] + P04C04B_1D [C][COUNT F40.0, COLPCT.COUNT COMMA40.1] BY PPA02 [C]
  /CATEGORIES VARIABLES=P04C06 P04C02B_1D P04C04B_1D ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


**************************************************************************************************************************************************************************
*********************PARA LA GENERACION DE LOS CUADROS QUE SIGUEN SE DEBE REALIZAR EL FILTRO DE DESEMPLEO *****************
**************************************************************************************************************************************************************************.

FILTER OFF.

USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1 & DESOCUPADOS = 1).
VARIABLE LABEL filter_$ 'PPA03 >= 15 & PPA12 = 1 & DESOCUPADOS = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

***************************************************************************************************************************************************************************
*************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 21****************************************************
***************************************************************************************************************************************************************************

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=PPA02 G_edad etnicidad PosicionHogar Est_conyugal TIEMPOBUSC P04F03 P04F04 
    P04F06 INCOMPLETA_COMPLETA DOMINIO 
    DISPLAY=LABEL
  /TABLE PPA02 [C] + G_edad [C] + etnicidad [C] + PosicionHogar [C] + Est_conyugal [C] + TIEMPOBUSC 
    [C] + P04F03 [C] + P04F04 [C] + P04F06 [C] +  INCOMPLETA_COMPLETA [C] BY DOMINIO [C][COUNT F40.0, COLPCT.COUNT 
    COMMA40.1]
  /CATEGORIES VARIABLES=PPA02 G_edad etnicidad PosicionHogar Est_conyugal TIEMPOBUSC P04F03 P04F04 
    P04F06 INCOMPLETA_COMPLETA ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


***************************************************************************************************************************************************************************
*************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 22****************************************************
***************************************************************************************************************************************************************************

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=DOMINIO G_edad etnicidad PosicionHogar Est_conyugal TIEMPOBUSC P04F03 P04F04 
    P04F06 INCOMPLETA_COMPLETA PPA02 
    DISPLAY=LABEL
  /TABLE DOMINIO [C] + G_edad [C] + etnicidad [C] + PosicionHogar [C] + Est_conyugal [C] + 
    TIEMPOBUSC [C] + P04F03 [C] + P04F04 [C] + P04F06 [C] + INCOMPLETA_COMPLETA [C] BY PPA02 [C][COUNT F40.0, 
    COLPCT.COUNT COMMA40.1]
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=G_edad etnicidad PosicionHogar Est_conyugal TIEMPOBUSC P04F03 P04F04 P04F06 
    INCOMPLETA_COMPLETA ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


***************************************************************************************************************************************************************************
*************************************************GENERACION DE TABLA CON DATOS PARA CUADRO 23****************************************************
***************************************************************************************************************************************************************************.

FILTER OFF.

USE ALL.
COMPUTE filter_$=(PPA03 > 14 & PPA12=1 & OCUPADOS=1).
VARIABLE LABELS filter_$ 'PPA03 >= 14 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=PPA02 NYLAB_PU P04C06 P04C04B_1D Jornada FORMAL_INFORMAL DOMINIO YLAB_PUBLI 
    DISPLAY=LABEL
  /TABLE PPA02 + NYLAB_PU [C] + P04C06 + P04C04B_1D [C] + Jornada + FORMAL_INFORMAL BY DOMINIO [C] 
    > YLAB_PUBLI [S][MEAN]
  /CATEGORIES VARIABLES=PPA02 DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=NYLAB_PU ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=P04C06 P04C04B_1D Jornada FORMAL_INFORMAL ORDER=A KEY=VALUE EMPTY=INCLUDE.


* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=Jornada tipo_trab YLAB_PUBLI DISPLAY=LABEL
  /TABLE Jornada [C] BY tipo_trab [C] > YLAB_PUBLI [S][MEAN]
  /CATEGORIES VARIABLES=Jornada ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=tipo_trab ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


********************************************************************************************************************************************************************************************
***********************************************SINTAXIS PARA EL LLENADO DE CUADROS ESTADISTICOS DE PUBLICACION ENEI ************************************** .
*********************************************************************CAP 2 POBLACION ECONOMICAMENTE ACTIVA*************************************************************.
filter off.

USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1).
VARIABLE LABELS filter_$ 'PPA03 >= 15 & PPA12 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=PET etnicidad PPA02  G_edad PEA DOMINIO DISPLAY=LABEL
  /TABLE PET [C] + PET [C] > (etnicidad [C] + PPA02 [C] + G_edad [C]) + PEA [C] > (PPA02 [C] + 
    etnicidad [C] + G_edad [C]) BY DOMINIO [C][COUNT F40.0]
  /CATEGORIES VARIABLES=PET G_edad PEA ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=PPA02 DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=etnicidad ORDER=A KEY=VALUE EMPTY=INCLUDE.


**************************************************************************************************************************************************
********************TABLA DE RESULTADOS PARA RESPONDER A CAPITULO  3 POBLACIÓN OCUPADA *********************
***************************************************************************************************************************************************.

CTABLES
  /VLABELS VARIABLES=PEA PPA02 etnicidad G_EDAD OCUPADOS P04C04B_1D P04C06 CONTRATO P04C32 P04C33 
    P04C34A P04C34B P04C34C P04C34D P04C34E P04C35A P04C35B P04C35C P04C35D P04C35E P04C35F P04C35G 
    P04C25A P04C14A P04C15A DOMINIO 
    DISPLAY=LABEL
  /TABLE PEA [C] > (PPA02 [C] + etnicidad [C] + G_EDAD [C]) + OCUPADOS [C] > (PPA02 [C] + etnicidad 
    [C] + G_EDAD [C] + P04C04B_1D [C] + P04C06 [C] + CONTRATO [C] + P04C32 [C] + P04C33 [C] + P04C34A 
    [C] + P04C34B [C] + P04C34C [C] + P04C34D [C] + P04C34E [C] + P04C35A [C] + P04C35B [C] + P04C35C 
    [C] + P04C35D [C] + P04C35E [C] + P04C35F [C] + P04C35G [C] + P04C25A [C] + P04C14A [C] + P04C15A 
    [C]) BY DOMINIO [C][COUNT F40.0]
  /CATEGORIES VARIABLES=PEA G_EDAD OCUPADOS ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=PPA02 etnicidad P04C04B_1D P04C06 CONTRATO P04C32 P04C33 P04C34A P04C34B 
    P04C34C P04C34D P04C34E P04C35A P04C35B P04C35C P04C35D P04C35E P04C35F P04C35G P04C25A P04C14A 
    P04C15A ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


***************************************************************************************************************************************************************************
**************ENERACION TABLA CON DATOS DEL CAPITULO 4 OCUPADOS SECTOR ECONOMICO****************************************************
***************************************************************************************************************************************************************************

filter off.

USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1).
VARIABLE LABELS filter_$ 'PPA03 >= 15 & PPA12 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=FORMAL_INFORMAL PPA02 etnicidad P04C04B_1D Dominio DISPLAY=LABEL
  /TABLE FORMAL_INFORMAL > (PPA02 [COUNT F40.0] + etnicidad [COUNT F40.0] + P04C04B_1D [COUNT 
    F40.0]) BY Dominio
  /CATEGORIES VARIABLES=FORMAL_INFORMAL PPA02 etnicidad P04C04B_1D ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Dominio ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.



************************************************************************************************************************************************************************************
**************************************************CAPITULO 5 POBLACION EN SUBEMPLEO VISIBLE*******************************************************************
************************************************************************************************************************************************************************************

****************PREVIO A LA TABLA SE DEBE FILTRAR LA BASE*************************

filter off.


USE ALL.
COMPUTE filter_$=(SUBVISIBLES = 1 & PPA03 >= 15 & PPA12 = 1).
VARIABLE LABELS filter_$ 'SUBVISIBLES = 1 & PPA03 >= 15 & PPA12 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=PPA02 etnicidad G_edad P04C04B_1D P04C06 DOMINIO DISPLAY=LABEL
  /TABLE PPA02 [C] + etnicidad [C] + G_edad [C] + P04C04B_1D [C] + P04C06 [C] BY DOMINIO [C][COUNT 
    F40.0]
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=etnicidad G_edad P04C04B_1D P04C06 ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


************************************************************************************************************************************************************************************
**************************************************CAPITULO 6 POBLACION DESEMPLEADA*******************************************************************************
************************************************************************************************************************************************************************************

****************PREVIO A LA TABLA SE DEBE FILTRAR LA BASE*************************

filter off.

USE ALL.
COMPUTE filter_$=(DESOCUPADOS = 1 & PPA03 >= 15 & PPA12 = 1).
VARIABLE LABELS filter_$ 'DESOCUPADOS = 1 & PPA03 >= 15 & PPA12 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


* Custom Tables.
CTABLES
  /VLABELS VARIABLES=PPA02 etnicidad G_edad TIEMPOBUSC DOMINIO DISPLAY=LABEL
  /TABLE PPA02 [C][COUNT F40.0] + etnicidad [C][COUNT F40.0] + G_edad [C][COUNT F40.0] + TIEMPOBUSC 
    [C][COUNT F40.0] BY DOMINIO [C]
  /CATEGORIES VARIABLES=PPA02 [1, 2, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=etnicidad G_edad TIEMPOBUSC ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO [1, 2, 3, OTHERNM] EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.


************************************************************************************************************************************************************************************
**************************************************CAPITULO 7 INGRESOS*****************************************************************************************************
************************************************************************************************************************************************************************************


filter off.


USE ALL.
COMPUTE filter_$=(PPA03 >= 15 & PPA12 = 1).
VARIABLE LABELS filter_$ 'PPA03 >= 15 & PPA12 = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.



* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=NYLAB_PU P04C02B_1D P04C04B_1D tipo_trab PPA02 Jornada DOMINIO YLAB_PUBLI 
    DISPLAY=LABEL
  /TABLE NYLAB_PU [C] + P04C02B_1D [C] + P04C04B_1D [C] + tipo_trab > (PPA02 + Jornada) BY DOMINIO 
    [C] > YLAB_PUBLI [S][MEAN]
  /CATEGORIES VARIABLES=NYLAB_PU ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
  /CATEGORIES VARIABLES=P04C02B_1D P04C04B_1D tipo_trab PPA02 Jornada ORDER=A KEY=VALUE 
    EMPTY=INCLUDE
  /CATEGORIES VARIABLES=DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=BEFORE.



************************************************************************************************************************************************************************************
**************************************************CAPITULO 8 POBLACION DESEMPLEADA*******************************************************************************.
************************************************************************************************************************************************************************************

*****************TRABAJO INFANTIL************************.

filter off.

USE ALL.
COMPUTE filter_$=(PPA12 = 1 & PPA03  >=  7 & PPA03 <= 14).
VARIABLE LABEL filter_$ 'PPA12 = 1 & PPA03  >=  7 & PPA03 <= 14 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


***AGRUPAR LOS GRUPOS ETNICOS POR INDIGENA Y NO INDIGENA**************************


* Tablas personalizadas.
CTABLES
  /VLABELS VARIABLES=PEA PPA02 etnicidad PET P04C02B_1D P04C04B_1D DOMINIO 
    DISPLAY=LABEL
  /TABLE PEA [C] > (PPA02 [C] + etnicidad [C]) + PET [C] > (PPA02 [C] + etnicidad [C]) + P04C02B_1D 
    [C] + P04C04B_1D [C] BY DOMINIO [C][COUNT F40.0]
  /CATEGORIES VARIABLES=PEA PET ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CATEGORIES VARIABLES=PPA02 etnicidad DOMINIO ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES 
    POSITION=BEFORE
  /CATEGORIES VARIABLES=P04C02B_1D P04C04B_1D ORDER=A KEY=VALUE EMPTY=INCLUDE.

