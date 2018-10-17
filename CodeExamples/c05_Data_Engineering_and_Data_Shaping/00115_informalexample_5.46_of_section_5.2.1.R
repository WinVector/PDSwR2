# informalexample 5.46 of section 5.2.1 
# (informalexample 5.46 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

airquality_with_date <- airquality
airquality_with_date$date <- with(airquality_with_date,
                                  dmy(datestr(Day, Month, 1973)))
airquality_with_date <- airquality_with_date[,
                                             c("Ozone", "date"),
                                             drop = FALSE]
head(airquality_with_date)

