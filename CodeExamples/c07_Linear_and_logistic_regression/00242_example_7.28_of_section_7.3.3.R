# example 7.28 of section 7.3.3 
# (example 7.28 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 
# Title: Looking at the ridge model’s test performance 

prediction <- predict(model_ridge,
                     newdata = cars_test,
                     type = "response")

cars_test$pred_ridge <- as.numeric(prediction)       	# Note: 1 

confmat(cars_test, "pred_ridge")
## $confusion_matrix
##               prediction
## truth          passed unacceptable
##   passed          147           12
##   unacceptable     16          324
## 
## $accuracy
## [1] 0.9438878
## 
## $deviance
## [1] 191.9248

# Note 1: 
#   The prediction variable is a 1-d matrix; convert it to a vector 
#   before adding it to the cars_test data frame. 

