# informalexample 5.51 of section 5.2.1 
# (informalexample 5.51 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

library("dplyr")

airquality_with_date2 <- airquality %>%
  mutate(., date = dmy(datestr(Day, Month, 1973))) %>%
  select(., Ozone, date)

head(airquality_with_date2)

