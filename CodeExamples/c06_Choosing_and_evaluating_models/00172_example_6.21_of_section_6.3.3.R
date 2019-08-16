# example 6.21 of section 6.3.3 
# (example 6.21 of section 6.3.3)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : LIME for text classification 
# Title: Loading the IMDB training data 

library(zeallot)                                     	# Note: 1 
                                
c(texts, labels) %<-% readRDS("IMDBtrain.RDS")   	# Note: 2

# Note 1: 
#   Load the zeallot library. Call install.packages("zeallot") if this fails. 

# Note 2: 
#   The command “read(IMDBtrain.RDS)” returns a list object. The zeallot assignment arrow %<-% 
#   unpacks the list into two elements: “texts” is a 
#   character vector of reviews and “labels” is a 0/1 
#   vector of class labels. The label 1 designates a 
#   positive review. 

