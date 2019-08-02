# example 6.3 of section 6.2.3 
# (example 6.3 of section 6.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: Spam confusion matrix 

confmat_spam <- table(truth = spamTest$spam,
                         prediction = ifelse(spamTest$pred > 0.5, 
                         "spam", "non-spam"))
print(confmat_spam)
##          prediction
## truth   non-spam spam
##   non-spam   264   14
##   spam        22  158

