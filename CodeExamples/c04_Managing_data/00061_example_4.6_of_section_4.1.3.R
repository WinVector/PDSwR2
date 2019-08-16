# example 4.6 of section 4.1.3 
# (example 4.6 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 
# Title: Examining the data treatment 

htmissing <- which(is.na(customer_data$housing_type))                                  	# Note: 1 
                                        
columns_to_look_at <- c("custid", "is_employed", "num_vehicles",
                           "housing_type", "health_ins")
                                        
customer_data[htmissing, columns_to_look_at] %>% head()                                 	# Note: 2 
##           custid is_employed num_vehicles housing_type health_ins
## 55  000082691_01        TRUE           NA         <NA>      FALSE
## 65  000116191_01        TRUE           NA         <NA>       TRUE
## 162 000269295_01          NA           NA         <NA>      FALSE
## 207 000349708_01          NA           NA         <NA>      FALSE
## 219 000362630_01          NA           NA         <NA>       TRUE
## 294 000443953_01          NA           NA         <NA>       TRUE
                                        
columns_to_look_at = c("custid", "is_employed", "is_employed_isBAD",
                       "num_vehicles","num_vehicles_isBAD",
                       "housing_type", "health_ins")
                                        
training_prepared[htmissing, columns_to_look_at] %>%  head()                         	# Note: 3 
##           custid is_employed is_employed_isBAD num_vehicles
## 55  000082691_01   1.0000000                 0       2.0655
## 65  000116191_01   1.0000000                 0       2.0655
## 162 000269295_01   0.9504928                 1       2.0655
## 207 000349708_01   0.9504928                 1       2.0655
## 219 000362630_01   0.9504928                 1       2.0655
## 294 000443953_01   0.9504928                 1       2.0655
##     num_vehicles_isBAD housing_type health_ins
## 55                   1    _invalid_      FALSE
## 65                   1    _invalid_       TRUE
## 162                  1    _invalid_      FALSE
## 207                  1    _invalid_      FALSE
## 219                  1    _invalid_       TRUE
## 294                  1    _invalid_       TRUE
                                        
customer_data %>%
    summarize(mean_vehicles = mean(num_vehicles, na.rm = TRUE),
    mean_employed = mean(as.numeric(is_employed), na.rm = TRUE))                       	# Note: 4 
##   mean_vehicles mean_employed
## 1        2.0655     0.9504928

# Note 1: 
#   Find the rows where housing_type was missing 

# Note 2: 
#   Look at a few columns from those rows in the original data 

# Note 3: 
#   Look at those rows and columns in the treated data (along with the isBADS) 

# Note 4: 
#   Verify the expected number of 
#   vehicles and the expected unemployment rate in the 
#   dataset 

