# example 7.8 of section 7.2.2 
# (example 7.8 of section 7.2.2)  : Advanced Data Preparation : Building single-variable models : Using categorical features 
# Title: Scoring categorical variables by AUC 

library("sigr")

length(unique(dTrain$Var218))
# [1] 3
calcAUC(dTrain$Var218_catB, dTrain$churn == 1)
# [1] 0.5614422
calcAUC(dCal$Var218_catB, dCal$churn == 1)
# [1] 0.5354978

length(unique(dTrain$Var200))
# [1] 13443
calcAUC(dTrain$Var200_catB, dTrain$churn == 1)
# [1] 0.8296952
calcAUC(dCal$Var200_catB, dCal$churn == 1)
# [1] 0.5647069

