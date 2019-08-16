# example 6.25 of section 6.3.5 
# (example 6.25 of section 6.3.5)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Explaining the classifier’s predictions 
# Title: Explaining the model’s prediction on a review 

casename <- "test_19552"; 
sample_case <- test_txt[casename]
pred_prob <- predict(model, make_matrix(sample_case, vocab))
list(text = sample_case,
     label = test_labels[casename],  
     prediction = round(pred_prob) ) 
                       
## $text
## test_19552 
## "Great story, great music. A heartwarming love story that's beautiful to watch 
## and delightful to listen to. Too bad there is no soundtrack CD." 
## 
## $label
## test_19552 
##          1 
## 
## $prediction
## [1] 1

