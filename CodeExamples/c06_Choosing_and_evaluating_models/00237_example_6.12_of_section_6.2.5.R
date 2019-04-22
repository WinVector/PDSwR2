# example 6.12 of section 6.2.5 
# (example 6.12 of section 6.2.5)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Computing the null model’s log likelihood 

(pNull <- mean(spamTrain$spam == 'spam'))
## [1] 0.3941588

sum(ylogpy(y, pNull) + ylogpy(1-y, 1-pNull))
## [1] -306.8964

