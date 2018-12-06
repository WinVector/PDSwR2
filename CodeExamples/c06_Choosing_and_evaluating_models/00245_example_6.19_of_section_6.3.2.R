# example 6.19 of section 6.3.2 
# (example 6.19 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: Explain the iris example 

explanation <- lime::explain(example, 
                                explainer, 
                                n_labels = 1,       	# Note: 1 
                                n_features = 4)     	# Note: 2

# Note 1: 
#   The number of labels to explain; use 1 for binary classification. 

# Note 2: 
#   The number of features to use when fitting the explanation. 

