# example 6.6 of section 6.2.4 
# (example 6.6 of section 6.2.4)  : Choosing and evaluating models : Evaluating models : Evaluating scoring models 
# Title: Fit the cricket model and make predictions 

crickets <- read.csv("cricketchirps/crickets.csv") 

cricket_model <- lm(temperatureF ~ chirp_rate, data=crickets) 
crickets$temp_pred <- predict(cricket_model, newdata=crickets)

