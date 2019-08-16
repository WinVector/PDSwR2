# example 6.16 of section 6.3.2 
# (example 6.16 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: Evaluate the iris model 

predictions <- predict(model, newdata=as.matrix(test[,1:4])) 		# Note: 1 
                                        
teframe <- data.frame(isSetosa = ifelse(test$class == 1,         	# Note: 2 
                                        "setosa",
                                        "not setosa"),
                      pred = ifelse(predictions > 0.5, 
                                "setosa",
                                "not setosa"))
with(teframe, table(truth=isSetosa, pred=pred))    	          	# Note: 3 
                                        
##             pred
## truth        not setosa setosa
##   not setosa         25      0
##   setosa              0     11

# Note 1: 
#   Make predictions on the test data. The predictions are the  
#   probability that an iris is a setosa. 

# Note 2: 
#   A data frame of predictions and actual outcome. 

# Note 3: 
#   Examine the confusion matrix. 

