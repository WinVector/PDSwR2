# example 8.27 of section 8.3.1 
# (example 8.27 of section 8.3.1)  : Linear and logistic regression : Regularization : An Example of Quasi-separation 
# Title: The logistic model's test performance 

cars_test$pred_glm <- predict(model_glm, 
                             newdata=cars_test,
                             type = "response")  	# Note: 1 
                             
library(sigr)    	# Note: 2  

confmat <- function(dframe, predvar) {     	# Note: 3 
  cmat <- table(truth = ifelse(dframe$fail, "unacceptable", "passed"),
               prediction = ifelse(dframe[[predvar]] > 0.5, 
                                   "unacceptable", "passed"))
  accuracy <- sum(diag(cmat))/sum(cmat)
  deviance <- calcDeviance(dframe[[predvar]], dframe$fail)
  
  list(confusion_matrix = cmat,
       accuracy = accuracy,
       deviance = deviance)
 
}

confmat(cars_test, "pred_glm")   
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
## [1] 97.14902

# Note 1: 
#   Get the model's predictions on the test set 

# Note 2: 
#   For deviance calculation 

# Note 3: 
#   Convenience function to print confusion matrix,  
#   accuracy, and deviance 

