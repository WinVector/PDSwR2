# informalexample 6.6 of section 6.3.5 
# (informalexample 6.6 of section 6.3.5)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Explaining the classifier's predictions 

casename =  c("test_12034", "test_10294")
                                sample_case = test_txt[casename]
                                pred_probs = predict(model, newdata=make_matrix(sample_case, vocab))
                                list(texts = sample_case,
                                labels = test_labels[casename],  # both negative reviews
                                predictions = round(pred_probs)) # the model misclassified the second review

