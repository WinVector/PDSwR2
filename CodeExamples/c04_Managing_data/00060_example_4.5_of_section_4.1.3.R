# example 4.5 of section 4.1.3 
# (example 4.5 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 
# Title: Comparing the treated data to the original 

colnames(customer_data)   
##  [1] "custid"               "sex"                  "is_employed"         
##  [4] "income"               "marital_status"       "health_ins"          
##  [7] "housing_type"         "recent_move"          "num_vehicles"        
## [10] "age"                  "state_of_res"         "gas_usage"           
## [13] "gas_with_rent"        "gas_with_electricity" "no_gas_bill"    
                                        
colnames(training_prepared)                                               	# Note: 1 
##  [1] "custid"                     "sex"                       
##  [3] "is_employed"                "income"                    
##  [5] "marital_status"             "health_ins"                
##  [7] "housing_type"               "recent_move"               
##  [9] "num_vehicles"               "age"                       
## [11] "state_of_res"               "gas_usage"                 
## [13] "gas_with_rent"              "gas_with_electricity"      
## [15] "no_gas_bill"                "is_employed_isBAD"         
## [17] "income_isBAD"               "recent_move_isBAD"         
## [19] "num_vehicles_isBAD"         "age_isBAD"                 
## [21] "gas_usage_isBAD"            "gas_with_rent_isBAD"       
## [23] "gas_with_electricity_isBAD" "no_gas_bill_isBAD"                                    
                                        
nacounts <- sapply(training_prepared, FUN=function(col) sum(is.na(col)) )  	# Note: 2 
sum(nacounts)
## [1] 0

# Note 1: 
#   The prepared data has additional columns that are not in the  
#   original data, most importantly those with the _isBAD designation. 

# Note 2: 
#   The prepared data has no missing values. 

