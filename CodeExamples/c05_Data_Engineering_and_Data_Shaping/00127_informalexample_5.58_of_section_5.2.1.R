# informalexample 5.58 of section 5.2.1 
# (informalexample 5.58 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

library("dplyr")
library("zoo")

# use na.rm=FALSE with na.locf to prevent leading NAs from being dropped
# Note that the "new" column we are adding is the old one -- we are overwriting it
airquality_with_date %>% 
  mutate(.,
         OzoneCorrected = na.locf(Ozone, na.rm=FALSE)) %>% 
  summary(.)

