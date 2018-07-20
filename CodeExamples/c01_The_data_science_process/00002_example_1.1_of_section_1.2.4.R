# example 1.1 of section 1.2.4 
# (example 1.1 of section 1.2.4)  : The data science process : Stages of a data science project : Model evaluation and critique 
# Title: Calculating the confusion matrix 

conf_mat <- table(actual = d$Loan.status, pred = predict(model, type = 'class'))  	# Note: 1 
conf_mat
##           pred
## actual     BadLoan GoodLoan
##   BadLoan       41      259
##   GoodLoan      13      687

(accuracy <- sum(diag(conf_mat)) / sum(conf_mat))   	# Note: 2 
## [1] 0.728
(precision <- conf_mat["BadLoan", "BadLoan"] / sum(conf_mat[, "BadLoan"])) 	# Note: 3 
## [1] 0.7592593
(recall <- conf_mat["BadLoan", "BadLoan"] / sum(conf_mat["BadLoan", ])) 	# Note: 4 
## [1] 0.1366667
(fpr <- conf_mat["GoodLoan","BadLoan"] / sum(conf_mat["GoodLoan", ])) 	# Note: 5 
## [1] 0.01857143

# Note 1: 
#   Create the confusion matrix. 

# Note 2: 
#   accuracy 
#   confusion matrix 
#   Overall model accuracy: 73% of the 
#   predictions were correct. 

# Note 3: 
#   precision 
#   confusion matrix 
#   Model precision: 76% of the 
#   applicants predicted as bad really did 
#   default. 

# Note 4: 
#   recall 
#   confusion matrix 
#   Model recall: the model found 14% of 
#   the defaulting loans. 

# Note 5: 
#   false positive rate 
#   confusion matrix 
#   False positive rate: 2% of the good 
#   applicants were mistakenly identified as 
#   bad. 

