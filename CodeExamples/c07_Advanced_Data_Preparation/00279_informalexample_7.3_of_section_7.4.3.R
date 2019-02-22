# informalexample 7.3 of section 7.4.3 
# (informalexample 7.3 of section 7.4.3)  : Advanced Data Preparation : Building models using many variables : Evaluating the model 

table(prediction = dTest_treated$glm_pred>=0.5, truth = dTest$churn)
##           truth
## prediction   -1    1
##      FALSE 4613  350
##      TRUE     6    3

