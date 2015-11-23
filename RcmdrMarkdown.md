<!-- R Commander Markdown Template -->

Replace with Main Title
=======================

### Your Name

### 2015-11-21




```r
> library(foreign, pos=15)
```


```r
> enei14 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2014.sav", 
+   use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
```

```
Warning in read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2014.sav",
use.value.labels = TRUE, : /mnt/datos/GitHub/unfpa/Bases/pesonas2014.sav:
Unrecognized record type 7, subtype 18 encountered in system file
```

```
Warning in read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2014.sav",
use.value.labels = TRUE, : /mnt/datos/GitHub/unfpa/Bases/pesonas2014.sav:
Unrecognized record type 7, subtype 24 encountered in system file
```

```r
> colnames(enei14) <- tolower(colnames(enei14))
```


```r
> enei13 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2013.sav", 
+   use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
```

```
Warning in read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2013.sav",
use.value.labels = TRUE, : /mnt/datos/GitHub/unfpa/Bases/personas2013.sav:
Unrecognized record type 7, subtype 18 encountered in system file
```

```
Warning in read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2013.sav",
use.value.labels = TRUE, : /mnt/datos/GitHub/unfpa/Bases/personas2013.sav:
Unrecognized record type 7, subtype 24 encountered in system file
```

```
re-encoding from CP1252
```

```
Warning in `levels<-`(`*tmp*`, value = if (nl == nL) as.character(labels)
else paste0(labels, : duplicated levels in factors are deprecated
```

```r
> colnames(enei13) <- tolower(colnames(enei13))
```


```r
> enei12 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2012.sav", 
+   use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
```

```
Warning in read.spss("/mnt/datos/GitHub/unfpa/Bases/personas2012.sav",
use.value.labels = TRUE, : /mnt/datos/GitHub/unfpa/Bases/personas2012.sav:
Unrecognized record type 7, subtype 18 encountered in system file
```

```
re-encoding from CP1252
```

```
Warning in `levels<-`(`*tmp*`, value = if (nl == nL) as.character(labels)
else paste0(labels, : duplicated levels in factors are deprecated
```

```r
> colnames(enei12) <- tolower(colnames(enei12))
```


```r
> enei11 <- read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2011.sav", 
+   use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
```

```
Warning in read.spss("/mnt/datos/GitHub/unfpa/Bases/pesonas2011.sav",
use.value.labels = TRUE, : /mnt/datos/GitHub/unfpa/Bases/pesonas2011.sav:
Unrecognized record type 7, subtype 18 encountered in system file
```

```
re-encoding from CP1252
```

```r
> colnames(enei11) <- tolower(colnames(enei11))
```


```r
> library(abind, pos=17)
```


```r
> summary(enei11)
```

