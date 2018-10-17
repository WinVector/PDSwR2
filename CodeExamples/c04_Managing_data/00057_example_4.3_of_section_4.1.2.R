# example 4.3 of section 4.1.2 
# (example 4.3 of section 4.1.2)  : Managing data : Cleaning data : Treating missing values (NAs) 
# Title: Count the missing values in each variable 

count_missing = function(df) {                     	# Note: 1 
  sapply(df, FUN=function(col) sum(is.na(col)) )
}

nacounts <- count_missing(customer_data)
hasNA = which(nacounts > 0)                         	# Note: 2 
nacounts[hasNA]

##          is_employed               income         housing_type 
##                25774                   45                 1720 
##          recent_move         num_vehicles                  age 
##                 1721                 1720                   77 
##            gas_usage        gas_with_rent gas_with_electricity 
##                35702                 1720                 1720 
##          no_gas_bill 
##                 1720

# Note 1: 
#   Define a function that counts the number of NAs in each column of a data frame. 

# Note 2: 
#   Apply the function to customer_data, identify which columns have missing values, and print the columns and counts. 

