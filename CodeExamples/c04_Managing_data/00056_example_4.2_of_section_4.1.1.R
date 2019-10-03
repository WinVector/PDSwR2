# example 4.2 of section 4.1.1 
# (example 4.2 of section 4.1.1)  : Managing data : Cleaning data : Domain-specific data cleaning 
# Title: Treating the gas_usage variable 

customer_data <- customer_data %>%
  mutate(gas_with_rent = (gas_usage == 1),                    	# Note: 1 
         gas_with_electricity = (gas_usage == 2),
         no_gas_bill = (gas_usage == 3) ) %>%
  mutate(gas_usage = ifelse(gas_usage < 4, NA, gas_usage))    	# Note: 2

# Note 1: 
#   Create the three indicator variables. 

# Note 2: 
#   Convert the special codes in the gas_usage column to NA. 

