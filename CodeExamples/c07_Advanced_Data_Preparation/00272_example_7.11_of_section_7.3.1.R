# example 7.11 of section 7.3.1 
# (example 7.11 of section 7.3.1)  : Advanced Data Preparation : Building single-variable models : Building single variable models from categorical features 
# Title: Scoring categorical variables by AUC 

library("sigr")

length(unique(dTrain_treated$Var218))
## [1] 3

calcAUC(dTrain_treated$Var218_catB, dTrain_treated$churn == 1)
## [1] 0.5614422
calcAUC(dCal_treated$Var218_catB, dCal_treated$churn == 1)
## [1] 0.5354978

length(unique(dTrain_treated$Var222))
## [1] 3908

calcAUC(dTrain_treated$Var222_catB, dTrain_treated$churn == 1)
## [1] 0.748602
calcAUC(dCal_treated$Var222_catB, dCal_treated$churn == 1)
## [1] 0.559091

