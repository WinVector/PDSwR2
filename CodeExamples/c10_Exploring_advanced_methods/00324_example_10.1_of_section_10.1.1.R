# example 10.1 of section 10.1.1 
# (example 10.1 of section 10.1.1)  : Exploring advanced methods : Tree-based methods : A basic decision tree 
# Title: Preparing Spambase data and evaluating a decision tree model 

spamD <- read.table('spamD.tsv', header = TRUE, sep = '\t')    		# Note: 1 
spamD$isSpam <- spamD$spam == 'spam'
spamTrain <- subset(spamD, spamD$rgroup >= 10)
spamTest <- subset(spamD, spamD$rgroup < 10)

spamVars <- setdiff(colnames(spamD), list('rgroup', 'spam', 'isSpam'))
library(wrapr)
spamFormula <- mk_formula("isSpam", spamVars)                        	# Note: 2 
                   
loglikelihood <- function(y, py) {                                     	# Note: 3 
  pysmooth <- ifelse(py == 0, 1e-12,
                  ifelse(py == 1, 1 - 1e-12, py))

  sum(y * log(pysmooth) + (1 - y) * log(1 - pysmooth))
}


accuracyMeasures <- function(pred, truth, name = "model") {            	# Note: 4 
  dev.norm <- -2 * loglikelihood(as.numeric(truth), pred) / length(pred)    	# Note: 5 
  ctable <- table(truth = truth,
                 pred = (pred > 0.5))                                       	# Note: 6 
  accuracy <- sum(diag(ctable)) / sum(ctable)
  precision <- ctable[2, 2] / sum(ctable[, 2])
  recall <- ctable[2, 2] / sum(ctable[2, ])
  f1 <- 2 * precision * recall / (precision + recall)
  data.frame(model = name, accuracy = accuracy, f1 = f1, dev.norm)
}


library(rpart)                                                              	# Note: 7 
treemodel <- rpart(spamFormula, spamTrain, method = "class")

library(rpart.plot)                                                     	# Note: 8 
rpart.plot(treemodel, type = 5, extra = 6)     

predTrain <- predict(treemodel, newdata = spamTrain)[, 2]                	# Note: 9 

trainperf_tree <- accuracyMeasures(predTrain,                      		# Note: 10  
                 spamTrain$spam == "spam",
                 name = "tree, training")

predTest <- predict(treemodel, newdata = spamTest)[, 2]
testperf_tree <- accuracyMeasures(predTest,
                 spamTest$spam == "spam",
                 name = "tree, test")

# Note 1: 
#   Load the data and split into training (90% of data)  
#   and test (10% of data) sets. 

# Note 2: 
#   Use all the features and do binary classification,  
#   where TRUE corresponds to spam documents. 

# Note 3: 
#   A function to calculate log likelihood  
#   (for calculating deviance). 

# Note 4: 
#   A function to calculate and return various measures  
#   on the model: normalized deviance, prediction accuracy, and f1. 

# Note 5: 
#   Normalize the deviance by the number of data points  
#   so that we can compare the deviance across training and test sets. 

# Note 6: 
#   Convert the class probability estimator into a  
#   classifier by labeling documents that score greater than 0.5 as  
#   spam. 

# Note 7: 
#   Load the rpart library and fit a decision tree  
#   model. 

# Note 8: 
#   For plotting the tree. 

# Note 9: 
#   Get the predicted probabilities of the class 
#   "spam". 

# Note 10: 
#   Evaluate the decision tree model against the  
#   training and test sets. 

