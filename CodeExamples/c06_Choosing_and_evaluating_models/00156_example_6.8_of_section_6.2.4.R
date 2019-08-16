# example 6.8 of section 6.2.4 
# (example 6.8 of section 6.2.4)  : Choosing and evaluating models : Evaluating models : Evaluating scoring models 
# Title: Calculating R-squared 

error_sq <- (crickets$temp_pred - crickets$temperatureF)^2               	# Note: 1 
numerator <- sum(error_sq)                                               	# Note: 2 
 
delta_sq <- (mean(crickets$temperatureF) - crickets$temperatureF)^2       	# Note: 3 
denominator = sum(delta_sq)                                               	# Note: 4 
 
(R2 <- 1 - numerator/denominator)                                         	# Note: 5 
## [1] 0.6974651

# Note 1: 
#   Calculate the squared error terms. 

# Note 2: 
#   Sum them to get the model’s sum squared error, or variance. 

# Note 3: 
#   Calculate the squared error terms from the null model. 

# Note 4: 
#   Calculate the data’s total variance. 

# Note 5: 
#   Calculate R-squared. 

