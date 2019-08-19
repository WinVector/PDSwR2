# example 7.11 of section 7.2.3 
# (example 7.11 of section 7.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Logistic regression preserves marginal probabilities 

sum(train$atRisk == TRUE)  	# Note: 1 
## [1] 273

sum(train$pred)   	# Note: 2 
## [1] 273

premature <- subset(train, GESTREC3 == "< 37 weeks")   	# Note: 3 
sum(premature$atRisk == TRUE)
## [1] 112

sum(premature$pred)  	# Note: 4 
## [1] 112

# Note 1: 
#   Count the number of at-risk infants in the training set. 

# Note 2: 
#   Sum up all the predicted probabilities over the training set. See that it adds to the number of at-risk infants. 

# Note 3: 
#   Count the number of at-risk premature infants in the training set. 

# Note 4: 
#   Sum up all the predicted probabilities for premature infants in the training set. See that it adds 
#   to the number of at-risk premature infants. 

