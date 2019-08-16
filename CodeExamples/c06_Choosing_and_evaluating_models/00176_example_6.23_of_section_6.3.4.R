# example 6.23 of section 6.3.4 
# (example 6.23 of section 6.3.4)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Train the text classifier 
# Title: Evaluate the review classifier 

c(test_txt, test_labels) %<-%  readRDS("IMDBtest.RDS")                        	# Note: 1 
dtm_test <- make_matrix(test_txt, vocab)                                      	# Note: 2 
                                
predicted <- predict(model, newdata=dtm_test)                                 	# Note: 3 
                                
teframe <- data.frame(true_label = test_labels, 
                         pred = predicted)                                    	# Note: 4 
                                
(cmat <- with(teframe, table(truth=true_label, pred=pred > 0.5)))           	# Note: 5 
                                
##      pred
## truth FALSE  TRUE
##     0 10836  1664
##     1  1485 11015
                                
sum(diag(cmat))/sum(cmat)                                                     	# Note: 6 
## [1] 0.87404
                   
library(WVPlots)                   
DoubleDensityPlot(teframe, "pred", "true_label", 
                  "Distribution of test prediction scores")                   	# Note: 7

# Note 1: 
#   Read in the test corpus. 

# Note 2: 
#   Convert the corpus to a document-term matrix. 

# Note 3: 
#   Make predictions (probabilities) on the test corpus. 

# Note 4: 
#   Create a frame with true and predicted labels. 

# Note 5: 
#   Compute the confusion matrix. 

# Note 6: 
#   Compute the accuracy. 

# Note 7: 
#   Plot the distribution of predictions. 

