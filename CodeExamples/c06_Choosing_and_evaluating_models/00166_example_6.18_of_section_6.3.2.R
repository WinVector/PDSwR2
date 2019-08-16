# example 6.18 of section 6.3.2 
# (example 6.18 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: An example iris datum 

(example <- test[5, 1:4, drop=FALSE])                     	# Note: 1 
##    Sepal.Length Sepal.Width Petal.Length Petal.Width
## 30          4.7         3.2          1.6         0.2
                                        
test$class[5] 
## [1] 1                                                  	# Note: 2 
                                        
round(predict(model, newdata = as.matrix(example))) 
## [1] 1                                                  	# Note: 3

# Note 1: 
#   A single row data frame. 

# Note 2: 
#   This example is a setosa. 

# Note 3: 
#   And the model predicts that it is setosa. 