```
                 dominio         region          area         formulario  
 URBANO METROPOLITANO:4483   Min.   :1.00   Min.   :1.000   Min.   :  11  
 RESTO URBANO        :5570   1st Qu.:1.00   1st Qu.:1.000   1st Qu.:1065  
 RURAL               :7808   Median :5.00   Median :1.000   Median :2136  
                             Mean   :4.17   Mean   :1.437   Mean   :2185  
                             3rd Qu.:6.00   3rd Qu.:2.000   3rd Qu.:3403  
                             Max.   :8.00   Max.   :2.000   Max.   :4490  
                                                                          
   factor_exp          sexo           edad            dia       
 Min.   :  81.54   HOMBRE:8765   Min.   : 0.00   Min.   : 1.00  
 1st Qu.: 528.15   MUJER :9096   1st Qu.: 9.00   1st Qu.: 8.00  
 Median : 716.25                 Median :20.00   Median :15.00  
 Mean   : 817.93                 Mean   :24.96   Mean   :15.69  
 3rd Qu.: 980.33                 3rd Qu.:37.00   3rd Qu.:23.00  
 Max.   :4778.40                 Max.   :97.00   Max.   :31.00  
                                 NA's   :6       NA's   :12     
      mes              año           ppa06            ppa07      
 Min.   : 1.000   Min.   :1914   Min.   : 1.000   Min.   :0.000  
 1st Qu.: 3.000   1st Qu.:1974   1st Qu.: 2.000   1st Qu.:3.000  
 Median : 6.000   Median :1991   Median : 3.000   Median :3.000  
 Mean   : 6.333   Mean   :1986   Mean   : 2.941   Mean   :3.715  
 3rd Qu.: 9.000   3rd Qu.:2002   3rd Qu.: 3.000   3rd Qu.:5.000  
 Max.   :12.000   Max.   :2011   Max.   :13.000   Max.   :5.000  
 NA's   :12       NA's   :6      NA's   :7        NA's   :17     
       ppa08           ppa09                    ppa10     
 k´iche´  : 1708   Min.   : 1.00   Menor de 12 años:5413  
 Kaqchikel: 1578   1st Qu.:17.00   Soltero         :4886  
 Mam      :  762   Median :25.00   Casado(a)       :4168  
 Q´eqchi´ :  607   Mean   :23.77   Unido(a)        :2243  
 Español  :  538   3rd Qu.:25.00   Viudo (a)       : 562  
 (Other)  : 1234   Max.   :98.00   (Other)         : 578  
 NA's     :11434   NA's   :13      NA's            :  11  
         ppa11           ppa12           ppa13           p03a01     
 Completa   :17770   Min.   :1.000   Min.   :2.000   Min.   :0.000  
 Incompleta :   47   1st Qu.:1.000   1st Qu.:2.000   1st Qu.:1.000  
 Con rechazo:   23   Median :1.000   Median :2.000   Median :1.000  
 Ausente    :   21   Mean   :1.244   Mean   :2.462   Mean   :1.177  
 Otro       :    0   3rd Qu.:1.000   3rd Qu.:2.000   3rd Qu.:1.000  
                     Max.   :2.000   Max.   :7.000   Max.   :2.000  
                     NA's   :17816   NA's   :17848   NA's   :3111   
     p03a02          p03a03               po3a04a         po3a04b      
 Min.   :0.000   Min.   :1.000   Primaria     : 3028   Min.   :0.0000  
 1st Qu.:1.000   1st Qu.:1.000   Básico       :  955   1st Qu.:0.0000  
 Median :2.000   Median :1.000   Diversificado:  477   Median :0.0000  
 Mean   :1.664   Mean   :1.212   Superior     :  383   Mean   :0.7965  
 3rd Qu.:2.000   3rd Qu.:1.000   Preprimaria  :   74   3rd Qu.:1.0000  
 Max.   :4.000   Max.   :6.000   (Other)      :    9   Max.   :7.0000  
 NA's   :3113    NA's   :12918   NA's         :12935                   
          po3a05a        po3a05b         p03a06b           p04a01      
 Primaria     :7596   Min.   :0.000   Min.   :   0.0   Min.   : 1.000  
 Ninguno      :5637   1st Qu.:0.000   1st Qu.:   1.0   1st Qu.: 1.000  
 Diversificado:1854   Median :2.000   Median :   2.0   Median : 2.000  
 Básico       :1644   Mean   :2.249   Mean   : 212.4   Mean   : 2.527  
 Superior     : 577   3rd Qu.:4.000   3rd Qu.: 142.0   3rd Qu.: 3.000  
 Preprimaria  : 541   Max.   :7.000   Max.   :9999.0   Max.   :14.000  
 (Other)      :  12                   NA's   :11380    NA's   :3154    
     p04a02           p04a03          p04a04          p04a05     
 Min.   : 1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
 1st Qu.: 1.000   1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
 Median : 3.000   Median :2.000   Median :2.000   Median :2.000  
 Mean   : 3.294   Mean   :1.973   Mean   :1.977   Mean   :1.959  
 3rd Qu.: 4.000   3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:2.000  
 Max.   :98.000   Max.   :6.000   Max.   :2.000   Max.   :2.000  
 NA's   :3148     NA's   :9249    NA's   :9492    NA's   :9686   
     p04a06          p04a07          p04a08          p04a09     
 Min.   :1.000   Min.   : 1.00   Min.   :1.000   Min.   :2.000  
 1st Qu.:2.000   1st Qu.: 3.50   1st Qu.:2.000   1st Qu.:5.000  
 Median :2.000   Median : 6.00   Median :2.000   Median :5.000  
 Mean   :1.994   Mean   :20.02   Mean   :1.857   Mean   :4.833  
 3rd Qu.:2.000   3rd Qu.: 9.75   3rd Qu.:2.000   3rd Qu.:5.000  
 Max.   :2.000   Max.   :98.00   Max.   :2.000   Max.   :6.000  
 NA's   :10022   NA's   :17811   NA's   :17826   NA's   :17831  
     p04b01          p04b02          p04b03          p04b04     
 Min.   :1.000   Min.   :1.000   Min.   : 1.00   Min.   : 1.00  
 1st Qu.:2.000   1st Qu.:2.000   1st Qu.: 1.00   1st Qu.:14.00  
 Median :2.000   Median :2.000   Median : 4.00   Median :17.00  
 Mean   :1.965   Mean   :1.994   Mean   : 3.81   Mean   :15.94  
 3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.: 4.00   3rd Qu.:17.00  
 Max.   :2.000   Max.   :2.000   Max.   :98.00   Max.   :98.00  
 NA's   :10046   NA's   :10312   NA's   :17550   NA's   :10362  
     p04b05          p04c01         p04c02b         p04c02br    
 Min.   :1.000   Min.   :1.000   Min.   : 1.00   Min.   :0.000  
 1st Qu.:2.000   1st Qu.:1.000   1st Qu.:51.00   1st Qu.:5.000  
 Median :2.000   Median :1.000   Median :61.00   Median :6.000  
 Mean   :1.858   Mean   :1.105   Mean   :63.62   Mean   :6.133  
 3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:92.00   3rd Qu.:9.000  
 Max.   :7.000   Max.   :6.000   Max.   :96.00   Max.   :9.000  
 NA's   :17536   NA's   :10955   NA's   :10962   NA's   :10962  
    p04c04b          p04c05            p04c06          p04c07     
 Min.   : 1.00   Min.   :    0.0   Min.   :1.000   Min.   :1.000  
 1st Qu.: 1.00   1st Qu.:    2.0   1st Qu.:2.000   1st Qu.:1.000  
 Median :33.00   Median :    3.0   Median :3.000   Median :2.000  
 Mean   :33.94   Mean   :  236.5   Mean   :4.228   Mean   :1.646  
 3rd Qu.:49.00   3rd Qu.:   15.0   3rd Qu.:7.000   3rd Qu.:2.000  
 Max.   :99.00   Max.   :80000.0   Max.   :9.000   Max.   :2.000  
 NA's   :10962   NA's   :11008     NA's   :10962   NA's   :13960  
    p04c08a         p04c08b          p04c08c          p04c09a     
 Min.   :1.000   Min.   :  0.00   Min.   : 0.000   Min.   :1.000  
 1st Qu.:1.000   1st Qu.:  6.00   1st Qu.: 0.000   1st Qu.:2.000  
 Median :1.000   Median : 12.00   Median : 0.000   Median :2.000  
 Mean   :1.209   Mean   : 10.84   Mean   : 0.595   Mean   :1.901  
 3rd Qu.:1.000   3rd Qu.: 12.00   3rd Qu.: 0.000   3rd Qu.:2.000  
 Max.   :4.000   Max.   :240.00   Max.   :22.000   Max.   :2.000  
 NA's   :16480   NA's   :17585    NA's   :17713    NA's   :13960  
    p04c09b          p04c10          p04c11a         p04c11b      
 Min.   :1.00    Min.   :     0   Min.   :1.000   Min.   :  0.00  
 1st Qu.:1.00    1st Qu.:   840   1st Qu.:2.000   1st Qu.:  8.00  
 Median :2.00    Median :  1500   Median :2.000   Median : 18.00  
 Mean   :1.71    Mean   :  1957   Mean   :1.943   Mean   : 29.13  
 3rd Qu.:2.00    3rd Qu.:  2291   3rd Qu.:2.000   3rd Qu.: 34.00  
 Max.   :2.00    Max.   :193734   Max.   :2.000   Max.   :800.00  
 NA's   :17471   NA's   :13961    NA's   :13960   NA's   :17655   
    p04c11c          p04c12a         p04c12b         p04c13a     
 Min.   :   2.0   Min.   :1.000   Min.   :   1    Min.   :1.000  
 1st Qu.: 150.0   1st Qu.:2.000   1st Qu.: 300    1st Qu.:2.000  
 Median : 300.0   Median :2.000   Median : 800    Median :2.000  
 Mean   : 408.2   Mean   :1.967   Mean   :1309    Mean   :2.146  
 3rd Qu.: 500.0   3rd Qu.:2.000   3rd Qu.:1834    3rd Qu.:2.000  
 Max.   :4000.0   Max.   :2.000   Max.   :7000    Max.   :3.000  
 NA's   :17636    NA's   :13960   NA's   :17735   NA's   :13960  
    p04c13b         p04c14a         p04c14b         p04c15a     
 Min.   :   0    Min.   :1.00    Min.   :    0   Min.   :1.000  
 1st Qu.: 860    1st Qu.:1.00    1st Qu.: 1600   1st Qu.:1.000  
 Median :1500    Median :2.00    Median : 2100   Median :2.000  
 Mean   :1656    Mean   :1.67    Mean   : 2635   Mean   :1.659  
 3rd Qu.:2200    3rd Qu.:2.00    3rd Qu.: 3000   3rd Qu.:2.000  
 Max.   :6500    Max.   :2.00    Max.   :30000   Max.   :2.000  
 NA's   :17740   NA's   :13960   NA's   :16574   NA's   :13960  
    p04c15b         p04c16a         p04c16b         p04c17a     
 Min.   :    0   Min.   :1.000   Min.   :    2   Min.   :1.00   
 1st Qu.: 1600   1st Qu.:2.000   1st Qu.:  250   1st Qu.:2.00   
 Median : 2100   Median :2.000   Median : 1000   Median :2.00   
 Mean   : 2609   Mean   :1.938   Mean   : 1613   Mean   :1.99   
 3rd Qu.: 3000   3rd Qu.:2.000   3rd Qu.: 2000   3rd Qu.:2.00   
 Max.   :36000   Max.   :2.000   Max.   :30000   Max.   :2.00   
 NA's   :16533   NA's   :13961   NA's   :17622   NA's   :13960  
    p04c17b         p04c18a         p04c18b          p04c19a     
 Min.   :    0   Min.   :1.000   Min.   :   2.0   Min.   :1.000  
 1st Qu.: 2000   1st Qu.:2.000   1st Qu.: 200.0   1st Qu.:2.000  
 Median : 3550   Median :2.000   Median : 300.0   Median :2.000  
 Mean   : 4112   Mean   :1.914   Mean   : 447.9   Mean   :1.971  
 3rd Qu.: 5000   3rd Qu.:2.000   3rd Qu.: 600.0   3rd Qu.:2.000  
 Max.   :18869   Max.   :2.000   Max.   :2625.0   Max.   :2.000  
 NA's   :17823   NA's   :13960   NA's   :17530    NA's   :13960  
    p04c19b          p04c20a         p04c20b          p04c21a     
 Min.   :  30.0   Min.   :1.000   Min.   :  20.0   Min.   :1.00   
 1st Qu.: 200.0   1st Qu.:2.000   1st Qu.: 160.0   1st Qu.:2.00   
 Median : 312.5   Median :2.000   Median : 300.0   Median :2.00   
 Mean   : 471.3   Mean   :1.977   Mean   : 510.8   Mean   :1.98   
 3rd Qu.: 575.0   3rd Qu.:2.000   3rd Qu.: 500.0   3rd Qu.:2.00   
 Max.   :2800.0   Max.   :2.000   Max.   :6600.0   Max.   :2.00   
 NA's   :17747    NA's   :13960   NA's   :17772    NA's   :13961  
    p04c21b          p04c22           p04c23            p04c24a     
 Min.   :   48   Min.   : -4200   Min.   :-40000.0   Min.   :0.000  
 1st Qu.:  250   1st Qu.:   517   1st Qu.:   129.0   1st Qu.:2.000  
 Median :  500   Median :  1200   Median :   282.0   Median :2.000  
 Mean   : 1472   Mean   :  2403   Mean   :  1079.4   Mean   :1.916  
 3rd Qu.: 1200   3rd Qu.:  2500   3rd Qu.:   685.5   3rd Qu.:2.000  
 Max.   :12000   Max.   :141525   Max.   : 54166.0   Max.   :2.000  
 NA's   :17785   NA's   :16648    NA's   :17018      NA's   :15803  
    p04c24b           p04c25a         p04c25b            p04c26a     
 Min.   :   1.00   Min.   :1.000   Min.   :     0.0   Min.   :1.000  
 1st Qu.:   1.00   1st Qu.:2.000   1st Qu.:    83.0   1st Qu.:2.000  
 Median :   2.00   Median :4.000   Median :   101.0   Median :2.000  
 Mean   :  43.45   Mean   :3.211   Mean   :   320.3   Mean   :1.944  
 3rd Qu.:   3.75   3rd Qu.:4.000   3rd Qu.:   150.0   3rd Qu.:2.000  
 Max.   :3800.00   Max.   :4.000   Max.   :120750.0   Max.   :4.000  
 NA's   :17687     NA's   :10962   NA's   :16635      NA's   :10969  
    p04c26b          p04c27          p04c28a          p04c28b      
 Min.   :1.000   Min.   : 1.000   Min.   : 0.000   Min.   : 0.000  
 1st Qu.:1.000   1st Qu.: 1.000   1st Qu.: 5.000   1st Qu.: 5.000  
 Median :2.000   Median : 6.000   Median : 8.000   Median : 8.000  
 Mean   :1.631   Mean   : 5.067   Mean   : 7.231   Mean   : 7.043  
 3rd Qu.:2.000   3rd Qu.: 7.000   3rd Qu.: 8.000   3rd Qu.: 8.000  
 Max.   :8.000   Max.   :98.000   Max.   :24.000   Max.   :24.000  
 NA's   :17465   NA's   :10963    NA's   :10966    NA's   :10967   
    p04c28c          p04c28d          p04c28e          p04c28f      
 Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
 1st Qu.: 5.000   1st Qu.: 5.000   1st Qu.: 5.000   1st Qu.: 0.000  
 Median : 8.000   Median : 8.000   Median : 8.000   Median : 5.000  
 Mean   : 7.193   Mean   : 7.027   Mean   : 7.132   Mean   : 5.024  
 3rd Qu.: 8.000   3rd Qu.: 8.000   3rd Qu.: 8.000   3rd Qu.: 8.000  
 Max.   :24.000   Max.   :24.000   Max.   :24.000   Max.   :24.000  
 NA's   :10965    NA's   :10966    NA's   :10966    NA's   :10972   
    p04c28g           p04c29          p04c30a          p04c30b      
 Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
 1st Qu.: 0.000   1st Qu.: 1.000   1st Qu.: 2.000   1st Qu.: 0.000  
 Median : 0.000   Median : 1.000   Median : 5.000   Median : 0.000  
 Mean   : 1.878   Mean   : 2.396   Mean   : 9.424   Mean   : 1.651  
 3rd Qu.: 0.000   3rd Qu.: 1.000   3rd Qu.:12.000   3rd Qu.: 3.000  
 Max.   :24.000   Max.   :98.000   Max.   :80.000   Max.   :25.000  
 NA's   :10995    NA's   :10971    NA's   :11401    NA's   :13434   
     p04d01         p04d02b         p04d02br        p04d04a     
 Min.   :1.000   Min.   :12.00   Min.   :1.000   Min.   : 1.00  
 1st Qu.:2.000   1st Qu.:55.75   1st Qu.:5.250   1st Qu.: 1.00  
 Median :2.000   Median :61.00   Median :6.000   Median : 1.00  
 Mean   :1.899   Mean   :58.92   Mean   :5.709   Mean   :18.59  
 3rd Qu.:2.000   3rd Qu.:63.00   3rd Qu.:6.000   3rd Qu.:43.00  
 Max.   :2.000   Max.   :97.00   Max.   :9.000   Max.   :97.00  
 NA's   :10963   NA's   :17167   NA's   :17167   NA's   :17167  
     p04d05          p04d06         p04d07a         p04d07b      
 Min.   :1.00    Min.   :  90    Min.   :1.000   Min.   : 35.00  
 1st Qu.:5.00    1st Qu.: 355    1st Qu.:2.000   1st Qu.: 90.75  
 Median :7.00    Median : 600    Median :2.000   Median :200.00  
 Mean   :6.02    Mean   :1031    Mean   :1.885   Mean   :230.08  
 3rd Qu.:7.00    3rd Qu.:1050    3rd Qu.:2.000   3rd Qu.:262.50  
 Max.   :9.00    Max.   :8000    Max.   :2.000   Max.   :900.00  
 NA's   :17167   NA's   :17742   NA's   :17739   NA's   :17849   
    p04d08a         p04d08b         p04d09a      p04d09b      p04d10a     
 Min.   :1.000   Min.   : 500    Min.   :2        :17861   Min.   :1.000  
 1st Qu.:2.000   1st Qu.:1175    1st Qu.:2                 1st Qu.:2.000  
 Median :2.000   Median :2700    Median :2                 Median :2.000  
 Mean   :1.967   Mean   :2725    Mean   :2                 Mean   :1.893  
 3rd Qu.:2.000   3rd Qu.:4250    3rd Qu.:2                 3rd Qu.:2.000  
 Max.   :2.000   Max.   :5000    Max.   :2                 Max.   :2.000  
 NA's   :17739   NA's   :17857   NA's   :17739             NA's   :17739  
    p04d10b         p04d11a         p04d11b          p04d12       
 Min.   : 900    Min.   :1.000   Min.   :   1    Min.   :-3200.0  
 1st Qu.:1800    1st Qu.:2.000   1st Qu.:1100    1st Qu.:  207.5  
 Median :2500    Median :2.000   Median :1800    Median :  600.0  
 Mean   :2531    Mean   :1.885   Mean   :2146    Mean   : 1177.0  
 3rd Qu.:2900    3rd Qu.:2.000   3rd Qu.:2800    3rd Qu.: 1412.5  
 Max.   :5000    Max.   :2.000   Max.   :5000    Max.   :10600.0  
 NA's   :17848   NA's   :17739   NA's   :17848   NA's   :17721    
     p04d13            p04d14a         p04d14b          p04d15       
 Min.   : -421.00   Min.   :1.000   Min.   :1.000   Min.   :  -97.0  
 1st Qu.:   51.25   1st Qu.:2.000   1st Qu.:1.000   1st Qu.:    1.0  
 Median :  145.00   Median :2.000   Median :2.000   Median :    2.0  
 Mean   :  606.12   Mean   :1.948   Mean   :2.452   Mean   :  143.3  
 3rd Qu.:  320.00   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:    3.0  
 Max.   :47950.00   Max.   :2.000   Max.   :8.000   Max.   :80000.0  
 NA's   :17499      NA's   :17358   NA's   :17830   NA's   :17173    
     p04d16         p04d17a         p04d17b           p04e01     
 Min.   : 0.00   Min.   : 0.00   Min.   : 0.000   Min.   :1.000  
 1st Qu.: 8.00   1st Qu.: 3.00   1st Qu.: 0.000   1st Qu.:2.000  
 Median :12.00   Median :10.00   Median : 0.000   Median :2.000  
 Mean   :14.33   Mean   :13.42   Mean   : 1.254   Mean   :1.784  
 3rd Qu.:20.00   3rd Qu.:20.00   3rd Qu.: 0.000   3rd Qu.:2.000  
 Max.   :70.00   Max.   :60.00   Max.   :30.000   Max.   :2.000  
 NA's   :17169   NA's   :17185   NA's   :17522    NA's   :10964  
    p04e02a         p04e02b         p04e02c          p04e03      
 Min.   :1.000   Min.   :0.000   Min.   :0.000   Min.   :  0.00  
 1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.: 10.00  
 Median :1.000   Median :2.000   Median :2.000   Median : 15.00  
 Mean   :1.485   Mean   :1.509   Mean   :1.559   Mean   : 17.27  
 3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.: 20.00  
 Max.   :3.000   Max.   :3.000   Max.   :3.000   Max.   :360.00  
 NA's   :16388   NA's   :16400   NA's   :16406   NA's   :16369   
     p04e04          p04e05          p04e06         p04e07a     
 Min.   :1.00    Min.   :1.000   Min.   :1.000   Min.   :0.000  
 1st Qu.:1.00    1st Qu.:1.000   1st Qu.:2.000   1st Qu.:1.000  
 Median :2.00    Median :1.000   Median :2.000   Median :2.000  
 Mean   :1.66    Mean   :1.133   Mean   :1.772   Mean   :2.276  
 3rd Qu.:2.00    3rd Qu.:1.000   3rd Qu.:2.000   3rd Qu.:3.000  
 Max.   :2.00    Max.   :2.000   Max.   :2.000   Max.   :7.000  
 NA's   :16371   NA's   :16367   NA's   :10964   NA's   :16285  
    p04e07b          p04e08           p04e09          p04e10     
 Min.   :0.000   Min.   : 1.000   Min.   :1.000   Min.   :1.000  
 1st Qu.:3.000   1st Qu.: 2.000   1st Qu.:2.000   1st Qu.:1.000  
 Median :6.000   Median : 2.000   Median :2.000   Median :1.000  
 Mean   :4.555   Mean   : 3.096   Mean   :1.854   Mean   :1.124  
 3rd Qu.:6.000   3rd Qu.: 2.000   3rd Qu.:2.000   3rd Qu.:1.000  
 Max.   :7.000   Max.   :98.000   Max.   :2.000   Max.   :2.000  
 NA's   :17319   NA's   :16285    NA's   :16283   NA's   :16283  
     p04f01         p04f02b         p04f02br         p04f03     
 Min.   : 0.00   Min.   : 1.00   Min.   :0.000   Min.   :1.00   
 1st Qu.: 3.00   1st Qu.:41.00   1st Qu.:4.000   1st Qu.:1.00   
 Median : 5.00   Median :52.00   Median :5.000   Median :1.00   
 Mean   :25.33   Mean   :58.33   Mean   :5.579   Mean   :1.21   
 3rd Qu.:24.00   3rd Qu.:91.00   3rd Qu.:9.000   3rd Qu.:1.00   
 Max.   :97.00   Max.   :97.00   Max.   :9.000   Max.   :2.00   
 NA's   :17594   NA's   :17600   NA's   :17600   NA's   :17594  
     p04f04         p04f05a          p04f05b         p04f05c     
 Min.   :1.000   Min.   :  0.00   Min.   : 0.00   Min.   : 0.00  
 1st Qu.:1.000   1st Qu.:  0.00   1st Qu.: 0.00   1st Qu.: 0.00  
 Median :2.000   Median :  8.00   Median :10.00   Median :30.00  
 Mean   :2.468   Mean   : 22.64   Mean   :11.67   Mean   :18.29  
 3rd Qu.:5.000   3rd Qu.: 30.00   3rd Qu.:15.00   3rd Qu.:30.00  
 Max.   :5.000   Max.   :400.00   Max.   :70.00   Max.   :90.00  
 NA's   :17594   NA's   :17594    NA's   :17594   NA's   :17595  
    p04f05d         p04f05e         p04f05f          p04f05g      
 Min.   : 0.00   Min.   : 0.00   Min.   :  0.00   Min.   :  0.00  
 1st Qu.: 0.00   1st Qu.: 0.00   1st Qu.: 15.00   1st Qu.:  0.00  
 Median :15.00   Median : 0.00   Median : 32.00   Median :  0.00  
 Mean   :10.41   Mean   :14.77   Mean   : 55.46   Mean   : 22.33  
 3rd Qu.:15.00   3rd Qu.:30.00   3rd Qu.: 80.00   3rd Qu.: 10.00  
 Max.   :46.00   Max.   :70.00   Max.   :400.00   Max.   :300.00  
 NA's   :17596   NA's   :17595   NA's   :17594    NA's   :17608   
     p04f06         p04f07b          p04f08         p04f09b     
 Min.   :1.00    Min.   : 1.00   Min.   : 1.00   Min.   : 1.00  
 1st Qu.:1.00    1st Qu.:42.00   1st Qu.: 3.00   1st Qu.:10.00  
 Median :2.00    Median :71.00   Median : 8.00   Median :41.00  
 Mean   :1.67    Mean   :61.51   Mean   :30.58   Mean   :40.49  
 3rd Qu.:2.00    3rd Qu.:91.00   3rd Qu.:48.00   3rd Qu.:64.00  
 Max.   :2.00    Max.   :97.00   Max.   :97.00   Max.   :97.00  
 NA's   :17594   NA's   :17687   NA's   :17683   NA's   :17687  
     p04f10           p04f11            p04f12          p04f13     
 Min.   : 1.000   Min.   :    1.0   Min.   :1.00    Min.   :  75   
 1st Qu.: 2.000   1st Qu.:    8.0   1st Qu.:2.00    1st Qu.: 800   
 Median : 4.000   Median :   30.0   Median :2.00    Median :1500   
 Mean   : 7.275   Mean   :  587.5   Mean   :2.27    Mean   :1618   
 3rd Qu.: 7.000   3rd Qu.:  250.0   3rd Qu.:2.00    3rd Qu.:2000   
 Max.   :98.000   Max.   :35000.0   Max.   :6.00    Max.   :7000   
 NA's   :17683    NA's   :17683     NA's   :17683   NA's   :17688  
     p04g01          p04g02          p04g03          p04g04     
 Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
 1st Qu.:2.000   1st Qu.:1.000   1st Qu.:3.000   1st Qu.:2.000  
 Median :2.000   Median :2.000   Median :5.000   Median :2.000  
 Mean   :1.759   Mean   :1.672   Mean   :4.554   Mean   :1.977  
 3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:6.000   3rd Qu.:2.000  
 Max.   :2.000   Max.   :2.000   Max.   :8.000   Max.   :2.000  
 NA's   :10300   NA's   :16043   NA's   :16047   NA's   :12105  
    p04g05a         p04g05b         p04g05c         p04g05d     
 Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
 1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
 Median :2.000   Median :2.000   Median :2.000   Median :2.000  
 Mean   :1.974   Mean   :1.991   Mean   :1.985   Mean   :1.996  
 3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:2.000  
 Max.   :3.000   Max.   :2.000   Max.   :2.000   Max.   :2.000  
 NA's   :10301   NA's   :10301   NA's   :10301   NA's   :10301  
    p04g05e         p04g05f         p04g05g         p04g05h     
 Min.   :1.000   Min.   :1.00    Min.   :1.000   Min.   :1.000  
 1st Qu.:2.000   1st Qu.:1.00    1st Qu.:2.000   1st Qu.:2.000  
 Median :2.000   Median :1.00    Median :2.000   Median :2.000  
 Mean   :1.994   Mean   :1.04    Mean   :1.978   Mean   :1.996  
 3rd Qu.:2.000   3rd Qu.:1.00    3rd Qu.:2.000   3rd Qu.:2.000  
 Max.   :2.000   Max.   :6.00    Max.   :2.000   Max.   :2.000  
 NA's   :10301   NA's   :10300   NA's   :10301   NA's   :10302  
    p04g05i         p05a01a        p05a01b         p05a02a     
 Min.   :0.000   Min.   :1.00   Min.   :    2   Min.   :1.000  
 1st Qu.:2.000   1st Qu.:2.00   1st Qu.:  900   1st Qu.:2.000  
 Median :2.000   Median :2.00   Median : 2050   Median :2.000  
 Mean   :1.998   Mean   :1.99   Mean   : 3180   Mean   :1.999  
 3rd Qu.:2.000   3rd Qu.:2.00   3rd Qu.: 3225   3rd Qu.:2.000  
 Max.   :2.000   Max.   :2.00   Max.   :42000   Max.   :2.000  
 NA's   :10494   NA's   :3156   NA's   :17719   NA's   :3156   
    p05a02b         p05a03a         p05a03b           p05a04a     
 Min.   :   26   Min.   :1.000   Min.   :    2.0   Min.   :1.000  
 1st Qu.:  600   1st Qu.:2.000   1st Qu.:  300.0   1st Qu.:2.000  
 Median :  600   Median :2.000   Median :  600.0   Median :2.000  
 Mean   : 3940   Mean   :1.933   Mean   :  699.4   Mean   :1.993  
 3rd Qu.: 2500   3rd Qu.:2.000   3rd Qu.:  600.0   3rd Qu.:2.000  
 Max.   :45000   Max.   :2.000   Max.   :15000.0   Max.   :2.000  
 NA's   :17840   NA's   :3156    NA's   :16871     NA's   :3156   
    p05a04b         p05a05a         p05a05b         p05a06a     
 Min.   : 200    Min.   :1.000   Min.   :    0   Min.   :1.000  
 1st Qu.: 900    1st Qu.:2.000   1st Qu.: 1200   1st Qu.:2.000  
 Median :1500    Median :2.000   Median : 2850   Median :2.000  
 Mean   :2149    Mean   :1.986   Mean   : 3821   Mean   :1.998  
 3rd Qu.:2400    3rd Qu.:2.000   3rd Qu.: 4800   3rd Qu.:2.000  
 Max.   :8400    Max.   :2.000   Max.   :16611   Max.   :2.000  
 NA's   :17764   NA's   :3156    NA's   :17654   NA's   :3156   
    p05a06b           p05a07a        p05a07b         p05a08a    
 Min.   :   25.0   Min.   :1      Min.   :300     Min.   :1     
 1st Qu.:   85.0   1st Qu.:2      1st Qu.:375     1st Qu.:2     
 Median :  177.5   Median :2      Median :450     Median :2     
 Mean   : 1917.3   Mean   :2      Mean   :450     Mean   :2     
 3rd Qu.:  450.0   3rd Qu.:2      3rd Qu.:525     3rd Qu.:2     
 Max.   :24000.0   Max.   :2      Max.   :600     Max.   :2     
 NA's   :17827     NA's   :3156   NA's   :17859   NA's   :3156  
    p05a08b         p05a09a         p05a09b         p05a10a     
 Min.   :2000    Min.   :1.000   Min.   :  400   Min.   :1.000  
 1st Qu.:2250    1st Qu.:2.000   1st Qu.: 3000   1st Qu.:2.000  
 Median :2500    Median :2.000   Median : 6000   Median :2.000  
 Mean   :3900    Mean   :1.998   Mean   :10427   Mean   :1.999  
 3rd Qu.:4850    3rd Qu.:2.000   3rd Qu.:13000   3rd Qu.:2.000  
 Max.   :7200    Max.   :2.000   Max.   :40000   Max.   :2.000  
 NA's   :17858   NA's   :3156    NA's   :17828   NA's   :3156   
    p05a10b         p05a11a         p05a11b          p05a12a     
 Min.   :  200   Min.   :1.000   Min.   :     3   Min.   :1.000  
 1st Qu.:  350   1st Qu.:2.000   1st Qu.:   525   1st Qu.:2.000  
 Median : 1650   Median :2.000   Median :  1900   Median :2.000  
 Mean   : 2800   Mean   :1.999   Mean   : 41029   Mean   :1.999  
 3rd Qu.: 3000   3rd Qu.:2.000   3rd Qu.: 30500   3rd Qu.:2.000  
 Max.   :14000   Max.   :2.000   Max.   :200000   Max.   :2.000  
 NA's   :17847   NA's   :3156    NA's   :17847    NA's   :3156   
    p05a12b         p05a13a        p05a13b         p05a14a     
 Min.   :  200   Min.   :2      Min.   :20000   Min.   :1.000  
 1st Qu.: 1000   1st Qu.:2      1st Qu.:20000   1st Qu.:2.000  
 Median : 8000   Median :2      Median :20000   Median :2.000  
 Mean   : 9716   Mean   :2      Mean   :20000   Mean   :1.986  
 3rd Qu.:13000   3rd Qu.:2      3rd Qu.:20000   3rd Qu.:2.000  
 Max.   :48000   Max.   :2      Max.   :20000   Max.   :2.000  
 NA's   :17842   NA's   :3156   NA's   :17860   NA's   :3157   
    p05a14b          p05a15a         p05a15b         p05a16a     
 Min.   :  -250   Min.   :1.000   Min.   :   11   Min.   :1.000  
 1st Qu.:   300   1st Qu.:2.000   1st Qu.: 1000   1st Qu.:2.000  
 Median :   800   Median :2.000   Median : 2800   Median :2.000  
 Mean   :  5486   Mean   :1.984   Mean   : 5107   Mean   :1.988  
 3rd Qu.:  2350   3rd Qu.:2.000   3rd Qu.: 7030   3rd Qu.:2.000  
 Max.   :150000   Max.   :2.000   Max.   :40000   Max.   :2.000  
 NA's   :17663    NA's   :3157    NA's   :17631   NA's   :3157   
    p05a16b          p05a17         p05a18a          p05a18b     
 Min.   :    1   Min.   :1.000   Min.   : 1.000   Min.   :    0  
 1st Qu.: 1100   1st Qu.:2.000   1st Qu.: 3.000   1st Qu.:  300  
 Median : 2500   Median :2.000   Median : 4.000   Median :  750  
 Mean   : 4172   Mean   :1.977   Mean   : 3.795   Mean   : 1130  
 3rd Qu.: 5000   3rd Qu.:2.000   3rd Qu.: 4.000   3rd Qu.: 1500  
 Max.   :29500   Max.   :2.000   Max.   :22.000   Max.   :11400  
 NA's   :17684   NA's   :3159    NA's   :17529    NA's   :17537  
    p05a19a         p05a19b         p05a20a         p05a20b     
 Min.   :1.000   Min.   :    0   Min.   :0.000   Min.   :    0  
 1st Qu.:4.000   1st Qu.:  300   1st Qu.:5.000   1st Qu.:  400  
 Median :5.000   Median :  780   Median :6.000   Median :  800  
 Mean   :4.591   Mean   : 1089   Mean   :5.427   Mean   : 1180  
 3rd Qu.:5.000   3rd Qu.: 1500   3rd Qu.:6.000   3rd Qu.: 1500  
 Max.   :7.000   Max.   :13680   Max.   :7.000   Max.   :16720  
 NA's   :17541   NA's   :17548   NA's   :17561   NA's   :17568  
    p05a21a         p05a21b           p08a01a         p08a01b     
 Min.   :0.000   Min.   :    0.0   Min.   : 0.0    Min.   : 0.00  
 1st Qu.:2.000   1st Qu.:  100.0   1st Qu.: 5.0    1st Qu.: 5.00  
 Median :2.000   Median :  175.0   Median : 6.0    Median : 6.00  
 Mean   :1.738   Mean   :  321.3   Mean   :42.3    Mean   :39.22  
 3rd Qu.:2.000   3rd Qu.:  300.0   3rd Qu.:98.0    3rd Qu.:98.00  
 Max.   :2.000   Max.   :32400.0   Max.   :98.0    Max.   :98.00  
 NA's   :14051   NA's   :16786     NA's   :14396   NA's   :16139  
    p08a01c          p08a02         p08a03a          p08a03b     
 Min.   : 1.00   Min.   :1.000   Min.   : 1.000   Min.   :1.000  
 1st Qu.: 5.00   1st Qu.:2.000   1st Qu.: 1.000   1st Qu.:2.000  
 Median : 6.00   Median :2.000   Median : 1.000   Median :3.000  
 Mean   :36.29   Mean   :1.907   Mean   : 2.728   Mean   :2.918  
 3rd Qu.:98.00   3rd Qu.:2.000   3rd Qu.: 2.000   3rd Qu.:4.000  
 Max.   :98.00   Max.   :2.000   Max.   :98.000   Max.   :5.000  
 NA's   :16975   NA's   :12133   NA's   :17758    NA's   :17812  
    p08a03c         p08a03d         p08a03e         p08a03f     
 Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
 1st Qu.:3.000   1st Qu.:1.000   1st Qu.:2.000   1st Qu.:3.000  
 Median :4.000   Median :1.000   Median :2.000   Median :3.000  
 Mean   :3.486   Mean   :1.429   Mean   :2.421   Mean   :3.265  
 3rd Qu.:4.000   3rd Qu.:1.000   3rd Qu.:3.000   3rd Qu.:4.000  
 Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
 NA's   :17826   NA's   :17507   NA's   :17552   NA's   :17631  
    p08a04a         p08a04b         p08a04c         p08a05a     
 Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   : 1.00  
 1st Qu.:2.000   1st Qu.:3.000   1st Qu.:4.000   1st Qu.: 1.00  
 Median :4.000   Median :4.000   Median :5.000   Median : 3.00  
 Mean   :3.501   Mean   :3.675   Mean   :4.342   Mean   : 3.47  
 3rd Qu.:5.000   3rd Qu.:5.000   3rd Qu.:5.000   3rd Qu.: 4.00  
 Max.   :5.000   Max.   :8.000   Max.   :5.000   Max.   :98.00  
 NA's   :17488   NA's   :17710   NA's   :17788   NA's   :17461  
    p08a05b         p08a05c         p08a06a          p08a06b     
 Min.   :1.000   Min.   :1.00    Min.   : 1.000   Min.   :1.000  
 1st Qu.:2.000   1st Qu.:3.00    1st Qu.: 1.000   1st Qu.:2.000  
 Median :3.000   Median :5.00    Median : 1.000   Median :2.000  
 Mean   :3.526   Mean   :4.74    Mean   : 3.719   Mean   :2.158  
 3rd Qu.:4.000   3rd Qu.:6.00    3rd Qu.: 3.000   3rd Qu.:3.000  
 Max.   :8.000   Max.   :8.00    Max.   :98.000   Max.   :4.000  
 NA's   :17631   NA's   :17761   NA's   :13321    NA's   :15946  
    p08a06c          p08b07          p08b08a          p08b08b      
 Min.   :1.000   Min.   : 1.000   Min.   : 1.000   Min.   : 1.000  
 1st Qu.:2.000   1st Qu.: 2.000   1st Qu.: 1.000   1st Qu.: 1.000  
 Median :3.000   Median : 3.000   Median : 1.000   Median : 2.000  
 Mean   :2.566   Mean   : 4.134   Mean   : 2.399   Mean   : 3.109  
 3rd Qu.:3.000   3rd Qu.: 6.000   3rd Qu.: 3.000   3rd Qu.: 3.000  
 Max.   :4.000   Max.   :98.000   Max.   :98.000   Max.   :98.000  
 NA's   :16907   NA's   :12119    NA's   :15616    NA's   :17138   
    p08b08c          p08b09a          p08b09b          p08b09c      
 Min.   : 1.000   Min.   : 1.000   Min.   : 1.000   Min.   : 1.000  
 1st Qu.: 1.000   1st Qu.: 1.000   1st Qu.: 2.000   1st Qu.: 3.000  
 Median : 2.000   Median :10.000   Median : 4.000   Median : 5.000  
 Mean   : 2.944   Mean   : 7.368   Mean   : 5.971   Mean   : 6.731  
 3rd Qu.: 3.000   3rd Qu.:10.000   3rd Qu.:10.000   3rd Qu.:10.000  
 Max.   :98.000   Max.   :98.000   Max.   :98.000   Max.   :98.000  
 NA's   :17362    NA's   :15424    NA's   :16990    NA's   :17434   
    p08b10a          p08b10b          p08b10c          p08b11a      
 Min.   : 1.000   Min.   : 1.000   Min.   : 1.000   Min.   : 1.000  
 1st Qu.: 1.000   1st Qu.: 1.000   1st Qu.: 1.000   1st Qu.: 1.000  
 Median : 1.000   Median : 2.000   Median : 3.000   Median : 1.000  
 Mean   : 4.966   Mean   : 4.399   Mean   : 4.784   Mean   : 3.891  
 3rd Qu.: 8.000   3rd Qu.: 8.000   3rd Qu.: 8.000   3rd Qu.: 7.000  
 Max.   :98.000   Max.   :98.000   Max.   :98.000   Max.   :98.000  
 NA's   :13600    NA's   :16356    NA's   :17204    NA's   :15009   
    p08b11b          p08b11c           p08c12          p08c13a     
 Min.   : 1.000   Min.   : 1.000   Min.   : 1.000   Min.   :1.000  
 1st Qu.: 3.000   1st Qu.: 2.000   1st Qu.: 2.000   1st Qu.:1.000  
 Median : 5.000   Median : 2.000   Median : 2.000   Median :3.000  
 Mean   : 5.234   Mean   : 3.444   Mean   : 2.441   Mean   :3.254  
 3rd Qu.: 7.000   3rd Qu.: 3.000   3rd Qu.: 2.000   3rd Qu.:4.000  
 Max.   :98.000   Max.   :98.000   Max.   :98.000   Max.   :8.000  
 NA's   :16865    NA's   :15991    NA's   :12136    NA's   :17680  
    p08c13b         p08c13c         p08c14a         p08c14b     
 Min.   :1.0     Min.   :1.000   Min.   :1.000   Min.   :1.000  
 1st Qu.:1.0     1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000  
 Median :3.0     Median :2.000   Median :3.000   Median :2.000  
 Mean   :3.1     Mean   :2.471   Mean   :3.517   Mean   :3.353  
 3rd Qu.:4.0     3rd Qu.:3.000   3rd Qu.:6.000   3rd Qu.:6.000  
 Max.   :8.0     Max.   :8.000   Max.   :7.000   Max.   :7.000  
 NA's   :17821   NA's   :17810   NA's   :17681   NA's   :17827  
    p08c14c         p08c15a          p08c15b         p08c15c     
 Min.   :1.00    Min.   : 1.000   Min.   :1.000   Min.   :1.00   
 1st Qu.:2.00    1st Qu.: 2.000   1st Qu.:2.000   1st Qu.:2.00   
 Median :4.00    Median : 3.000   Median :3.000   Median :2.50   
 Mean   :3.66    Mean   : 4.959   Mean   :3.308   Mean   :3.20   
 3rd Qu.:5.00    3rd Qu.: 4.000   3rd Qu.:5.000   3rd Qu.:4.75   
 Max.   :7.00    Max.   :98.000   Max.   :7.000   Max.   :7.00   
 NA's   :17811   NA's   :17812    NA's   :17848   NA's   :17851  
     p08c16         p08c17a         p08c17b         p08c17c      
 Min.   : 1.00   Min.   : 1.00   Min.   : 1.00   Min.   : 1.000  
 1st Qu.: 2.00   1st Qu.: 3.00   1st Qu.: 3.00   1st Qu.: 4.000  
 Median : 4.00   Median : 8.00   Median : 5.50   Median : 8.000  
 Mean   :28.12   Mean   : 9.52   Mean   :11.23   Mean   : 9.707  
 3rd Qu.:98.00   3rd Qu.: 8.00   3rd Qu.: 8.00   3rd Qu.: 8.000  
 Max.   :99.00   Max.   :98.00   Max.   :98.00   Max.   :98.000  
 NA's   :12132   NA's   :15015   NA's   :16763   NA's   :17232   
     p08c18         p08c19a         p08c19b         p08c19c     
 Min.   : 1.00   Min.   : 1.00   Min.   : 1.00   Min.   : 1.00  
 1st Qu.: 2.00   1st Qu.: 1.00   1st Qu.: 2.00   1st Qu.: 1.00  
 Median : 3.00   Median : 3.00   Median : 5.00   Median : 4.00  
 Mean   :22.46   Mean   :28.53   Mean   :29.45   Mean   :36.73  
 3rd Qu.: 4.00   3rd Qu.:98.00   3rd Qu.:98.00   3rd Qu.:98.00  
 Max.   :98.00   Max.   :98.00   Max.   :98.00   Max.   :98.00  
 NA's   :16202   NA's   :16651   NA's   :16990   NA's   :15697  
    p08c18b         p08c18c          pet_10           pet_15      
 Min.   : 1.00   Min.   : 1.00   Min.   :0.0000   Min.   :0.0000  
 1st Qu.: 2.00   1st Qu.: 3.00   1st Qu.:0.0000   1st Qu.:0.0000  
 Median : 4.00   Median : 4.00   Median :1.0000   Median :1.0000  
 Mean   :40.38   Mean   :35.55   Mean   :0.7476   Mean   :0.6247  
 3rd Qu.:98.00   3rd Qu.:98.00   3rd Qu.:1.0000   3rd Qu.:1.0000  
 Max.   :98.00   Max.   :98.00   Max.   :1.0000   Max.   :1.0000  
 NA's   :16762   NA's   :17569                                    
      pea            ocupados           pei          desocupados     
 Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.00000  
 1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.00000  
 Median :0.0000   Median :0.0000   Median :0.0000   Median :0.00000  
 Mean   :0.4012   Mean   :0.3861   Mean   :0.4222   Mean   :0.01506  
 3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:0.00000  
 Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.00000  
                                                                     
   ocup_plen     
 Min.   :0.0000  
 1st Qu.:0.0000  
 Median :0.0000  
 Mean   :0.1612  
 3rd Qu.:0.0000  
 Max.   :1.0000  
                 
```


