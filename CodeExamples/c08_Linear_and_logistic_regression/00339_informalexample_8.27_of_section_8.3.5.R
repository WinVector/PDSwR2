# informalexample 8.27 of section 8.3.5 
# (informalexample 8.27 of section 8.3.5)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 

prediction <- predict(model_ridge,
                      newdata = cars_test,
                      type="response",
                      s = model_ridge$lambda.min)

