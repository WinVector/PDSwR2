# example 10.7 of section 10.1.4 
# (example 10.7 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 
# Title: Cross-validate to determine model size 

library(xgboost)

cv <- xgb.cv(input,                                        	# Note: 1  
            label = train$class,                           	# Note: 2  
              params = list(
                objective = "binary:logistic"             	# Note: 3 
              ),
              nfold = 5,                                    	# Note: 4 
              nrounds = 100,                                	# Note: 5 
              print_every_n = 10,                           	# Note: 6 
              metrics = "logloss")                      	# Note: 7  

evalframe <- as.data.frame(cv$evaluation_log)               	# Note: 8  
head(evalframe)                                              	# Note: 9  

##   iter train_logloss_mean train_logloss_std test_logloss_mean
## 1    1          0.4547800      7.758350e-05         0.4550578
## 2    2          0.3175798      9.268527e-05         0.3179284
## 3    3          0.2294212      9.542411e-05         0.2297848
## 4    4          0.1696242      9.452492e-05         0.1699816
## 5    5          0.1277388      9.207258e-05         0.1280816
## 6    6          0.0977648      8.913899e-05         0.0980894
##   test_logloss_std
## 1      0.001638487
## 2      0.002056267
## 3      0.002142687
## 4      0.002107535
## 5      0.002020668
## 6      0.001911152

(NROUNDS <- which.min(evalframe$test_logloss_mean))        	# Note: 10 
## [1] 18

library(ggplot2)
ggplot(evalframe, aes(x = iter, y = test_logloss_mean)) + 
  geom_line() + 
  geom_vline(xintercept = NROUNDS, color = "darkred", linetype = 2) + 
  ggtitle("Cross-validated log loss as a function of ensemble size")

# Note 1: 
#   The input matrix. 

# Note 2: 
#   The class labels, which must also be numeric  
#   (1 for setosa, 0 for not setosa). 

# Note 3: 
#   Use the objective "binary:logistic" for binary  
#   classification, "reg:linear" for regression. 

# Note 4: 
#   Use 5-fold cross-validation. 

# Note 5: 
#   Build an ensemble of 100 trees. 

# Note 6: 
#   Print a message every 10th iteration  
#   (use verbose = FALSE for no messages). 

# Note 7: 
#   Use minimum cross-validated logloss (related to deviance)  
#   to pick the optimum number of trees. for regression,  
#   use metrics = "rmse" 

# Note 8: 
#   Get the performance log. 

# Note 9: 
#   evalframe records the training and cross-validated  
#   logloss as a function of the number of trees. 

# Note 10: 
#   Find the number of trees that gave the minimum  
#   cross-validated logloss. 

