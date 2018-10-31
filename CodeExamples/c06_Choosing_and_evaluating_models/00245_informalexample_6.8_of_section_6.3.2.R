# informalexample 6.8 of section 6.3.2 
# (informalexample 6.8 of section 6.3.2)  : Choosing and evaluating models : Evaluating models : Evaluating scoring models 

error_sq <- (d$prediction - d$y)^2
( RMSE <- sqrt(mean(error_sq)) )
## [1] 7.266361

