# informalexample 5.53 of section 5.2.1 
# (informalexample 5.53 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

library("zoo")

airquality_corrected <- airquality_with_date
airquality_corrected$OzoneCorrected <-
  na.locf(airquality_corrected$Ozone, na.rm=FALSE)

summary(airquality_corrected)

