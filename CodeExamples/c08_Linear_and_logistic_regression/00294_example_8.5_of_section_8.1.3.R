# example 8.5 of section 8.1.3 
# (example 8.5 of section 8.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Calculating root mean square error 

rmse <- function(y, f) { sqrt(mean( (y-f)^2 )) }
        
rmse(log(dtrain$PINCP,base=10), dtrain$predLogPINCP)
## [1] 0.2685855

rmse(log(dtest$PINCP,base=10), dtest$predLogPINCP)
## [1] 0.2675129

