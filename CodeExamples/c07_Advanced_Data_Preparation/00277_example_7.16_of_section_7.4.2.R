# example 7.16 of section 7.4.2 
# (example 7.16 of section 7.4.2)  : Advanced Data Preparation : Building models using many variables : Building a multi variable model 
# Title: Basic variable re-coding and selection 

f <- wrapr::mk_formula("churn", newvars, outcome_target = 1) 	# Note: 1 
        
model <- glm(f, data = dTrainAll_treated, family = binomial) 	# Note: 2 
## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred

dTest_treated$glm_pred <- predict(model, newdata = dTest_treated, type='response') 	# Note: 3 
## Warning in predict.lm(object, newdata, se.fit, scale = 1, type =
## ifelse(type == : prediction from a rank-deficient fit may be misleading

# Note 1: 
#   Build a formula specifying modeling churn==1 as a function of all variables. 

# Note 2: 
#   Use the modeling formula with R's glm() function. Both the method and the warning message are the topic of the next chapter. 

# Note 3: 
#   Use the derived model to make predictions on our held-out or test data. The warning shown here for the same reason as the previous warning. 

