# example 10.15 of section 10.2.2 
# (example 10.15 of section 10.2.2)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : A one-dimensional regression example 
# Title: Comparing linear regression and GAM performance 

test <- transform(test,                                   	# Note: 1 
                 pred_lin = predict(lin_model, test),
                 pred_gam = predict(gam_model, test) )


test <- transform(test,                                   	# Note: 2 
                 resid_lin = y - pred_lin,
                 resid_gam = y - pred_gam)


rmse(test$resid_lin)                                      	# Note: 3 
## [1] 2.792653

rmse(test$resid_gam)
## [1] 1.401399


library(sigr)                                            	# Note: 4 
wrapFTest(test, "pred_lin", "y")$R2
## [1] 0.115395

wrapFTest(test, "pred_gam", "y")$R2
## [1] 0.777239

# Note 1: 
#   Get predictions from both models on the test data. 
#   The function transform() is a base R version of dplyr::mutate(). 

# Note 2: 
#   Calculate the residuals. 

# Note 3: 
#   Compare the RMSE of both models on the test data. 

# Note 4: 
#   Compare the R-squared of both models on the test data,  
#   using the sigr package. 

