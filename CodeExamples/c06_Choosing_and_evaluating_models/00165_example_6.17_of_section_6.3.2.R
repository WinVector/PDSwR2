# example 6.17 of section 6.3.2 
# (example 6.17 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: Build a LIME explainer from the model and training data 

library(lime)
explainer <- lime(train[,1:4],                       	# Note: 1 
                     model = model, 
                     bin_continuous = TRUE,          	# Note: 2 
                     n_bins = 10)                    	# Note: 3

# Note 1: 
#   Build the explainer from the training data. 

# Note 2: 
#   Bin the continuous variables when making explanations. 

# Note 3: 
#   Use 10 bins. 

