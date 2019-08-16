# example 7.6 of section 7.1.5 
# (example 7.6 of section 7.1.5)  : Linear and logistic regression : Using linear regression : Reading the model summary and characterizing coefficient quality 
# Title: Summarizing residuals 

( resids_train <- summary(log10(dtrain$PINCP) - predict(model, newdata = dtrain)) )
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.5038 -0.1354  0.0187  0.0000  0.1710  0.9741

( resids_test <- summary(log10(dtest$PINCP) - predict(model, newdata = dtest)) )
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -1.789150 -0.130733  0.027413  0.006359  0.175847  0.912646

