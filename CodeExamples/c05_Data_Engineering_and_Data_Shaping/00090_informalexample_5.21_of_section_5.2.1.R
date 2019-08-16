# informalexample 5.21 of section 5.2.1 
# (informalexample 5.21 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

airquality_with_date <- airquality                              	# Note: 1 

airquality_with_date$date <- with(airquality_with_date,         	# Note: 2 
                                  dmy(datestr(Day, Month, 1973)))

airquality_with_date <- airquality_with_date[,                 	# Note: 3 
                                             c("Ozone", "date"),
                                             drop = FALSE]

head(airquality_with_date)                                      	# Note: 4 
        
##   Ozone       date
## 1    41 1973-05-01
## 2    36 1973-05-02
## 3    12 1973-05-03
## 4    18 1973-05-04
## 5    NA 1973-05-05
## 6    28 1973-05-06        

ggplot(airquality_with_date, aes(x = date, y = Ozone)) +        	# Note: 5 
  geom_point() + 
  geom_line() + 
  xlab("Date") +
  ggtitle("New York ozone readings, May 1 - Sept 30, 1973")

# Note 1: 
#   Build a copy of the data. 

# Note 2: 
#   Add the date column, with “with()” to refer to columns without needing the table name. 

# Note 3: 
#   Limit down to columns of interest. 

# Note 4: 
#   Show the results. 

# Note 5: 
#   Plot the results. 

