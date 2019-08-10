# example 6.24 of section 6.3.5 
# (example 6.24 of section 6.3.5)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Explaining the classifier’s predictions 
# Title: Build an explainer for a text classifier 

explainer <- lime(texts, model = model, 
                  preprocess = function(x) make_matrix(x, vocab))

