# example 6.20 of section 6.3.2 
# (example 6.20 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: More iris examples 

(example <- test[c(13, 24), 1:4]) 
 
##     Sepal.Length Sepal.Width Petal.Length Petal.Width
## 58           4.9         2.4          3.3         1.0
## 110          7.2         3.6          6.1         2.5
   
test$class[c(13,24)]                                            	# Note: 1 
## [1] 0 0                                              
   
round(predict(model, newdata=as.matrix(example)))               	# Note: 2 
## [1] 0 0  
  
explanation <- explain(example, 
                          explainer, 
                          n_labels = 1,
                          n_features = 4, 
                          kernel_width = 0.5)  
                          
plot_features(explanation)

# Note 1: 
#   Both examples are negative (not setosa). 

# Note 2: 
#   The model predicts that both examples are negative. 

