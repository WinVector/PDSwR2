# informalexample 10.6 of section 10.1.4 
# (informalexample 10.6 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 

source("lime_imdb_example.R")
vocab <- create_pruned_vocabulary(texts)  
dtm_train <- make_matrix(texts, vocab)

