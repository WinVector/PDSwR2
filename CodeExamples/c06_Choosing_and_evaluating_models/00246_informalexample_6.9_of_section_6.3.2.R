# informalexample 6.9 of section 6.3.2 
# (informalexample 6.9 of section 6.3.2)  : Choosing and evaluating models : Evaluating models : Evaluating scoring models 

error_sq <- (d$prediction - d$y)^2              
numerator <- sum(error_sq)
 
variance <- (mean(d$y) - d$y)^2
denominator = sum(variance)
 
(R2 <- 1 - numerator/denominator)
 ## [1] 0.9497645

