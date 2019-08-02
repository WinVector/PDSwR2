# informalexample 5.46 of section 5.2.1 
# (informalexample 5.46 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("dplyr")
library("zoo")

airquality_with_date %>% 
  mutate(.,
         OzoneCorrected = na.locf(Ozone, na.rm = FALSE)) %>% 
  summary(.)