```r
> sapply(enei11, function(x)(sum(is.na(x)))) # NA counts
```

```
    dominio      region        area  formulario  factor_exp        sexo 
          0           0           0           0           0           0 
       edad         dia         mes         año       ppa06       ppa07 
          6          12          12           6           7          17 
      ppa08       ppa09       ppa10       ppa11       ppa12       ppa13 
      11434          13          11           0       17816       17848 
     p03a01      p03a02      p03a03     po3a04a     po3a04b     po3a05a 
       3111        3113       12918       12935           0           0 
    po3a05b     p03a06b      p04a01      p04a02      p04a03      p04a04 
          0       11380        3154        3148        9249        9492 
     p04a05      p04a06      p04a07      p04a08      p04a09      p04b01 
       9686       10022       17811       17826       17831       10046 
     p04b02      p04b03      p04b04      p04b05      p04c01     p04c02b 
      10312       17550       10362       17536       10955       10962 
   p04c02br     p04c04b      p04c05      p04c06      p04c07     p04c08a 
      10962       10962       11008       10962       13960       16480 
    p04c08b     p04c08c     p04c09a     p04c09b      p04c10     p04c11a 
      17585       17713       13960       17471       13961       13960 
    p04c11b     p04c11c     p04c12a     p04c12b     p04c13a     p04c13b 
      17655       17636       13960       17735       13960       17740 
    p04c14a     p04c14b     p04c15a     p04c15b     p04c16a     p04c16b 
      13960       16574       13960       16533       13961       17622 
    p04c17a     p04c17b     p04c18a     p04c18b     p04c19a     p04c19b 
      13960       17823       13960       17530       13960       17747 
    p04c20a     p04c20b     p04c21a     p04c21b      p04c22      p04c23 
      13960       17772       13961       17785       16648       17018 
    p04c24a     p04c24b     p04c25a     p04c25b     p04c26a     p04c26b 
      15803       17687       10962       16635       10969       17465 
     p04c27     p04c28a     p04c28b     p04c28c     p04c28d     p04c28e 
      10963       10966       10967       10965       10966       10966 
    p04c28f     p04c28g      p04c29     p04c30a     p04c30b      p04d01 
      10972       10995       10971       11401       13434       10963 
    p04d02b    p04d02br     p04d04a      p04d05      p04d06     p04d07a 
      17167       17167       17167       17167       17742       17739 
    p04d07b     p04d08a     p04d08b     p04d09a     p04d09b     p04d10a 
      17849       17739       17857       17739           0       17739 
    p04d10b     p04d11a     p04d11b      p04d12      p04d13     p04d14a 
      17848       17739       17848       17721       17499       17358 
    p04d14b      p04d15      p04d16     p04d17a     p04d17b      p04e01 
      17830       17173       17169       17185       17522       10964 
    p04e02a     p04e02b     p04e02c      p04e03      p04e04      p04e05 
      16388       16400       16406       16369       16371       16367 
     p04e06     p04e07a     p04e07b      p04e08      p04e09      p04e10 
      10964       16285       17319       16285       16283       16283 
     p04f01     p04f02b    p04f02br      p04f03      p04f04     p04f05a 
      17594       17600       17600       17594       17594       17594 
    p04f05b     p04f05c     p04f05d     p04f05e     p04f05f     p04f05g 
      17594       17595       17596       17595       17594       17608 
     p04f06     p04f07b      p04f08     p04f09b      p04f10      p04f11 
      17594       17687       17683       17687       17683       17683 
     p04f12      p04f13      p04g01      p04g02      p04g03      p04g04 
      17683       17688       10300       16043       16047       12105 
    p04g05a     p04g05b     p04g05c     p04g05d     p04g05e     p04g05f 
      10301       10301       10301       10301       10301       10300 
    p04g05g     p04g05h     p04g05i     p05a01a     p05a01b     p05a02a 
      10301       10302       10494        3156       17719        3156 
    p05a02b     p05a03a     p05a03b     p05a04a     p05a04b     p05a05a 
      17840        3156       16871        3156       17764        3156 
    p05a05b     p05a06a     p05a06b     p05a07a     p05a07b     p05a08a 
      17654        3156       17827        3156       17859        3156 
    p05a08b     p05a09a     p05a09b     p05a10a     p05a10b     p05a11a 
      17858        3156       17828        3156       17847        3156 
    p05a11b     p05a12a     p05a12b     p05a13a     p05a13b     p05a14a 
      17847        3156       17842        3156       17860        3157 
    p05a14b     p05a15a     p05a15b     p05a16a     p05a16b      p05a17 
      17663        3157       17631        3157       17684        3159 
    p05a18a     p05a18b     p05a19a     p05a19b     p05a20a     p05a20b 
      17529       17537       17541       17548       17561       17568 
    p05a21a     p05a21b     p08a01a     p08a01b     p08a01c      p08a02 
      14051       16786       14396       16139       16975       12133 
    p08a03a     p08a03b     p08a03c     p08a03d     p08a03e     p08a03f 
      17758       17812       17826       17507       17552       17631 
    p08a04a     p08a04b     p08a04c     p08a05a     p08a05b     p08a05c 
      17488       17710       17788       17461       17631       17761 
    p08a06a     p08a06b     p08a06c      p08b07     p08b08a     p08b08b 
      13321       15946       16907       12119       15616       17138 
    p08b08c     p08b09a     p08b09b     p08b09c     p08b10a     p08b10b 
      17362       15424       16990       17434       13600       16356 
    p08b10c     p08b11a     p08b11b     p08b11c      p08c12     p08c13a 
      17204       15009       16865       15991       12136       17680 
    p08c13b     p08c13c     p08c14a     p08c14b     p08c14c     p08c15a 
      17821       17810       17681       17827       17811       17812 
    p08c15b     p08c15c      p08c16     p08c17a     p08c17b     p08c17c 
      17848       17851       12132       15015       16763       17232 
     p08c18     p08c19a     p08c19b     p08c19c     p08c18b     p08c18c 
      16202       16651       16990       15697       16762       17569 
     pet_10      pet_15         pea    ocupados         pei desocupados 
          0           0           0           0           0           0 
  ocup_plen 
          0 
```


```r
> library(e1071, pos=18)
```


```r
> numSummary(enei11[,"p03a01"], statistics=c("mean", "sd", "IQR", 
+   "quantiles"), quantiles=c(0,.25,.5,.75,1))
```

```
     mean        sd IQR 0% 25% 50% 75% 100%     n   NA
 1.177424 0.3822173   0  0   1   1   1    2 14750 3111
```


