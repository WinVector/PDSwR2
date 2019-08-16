# example 6.15 of section 6.3.2 
# (example 6.15 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: Fit a model to the iris training data 

source("lime_iris_example.R")                   	# Note: 1  
                                        
input <- as.matrix(train[, 1:4])                    	# Note: 2 
model <- fit_iris_example(input, train$class)

# Note 1: 
#   Load the convenience function. 

# Note 2: 
#   The input to the model is the first four 
#   columns of the training data, converted to a 
#   matrix. 

