# example 7.33 of section 7.3.3 
# (example 7.33 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 
# Title: Fitting and evaluating the elastic net model 

(model_enet <- cv.glmnet(fmla, 
                       cars_train,
                       alpha = best_alpha,
                       family = "binomial"))

## Call:
## cv.glmnet.formula(formula = fmla, data = cars_train, alpha = best_alpha, 
##     family = "binomial")
## 
## Model fitting options:
##     Sparse model matrix: FALSE
##     Use model.frame: FALSE
##     Number of crossvalidation folds: 10
##     Alpha: 0.729
##     Deviance-minimizing lambda: 0.0002907102  (+1 SE): 0.002975509

prediction <- predict(model_enet,
                      newdata = cars_test,
                      type = "response")

cars_test$pred_enet <- as.numeric(prediction)

confmat(cars_test, "pred_enet")

## $confusion_matrix
##               prediction
## truth          passed unacceptable
##   passed          150            9
##   unacceptable     17          323
## 
## $accuracy
## [1] 0.9478958
## 
## $deviance
## [1] 117.7701

