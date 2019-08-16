# example 10.2 of section 10.1.2 
# (example 10.2 of section 10.1.2)  : Exploring advanced methods : Tree-based methods : Using bagging to improve prediction 
# Title: Bagging decision trees 

ntrain <- dim(spamTrain)[1] 
n <- ntrain                                                	# Note: 1  
ntree <- 100

samples <- sapply(1:ntree,                                	# Note: 2  
                 FUN = function(iter)
                   { sample(1:ntrain, size = n, replace = TRUE) })

treelist <-lapply(1:ntree,                                 	# Note: 3  
                  FUN = function(iter) {
                    samp <- samples[, iter];
                    rpart(spamFormula, spamTrain[samp, ], method = "class") })

predict.bag <- function(treelist, newdata) {               	# Note: 4  
  preds <- sapply(1:length(treelist),
                 FUN = function(iter) {
                   predict(treelist[[iter]], newdata = newdata)[, 2] })
  predsums <- rowSums(preds)
  predsums / length(treelist)
}

pred <- predict.bag(treelist, newdata = spamTrain)
trainperf_bag <- accuracyMeasures(pred,                    	# Note: 5  
                 spamTrain$spam == "spam",
                 name = "bagging, training")

pred <- predict.bag(treelist, newdata = spamTest)
testperf_bag <- accuracyMeasures(pred,
                 spamTest$spam == "spam",
                 name = "bagging, test")

perftable <- rbind(trainperf_bag, testperf_bag)
pandoc.table(perftable, justify = perf_justify)
## 
## 
## model                 accuracy       f1   dev.norm
## ------------------- ---------- -------- ----------
## bagging, training       0.9167   0.8917     0.5080
## bagging, test           0.9127   0.8824     0.5793

# Note 1: 
#   Use bootstrap samples the same size as the training  
#   set, with 100 trees. 

# Note 2: 
#   Build the bootstrap samples by sampling the row indices of spamTrain with replacement. Each  
#   column of the matrix samples represents the row indices into spamTrain  
#   that comprise the bootstrap sample. 

# Note 3: 
#   Train the individual decision trees and return them  
#   in a list. Note: this step can take a few minutes. 

# Note 4: 
#   predict.bag assumes the underlying classifier returns decision probabilities, not  
#   decisions. predict.bag takes the mean of the predictions of all the individual trees 

# Note 5: 
#   Evaluate the bagged decision trees against the  
#   training and test sets. 

