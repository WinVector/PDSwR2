# example 4.1 of section 4.1.1 
# (example 4.1 of section 4.1.1)  : Managing data : Cleaning data : Domain-specific data cleaning 
# Title: Treating the age and income variables 

library(dplyr)
customer_data = readRDS("custdata.RDS")                      	# Note: 1 

customer_data <- customer_data %>%
   mutate(age = na_if(age, 0),                               	# Note: 2 
          income = ifelse(income < 0, NA, income))           	# Note: 3

# Note 1: 
#   Load the data. 

# Note 2: 
#   The function mutate() from the dplyr package adds columns to a data frame, or modifies existing columns. 
#   The function na_if(), also from dplyr, turns a specific problematic value (in this case, 0) to NA 

# Note 3: 
#   Convert negative incomes to NA 

