# example 6.26 of section 6.3.5 
# (example 6.26 of section 6.3.5)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Explaining the classifier’s predictions 
# Title: Explain the model's prediction 

explanation <- lime::explain(sample_case, 
                       explainer, 
                       n_labels = 1, 
                       n_features = 5)

plot_features(explanation)

