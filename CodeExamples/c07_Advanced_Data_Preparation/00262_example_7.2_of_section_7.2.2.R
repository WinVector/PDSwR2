# example 7.2 of section 7.2.2 
# (example 7.2 of section 7.2.2)  : Advanced Data Preparation : KDD and KDD Cup 2009 : The Bull in The China Shop Approach 
# Title: Attempting to model without preparation 

library("wrapr")  	# Note: 1 

f1 <- mk_formula("churn", vars, outcome_target = 1) 	# Note: 2 
model1 <- glm(f1, data = dTrainAll, family = binomial) 	# Note: 3 
                                        
## Error in `contrasts<-`(`*tmp*`, value = contr.funs[1 + isOF[nn]]): contrasts can be applied only to factors with 2 or more levels 	# Note: 4

# Note 1: 
#   Attache the wrapr package for convenience functions, such as mk_formula(). 

# Note 2: 
#   Build a model formula specification asking churn==1 be predicted as a function of our explanatory variables. 

# Note 3: 
#   Ask the glm() function to build a logistic regression model. 

# Note 4: 
#   The attempt failed with an error. 

