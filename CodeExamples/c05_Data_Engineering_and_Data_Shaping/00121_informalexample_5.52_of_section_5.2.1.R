# informalexample 5.52 of section 5.2.1 
# (informalexample 5.52 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 

# build a copy of the data
airquality_with_date <- airquality
# add the date column
airquality_with_date$date <- with(airquality_with_date,
                                  dmy(datestr(Day, Month, 1973)))
# limit down to columns of interest
airquality_with_date <- airquality_with_date[,
                                             c("Ozone", "date"),
                                             drop = FALSE]

# show the results
head(airquality_with_date)

