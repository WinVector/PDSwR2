# informalexample 5.55 of section 5.2.1 
# (informalexample 5.55 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 

library("data.table")

DT_airquality <- 
  # convert to data.table class
  as.data.table(airquality)[ 
    # add a new date column
    , date := dmy(datestr(Day, Month, 1973)) ][
      # limit down to columns of interest
      , c("Ozone", "date")]

head(DT_airquality)

