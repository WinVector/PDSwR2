# example 6.22 of section 6.3.4 
# (example 6.22 of section 6.3.4)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Train the text classifier 
# Title: Convert the texts and fit the model 

source("lime_imdb_example.R")
                                
vocab <- create_pruned_vocabulary(texts)          	# Note: 1 
dtm_train <- make_matrix(texts, vocab)            	# Note: 2 
model <- fit_imdb_model(dtm_train, labels)        	# Note: 3

# Note 1: 
#   Create the vocabulary from the training data. 

# Note 2: 
#   Create the document-term matrix of the training corpus. 

# Note 3: 
#   Train the model. 

