# example 6.27 of section 6.3.5 
# (example 6.27 of section 6.3.5)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Explaining the classifier’s predictions 
# Title: Examining two more reviews 

casenames <-  c("test_12034", "test_10294")
sample_cases <- test_txt[casenames]
pred_probs <- predict(model, newdata=make_matrix(sample_cases, vocab))
list(texts = sample_cases,
     labels = test_labels[casenames],  
     predictions = round(pred_probs)) 
                    
## $texts
## test_12034 
## "I don't know why I even watched this film. I think it was because I liked the idea of 
## the scenery and was hoping the film would be as good. Very boring and pointless." 
##      
## test_10294 
## "To anyone who likes the TV series: forget the movie. The jokes are bad and some topics 
## are much too sensitive to laugh about it. <br /><br />We have seen 
## much better acting by R. Dueringer in \"Hinterholz 8\"".
## 
## $labels
## test_12034 test_10294                                        	# Note: 1 
##          0          0 
## 
## $predictions                                                  	# Note: 2 
## [1] 0 1
                       
explanation <- lime::explain(sample_cases, 
                                    explainer, 
                                    n_labels = 1, 
                                    n_features = 5)
                                
plot_features(explanation)
plot_text_explanations(explanation)

# Note 1: 
#   Both these reviews are negative. 

# Note 2: 
#   The model misclassified the second review. 

