# informalexample 8.13 of section 8.4.2 
# (informalexample 8.13 of section 8.4.2)  : Advanced data preparation : Advanced data preparation for classification : Building a model 

library("sigr")

dTest_treated$glm_pred <- predict(model,                                   	# Note: 1 
                                  newdata = dTest_treated, 
                                  type = 'response')
# Warning message:                                                         	# Note: 2 
# In predict.lm(object, newdata, se.fit, scale = 1, type = ifelse(type ==  :
#   prediction from a rank-deficient fit may be misleading

calcAUC(dTest_treated$glm_pred, dTest_treated$churn == 1)                	# Note: 3 
## [1] 0.7232192

permTestAUC(dTest_treated, "glm_pred", "churn", yTarget = 1)     	# Note: 4 
## [1] "AUC test alt. hyp. AUC>AUC(permuted): (AUC=0.7232, s.d.=0.01535, p<1e-05)."
       
var_aucs <- vapply(newvars,                                              	# Note: 5 
       function(vi) {
         calcAUC(dTrainAll_treated[[vi]], dTrainAll_treated$churn == 1)
       }, numeric(1))
(best_train_aucs <- var_aucs[var_aucs >= max(var_aucs)])
## Var216_catB 
##   0.5873512

# Note 1: 
#   Add the model prediction to the evaluation data as a new column. 

# Note 2: 
#   Again, take heed of this warning: it is hinting we should 
#   move on to a regularized method such as 
#   glmnet. 

# Note 3: 
#   Calculate the AUC of the model on hold-out data. 

# Note 4: 
#   Calculate the AUC a second time, using an alternative method that also estimates a standard deviation or error-bar. 

# Note 5: 
#   Here we calculate the best single variable model AUC for comparison. 

