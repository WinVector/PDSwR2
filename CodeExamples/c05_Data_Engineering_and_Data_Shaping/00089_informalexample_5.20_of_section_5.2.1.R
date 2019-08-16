# informalexample 5.20 of section 5.2.1 
# (informalexample 5.20 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("lubridate")
library("ggplot2")

# create a function to make the date string.
datestr = function(day, month, year) {
  paste(day, month, year, sep="-")
}

