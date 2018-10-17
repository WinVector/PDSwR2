# informalexample 5.49 of section 5.2.1 
# (informalexample 5.49 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

library("data.table")

airquality_data.table <- as.data.table(airquality)

airquality_data.table[ 
  , date := dmy(datestr(Day, Month, 1973)) ]
airquality_data.table <- airquality_data.table[, c("Ozone", "date")]

head(airquality_data.table)

