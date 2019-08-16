# example 8.7 of section 8.4.2 
# (example 8.7 of section 8.4.2)  : Advanced data preparation : Advanced data preparation for classification : Building a model 
# Title: Basic variable re-coding and selection 

library("wrapr")

newvars <- score_frame$varName[score_frame$selected]             	# Note: 1 

f <- mk_formula("churn", newvars, outcome_target = 1)       	# Note: 2 
model <- glm(f, data = dTrainAll_treated, family = binomial)    	# Note: 3 
# Warning message:
# glm.fit: fitted probabilities numerically 0 or 1 occurred

# Note 1: 
#   Build a formula specifying modeling churn == 1 as a function of all variables. 

# Note 2: 
#   Use the modeling formula with R’s glm() function. 

# Note 3: 
#   Take heed of this warning: it is hinting we should move on to a regularized method such as 
#   glmnet. 

