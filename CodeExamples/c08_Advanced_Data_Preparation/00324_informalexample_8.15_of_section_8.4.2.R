# informalexample 8.15 of section 8.4.2 
# (informalexample 8.15 of section 8.4.2)  : Advanced data preparation : Advanced data preparation for classification : Building a model 

table(prediction = dTest_treated$glm_pred>0.15, 
      truth = dTest$churn)
#           truth
# prediction   -1    1
#      FALSE 4243  266
#      TRUE   356  110

