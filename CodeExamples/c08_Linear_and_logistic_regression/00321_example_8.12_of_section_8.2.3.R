# example 8.12 of section 8.2.3 
# (example 8.12 of section 8.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Applying the logistic regression model 

train$pred <- predict(model, newdata=train, type="response")
test$pred <- predict(model, newdata=test, type="response")

