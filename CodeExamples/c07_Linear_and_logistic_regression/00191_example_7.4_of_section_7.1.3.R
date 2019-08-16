# example 7.4 of section 7.1.3 
# (example 7.4 of section 7.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Computing R-squared 

rsq <- function(y, f) { 1 - sum((y - f)^2)/sum((y - mean(y))^2) }

rsq(log10(dtrain$PINCP), dtrain$predLogPINCP)           	# Note: 1 
## [1] 0.2976165

rsq(log10(dtest$PINCP), dtest$predLogPINCP)              	# Note: 2 
## [1] 0.2911965

# Note 1: 
#   R-squared of the model on the training data 

# Note 2: 
#   R-squared of the model on the test data 

