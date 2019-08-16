# informalexample 5.23 of section 5.2.1 
# (informalexample 5.23 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("data.table")

DT_airquality <- 
  as.data.table(airquality)[                        	# Note: 1 
    , date := dmy(datestr(Day, Month, 1973)) ][     	# Note: 2 
      , c("Ozone", "date")]                 	# Note: 3 

head(DT_airquality)

##    Ozone       date
## 1:    41 1973-05-01
## 2:    36 1973-05-02
## 3:    12 1973-05-03
## 4:    18 1973-05-04
## 5:    NA 1973-05-05
## 6:    28 1973-05-06

# Note 1: 
#   Build a data.table copy of the data. 

# Note 2: 
#   Add the date column. 

# Note 3: 
#   Limit down to columns of interest. 

