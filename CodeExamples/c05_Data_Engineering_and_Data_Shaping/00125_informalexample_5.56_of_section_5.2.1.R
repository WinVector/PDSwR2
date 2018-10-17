# informalexample 5.56 of section 5.2.1 
# (informalexample 5.56 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

library("data.table")
library("zoo")

airquality_data.table[, OzoneCorrected := na.locf(Ozone, na.rm=FALSE)]

summary(airquality_data.table)

