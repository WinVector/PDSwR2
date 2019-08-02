# informalexample 5.39 of section 5.2.1 
# (informalexample 5.39 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("dplyr")

airquality_with_date2 <- airquality %>%
  mutate(., date = dmy(datestr(Day, Month, 1973))) %>%
  select(., Ozone, date)

head(airquality_with_date2)

