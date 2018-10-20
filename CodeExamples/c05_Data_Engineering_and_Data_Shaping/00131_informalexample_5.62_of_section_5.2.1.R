# informalexample 5.62 of section 5.2.1 
# (informalexample 5.62 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 

library("data.table")
library("zoo")

DT_airquality[, OzoneCorrected := na.locf(Ozone, na.rm=FALSE)]

summary(DT_airquality)

