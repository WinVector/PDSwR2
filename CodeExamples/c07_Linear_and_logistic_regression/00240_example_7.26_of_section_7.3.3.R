# example 7.26 of section 7.3.3 
# (example 7.26 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 
# Title: Fitting the ridge regression model 

library(glmnet)
library(glmnetUtils) 

(model_ridge <- cv.glmnet(fmla,
                         cars_train,
                         alpha = 0,
                         family = "binomial"))    	# Note: 1 

## Call:
## cv.glmnet.formula(formula = fmla, data = cars_train, alpha = 0, 
##     family = "binomial")
## 
## Model fitting options:
##     Sparse model matrix: FALSE
##     Use model.frame: FALSE
##     Number of crossvalidation folds: 10
##     Alpha: 0
##     Deviance-minimizing lambda: 0.02272432  (+1 SE): 0.02493991

# Note 1: 
#   For logistic regression style models, 
#   use family = "binomial". For linear regression 
#   style models, use family = "gaussian". 

