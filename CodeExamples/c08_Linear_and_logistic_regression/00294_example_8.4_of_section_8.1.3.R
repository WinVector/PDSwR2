# example 8.4 of section 8.1.3 
# (example 8.4 of section 8.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Computing R-squared 

rsq <- function(y,f) { 1 - sum((y-f)^2)/sum((y-mean(y))^2) }

rsq(log(dtrain$PINCP,base=10), dtrain$predLogPINCP)
## [1] 0.2976165

rsq(log(dtest$PINCP,base=10), dtest$predLogPINCP)
## [1] 0.2911965

