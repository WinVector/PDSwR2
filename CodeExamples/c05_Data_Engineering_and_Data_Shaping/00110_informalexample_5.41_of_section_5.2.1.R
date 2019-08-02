# informalexample 5.41 of section 5.2.1 
# (informalexample 5.41 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("zoo")

airquality_corrected <- airquality_with_date
airquality_corrected$OzoneCorrected <-
  na.locf(airquality_corrected$Ozone, na.rm = FALSE)

summary(airquality_corrected)

