# informalexample 8.11 of section 8.4.1 
# (informalexample 8.11 of section 8.4.1)  : Advanced data preparation : Advanced data preparation for classification : Using mkCrossFrameCExperiment() 

library("sigr")

calcAUC(dTrainAll_treated$Var200_catB, dTrainAll_treated$churn)

# [1] 0.5450466

calcAUC(dTest_treated$Var200_catB, dTest_treated$churn)

# [1] 0.5290295

