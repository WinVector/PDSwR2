# informalexample 8.2 of section 8.4.3 
# (informalexample 8.2 of section 8.4.3)  : Advanced Data Preparation : Building models using many variables : Evaluating the model 

calcAUC(dTest_treated$glm_pred, dTest_treated$churn==1)
## [1] 0.7106011

