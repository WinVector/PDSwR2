# example 7.5 of section 7.1.3 
# (example 7.5 of section 7.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Calculating root mean square error 

rmse <- function(y, f) { sqrt(mean( (y-f)^2 )) }
        
rmse(log10(dtrain$PINCP), dtrain$predLogPINCP)    	# Note: 1 
## [1] 0.2685855

rmse(log10(dtest$PINCP), dtest$predLogPINCP)       	# Note: 2 
## [1] 0.2675129

# Note 1: 
#   RMSE of the model on the training data 

# Note 2: 
#   RMSE of the model on the test data 

