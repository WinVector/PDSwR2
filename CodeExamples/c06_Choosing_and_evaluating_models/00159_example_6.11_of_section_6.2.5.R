# example 6.11 of section 6.2.5 
# (example 6.11 of section 6.2.5)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Calculating log likelihood 

ylogpy <- function(y, py) {                       	# Note: 1 
  logpy = ifelse(py > 0, log(py), 0)
  y*logpy
}

y <- spamTest$spam == 'spam'                  	# Note: 2 

sum(ylogpy(y, spamTest$pred) +                    	# Note: 3 
      ylogpy(1-y, 1-spamTest$pred))
## [1] -134.9478

# Note 1: 
#   A function to calculate y * log(py), with the convention that 0 * log(0) = 0. 

# Note 2: 
#   Get the class labels of the test set as TRUE/FALSE, which R treats as 1/0 in arithmetic operations. 

# Note 3: 
#   Calculate the log likelihood of the model’s predictions on the test set. 

