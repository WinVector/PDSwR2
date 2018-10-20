# informalexample 6.8 of section 6.3.5 
# (informalexample 6.8 of section 6.3.5)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Explaining the classifier's predictions 

# explain the predictions
                                explanation <- lime::explain(sample_case, 
                                explainer, 
                                n_labels = 1, 
                                n_features = 5)
                                
                                # so I can print one later
                                saveRDS(explanation, "imdbExplanation2.RDS")
                                
                                plot_features(explanation)

