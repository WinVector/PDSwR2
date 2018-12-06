# example 6.5 of section 6.2.3 
# (example 6.5 of section 6.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: Comparing spam filter performance on data with different proportions of spam 

set.seed(234641)

N <- nrow(spamTest)
pull_out_ix <- sample.int(N, 100, replace=FALSE)
removed = spamTest[pull_out_ix,]                        	# Note: 1 


get_performance <- function(sTest) {                    	# Note: 2 
  proportion <- mean(sTest$spam == "spam")
  confmat_spam <- table(truth = sTest$spam,
                        prediction = ifelse(sTest$pred>0.5, 
                                            "spam",
                                            "non-spam"))
  
  precision <- confmat_spam[2,2]/sum(confmat_spam[,2])
  recall <- confmat_spam[2,2]/sum(confmat_spam[2,])
  list(spam_proportion = proportion,
       confmat_spam = confmat_spam,
       precision = precision, recall = recall)
}

                 
sTest <- spamTest[-pull_out_ix,]                  	# Note: 3 
get_performance(sTest)

## $spam_proportion
## [1] 0.3994413
## 
## $confmat_spam
##           prediction
## truth      non-spam spam
##   non-spam      204   11
##   spam           17  126
## 
## $precision
## [1] 0.919708
## 
## $recall
## [1] 0.8811189

get_performance(rbind(sTest, subset(removed, spam=="spam")))  	# Note: 4 

## $spam_proportion
## [1] 0.4556962
## 
## $confmat_spam
##           prediction
## truth      non-spam spam
##   non-spam      204   11
##   spam           22  158
## 
## $precision
## [1] 0.9349112
## 
## $recall
## [1] 0.8777778

get_performance(rbind(sTest, subset(removed, spam=="non-spam")))   	# Note: 5 

## $spam_proportion
## [1] 0.3396675
## 
## $confmat_spam
##           prediction
## truth      non-spam spam
##   non-spam      264   14
##   spam           17  126
## 
## $precision
## [1] 0.9
## 
## $recall
## [1] 0.8811189

# Note 1: 
#   Pull 100 emails out of the test set at random. 

# Note 2: 
#   A convenience function to print out the confusion matrix, precision, and recall of the filter on a test set. 

# Note 3: 
#   Look at performance on a test set with the same proportion of spam as the training data 

# Note 4: 
#   Add back only additional spam, so the test set has a higher proportion of spam than the training set 

# Note 5: 
#   Add back only non-spam, so the test set has a lower proportion of spam than the training set. 

