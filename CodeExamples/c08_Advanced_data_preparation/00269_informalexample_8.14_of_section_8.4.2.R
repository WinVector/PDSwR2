# informalexample 8.14 of section 8.4.2 
# (informalexample 8.14 of section 8.4.2)  : Advanced data preparation : Advanced data preparation for classification : Building a model 

table(prediction = dTest_treated$glm_pred >= 0.5, 
      truth = dTest$churn)
#           truth
# prediction   -1    1
#      FALSE 4591  375
#      TRUE     8    1

