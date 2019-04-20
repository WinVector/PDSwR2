# informalexample 5.46 of section 5.2.1 
# (informalexample 5.46 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 

library("dplyr")
library("zoo")

airquality_with_date %>% 
  mutate(.,
         OzoneCorrected = na.locf(Ozone, na.rm = FALSE)) %>% 
  summary(.)

