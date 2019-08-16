# example 4.11 of section 4.2.2 
# (example 4.11 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Treating new data before feeding it to a model 

newdata <- customer_data                                       	# Note: 1 
                                                
library(vtreat)                                                	# Note: 2 
newdata_treated <- prepare(treatment_plan, newdata)
                                                
new_dataf <- newdata_treated[, c("age", "income", "num_vehicles", "gas_usage")]       	# Note: 3  
dataf_scaled <- scale(new_dataf, center=means, scale=sds)

# Note 1: 
#   Simulate having a new customer dataset. 

# Note 2: 
#   Clean it using the treatment plan from the original dataset. 

# Note 3: 
#   Scale age, income, num_vehicles, and gas_usage using the means 
#   and standard deviations from the original data set. 

