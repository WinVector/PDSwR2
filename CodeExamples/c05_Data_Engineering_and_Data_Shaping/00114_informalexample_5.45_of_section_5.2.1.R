# informalexample 5.45 of section 5.2.1 
# (informalexample 5.45 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

library("lubridate")
library("dplyr")

# create a function to make the date string.
datestr = function(day, month, year) {
  paste(day, month, year, sep="-")
}

