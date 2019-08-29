# informalexample 5.26 of section 5.2.1 
# (informalexample 5.26 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("data.table")
library("zoo")

DT_airquality[, OzoneCorrected := na.locf(Ozone, na.rm=FALSE)]

summary(DT_airquality)

##      Ozone             date            OzoneCorrected  
##  Min.   :  1.00   Min.   :1973-05-01   Min.   :  1.00  
##  1st Qu.: 18.00   1st Qu.:1973-06-08   1st Qu.: 16.00  
##  Median : 31.50   Median :1973-07-16   Median : 30.00  
##  Mean   : 42.13   Mean   :1973-07-16   Mean   : 39.78  
##  3rd Qu.: 63.25   3rd Qu.:1973-08-23   3rd Qu.: 52.00  
##  Max.   :168.00   Max.   :1973-09-30   Max.   :168.00  
##  NA's   :37

