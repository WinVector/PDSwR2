# informalexample 5.44 of section 5.2.1 
# (informalexample 5.44 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("data.table")
library("zoo")

DT_airquality[, OzoneCorrected := na.locf(Ozone, na.rm=FALSE)]

summary(DT_airquality)

