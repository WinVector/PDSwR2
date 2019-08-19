# example 7.31 of section 7.3.3 
# (example 7.31 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 
# Title: Crossvalidating for both alpha and lambda 

(elastic_net <- cva.glmnet(fmla, 
                          cars_train,
                          family = "binomial"))
## Call:
## cva.glmnet.formula(formula = fmla, data = cars_train, family = "binomial")
## 
## Model fitting options:
##     Sparse model matrix: FALSE
##     Use model.frame: FALSE
##     Alpha values: 0 0.001 0.008 0.027 0.064 0.125 0.216 0.343 0.512 0.729 1
##     Number of crossvalidation folds for lambda: 10

