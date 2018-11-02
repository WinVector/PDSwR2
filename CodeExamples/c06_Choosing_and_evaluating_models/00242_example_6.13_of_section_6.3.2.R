# example 6.13 of section 6.3.2 
# (example 6.13 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: Evaluate the iris model 

predictions <- predict(model, newdata=as.matrix(test[,1:4])) 	# Note: 1 
                                        
teframe <- data.frame(isSetosa = test$class == 1, 
                                    pred = predictions)                   	# Note: 2 
with(teframe, table(truth=isSetosa, pred=pred > 0.5))    	# Note: 3 
                                        
##        pred
## truth   FALSE TRUE
##   FALSE    25    0
##   TRUE      0   11

# Note 1: 
#   Make predictions on the test data. The predictions are the  
#   probability that an iris is a setosa. 

# Note 2: 
#   A data frame of predictions and actual outcome. 

# Note 3: 
#   Examine the confusion matrix. 

