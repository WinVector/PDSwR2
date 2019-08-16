# example 3.1 of section 3.1 
# (example 3.1 of section 3.1)  : Exploring data : Using summary statistics to spot problems 
# Title: The summary() command 

setwd("PDSwR2/Custdata")                                               	# Note: 1 
customer_data = readRDS("custdata.RDS")
summary(customer_data)
##     custid              sex        is_employed       income       	# Note: 2 
##  Length:73262       Female:37837   FALSE: 2351   Min.   :  -6900  
##  Class :character   Male  :35425   TRUE :45137   1st Qu.:  10700  
##  Mode  :character                  NA's :25774   Median :  26200  
##                                                  Mean   :  41764  
##                                                  3rd Qu.:  51700  
##                                                  Max.   :1257000  
##                                                                   
##             marital_status  health_ins                                  	# Note: 3 
##  Divorced/Separated:10693   Mode :logical  
##  Married           :38400   FALSE:7307     
##  Never married     :19407   TRUE :65955    
##  Widowed           : 4762                  
##                                            
##                                            
##                                            
##                        housing_type   recent_move      num_vehicles         	# Note: 4 
##  Homeowner free and clear    :16763   Mode :logical   Min.   :0.000  
##  Homeowner with mortgage/loan:31387   FALSE:62418     1st Qu.:1.000  
##  Occupied with no rent       : 1138   TRUE :9123      Median :2.000  
##  Rented                      :22254   NA's :1721      Mean   :2.066  
##  NA's                        : 1720                   3rd Qu.:3.000  
##                                                       Max.   :6.000  
##                                                       NA's   :1720   
##       age               state_of_res     gas_usage                     	# Note: 5 
##  Min.   :  0.00   California  : 8962   Min.   :  1.00  
##  1st Qu.: 34.00   Texas       : 6026   1st Qu.:  3.00  
##  Median : 48.00   Florida     : 4979   Median : 10.00  
##  Mean   : 49.16   New York    : 4431   Mean   : 41.17  
##  3rd Qu.: 62.00   Pennsylvania: 2997   3rd Qu.: 60.00  
##  Max.   :120.00   Illinois    : 2925   Max.   :570.00  
##                   (Other)     :42942   NA's   :1720

# Note 1: 
#   Change this to your actual path to the directory where you unpacked PDSwR2 

# Note 2: 
#   The variable is_employed is missing for 
#   about a third of the data. The variable income has negative values, which are 
#   potentially invalid. 

# Note 3: 
#   About 90% of the customers have health 
#   insurance. 

# Note 4: 
#   The variables housing_type, recent_move,  
#   num_vehicles, and gas_usage are each missing 1720 or 1721 values. 

# Note 5: 
#   The average value of the variable age seems 
#   plausible, but the minimum and maximum values seem unlikely. The variable 
#   state_of_res is a categorical variable; summary() reports how many customers are in 
#   each state (for the first few states). 

