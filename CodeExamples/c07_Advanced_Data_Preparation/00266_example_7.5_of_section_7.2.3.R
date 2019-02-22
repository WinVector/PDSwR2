# example 7.5 of section 7.2.3 
# (example 7.5 of section 7.2.3)  : Advanced Data Preparation : KDD and KDD Cup 2009 : Characterizing the outcome 
# Title: Scoring the null model 

(prevalence <- mean(dTrain$churn==1)) 	# Note: 1 
# [1] 0.07379436

dTrain$null_prediction <- prevalence 	# Note: 2 
dCal$null_prediction <- prevalence

library("sigr") 	# Note: 3 

calcAUC(dTrain$null_prediction, dTrain$churn==1) 	# Note: 4 
# [1] 0.5
calcAUC(dCal$null_prediction, dCal$churn==1)
# [1] 0.5

permTestAUC(dTrain, "null_prediction", "churn", yTarget = 1) 	# Note: 5 
# [1] "AUC test alt. hyp. AUC>AUC(permuted): (AUC=0.5, s.d.=0, p=n.a.)."
permTestAUC(dCal, "null_prediction", "churn", yTarget = 1)
# [1] "AUC test alt. hyp. AUC>AUC(permuted): (AUC=0.5, s.d.=0, p=n.a.)."

wrapChiSqTest(dTrain, "null_prediction", "churn", yTarget = 1) 	# Note: 6 
# [1] "Chi-Square Test summary: pseudo-R2=0 (X2(1,N=40518)=0, p=n.s.)."
wrapChiSqTest(dCal, "null_prediction", "churn", yTarget = 1)
# [1] "Chi-Square Test summary: pseudo-R2=-2.009e-05 (X2(1,N=4510)=-0.04732, p=n.s.)."

# Note 1: 
#   Get the single probability we will use as our prediction. 

# Note 2: 
#   Copy this constant into every row as a new prediction column. 

# Note 3: 
#   Bring in the sigr package for easy model quality calculations. 

# Note 4: 
#   Calculate AUC on the training data, and unseen calibration data. For any prediction that doesn't move (any constant) AUC will be 0.5. 

# Note 5: 
#   Re-calculate the AUC with a significance estimate (just to show how to do this in the future). 

# Note 6: 
#   Calculate the pseudo-r-squared, (related to the deviance per data row). 

