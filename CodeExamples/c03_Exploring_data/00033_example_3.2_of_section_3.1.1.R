# example 3.2 of section 3.1.1 
# (example 3.2 of section 3.1.1)  : Exploring data : Using summary statistics to spot problems : Typical problems revealed by data summaries 
# Title: Will the variable is.employed be useful for modeling? 

## is_employed                                         	# Note: 1 
## FALSE: 2321   
## TRUE :44887  
## NA's :24333  
               
##                       housing_type   recent_move     	# Note: 2 
## Homeowner free and clear    :16763   Mode :logical  
## Homeowner with mortgage/loan:31387   FALSE:62418    
## Occupied with no rent       : 1138   TRUE :9123     
## Rented                      :22254   NA's :1721     
## NA's                        : 1720                  
##                                                                    
##                                                                    
##   num_vehicles     gas_usage     
##  Min.   :0.000   Min.   :  1.00  
##  1st Qu.:1.000   1st Qu.:  3.00  
##  Median :2.000   Median : 10.00  
##  Mean   :2.066   Mean   : 41.17  
##  3rd Qu.:3.000   3rd Qu.: 60.00  
##  Max.   :6.000   Max.   :570.00  
##  NA's   :1720    NA's   :1720

# Note 1: 
#   The variable is_employed is missing for 
#   over a third of the data. Why? Is employment status unknown? Did the 
#   company start collecting employment data only recently? Does NA mean “not in 
#   the active workforce” (for example, students or stay-at-home 
#   parents)? 

# Note 2: 
#   The variables housing_type, recent_move, num_vehicles, and gas_usage are missing relatively 
#   few values—about 2% of the data. It’s probably safe to just drop the 
#   rows that are missing values, especially if the missing values are 
#   all in the same 1720 rows. 

