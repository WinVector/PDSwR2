# informalexample 8.4 of section 8.4.3 
# (informalexample 8.4 of section 8.4.3)  : Advanced Data Preparation : Building models using many variables : Evaluating the model 

table(prediction = dTest_treated$glm_pred>0.15, truth = dTest$churn)
##           truth
## prediction   -1    1
##      FALSE 4241  252
##      TRUE   378  101

