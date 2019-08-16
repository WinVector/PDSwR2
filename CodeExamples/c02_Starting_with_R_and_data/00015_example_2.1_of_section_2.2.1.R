# example 2.1 of section 2.2.1 
# (example 2.1 of section 2.2.1)  : Starting with R and data : Working with data from files : Working with well-structured data from files or URLs 
# Title: Reading the UCI car data 

uciCar <- read.table(               	# Note: 1 
   'car.data.csv',                  	# Note: 2 
   sep = ',',                       	# Note: 3 
   header = TRUE,                   	# Note: 4 
   stringsAsFactor = TRUE           	# Note: 5 
   )
                                        
View(uciCar)                        	# Note: 6

# Note 1: 
#   Command to read from a file or URL and store the result in a new data frame object 
#   called 
#   uciCar. 

# Note 2: 
#   Filename or URL to get the data from. 

# Note 3: 
#   Specify the column or field separator as a 
#   comma. 

# Note 4: 
#   Tell R to expect a header line that defines 
#   the data column names. 

# Note 5: 
#   Tell R to convert string values to factors. This is the default behavior, so we are just using this argument to document intent. 

# Note 6: 
#   Examine the data with R’s built-in 
#   table viewer. 

