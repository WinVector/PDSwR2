# informalexample 5.24 of section 5.2.1 
# (informalexample 5.24 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("dplyr")

airquality_with_date2 <- airquality %>%
  mutate(., date = dmy(datestr(Day, Month, 1973))) %>%
  select(., Ozone, date)

head(airquality_with_date2)

##   Ozone       date
## 1    41 1973-05-01
## 2    36 1973-05-02
## 3    12 1973-05-03
## 4    18 1973-05-04
## 5    NA 1973-05-05
## 6    28 1973-05-06

