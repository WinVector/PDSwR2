# example 6.7 of section 6.2.4 
# (example 6.7 of section 6.2.4)  : Choosing and evaluating models : Evaluating models : Evaluating scoring models 
# Title: Calculating RMSE 

error_sq <- (crickets$temp_pred - crickets$temperatureF)^2 
( RMSE <- sqrt(mean(error_sq)) )
## [1] 3.564149

