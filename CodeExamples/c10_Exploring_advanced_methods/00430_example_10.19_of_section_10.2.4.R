# example 10.19 of section 10.2.4 
# (example 10.19 of section 10.2.4)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Using GAM on actual data 
# Title: Checking GAM model performance on hold-out data 

test <- transform(test,                             	# Note: 1 
                 pred_lin = predict(linmodel, test),
                 pred_gam = predict(gammodel, test) )


test <- transform(test,                       	# Note: 2 
                 resid_lin = DBWT - pred_lin,
                 resid_gam = DBWT - pred_gam)


rmse(test$resid_lin)                              	# Note: 3 
## [1] 566.4719

rmse(test$resid_gam)
## [1] 558.2978

wrapFTest(test, "pred_lin", "DBWT")$R2  	# Note: 4 
## [1] 0.06143168

wrapFTest(test, "pred_gam", "DBWT")$R2
## [1] 0.08832297

# Note 1: 
#   Get predictions from both models on test data. 

# Note 2: 
#   Get the residuals. 

# Note 3: 
#   Compare the RMSE of both models on the test data. 

# Note 4: 
#   Compare the R-squared of both models on the test data, using sigr. 

