# informalexample 7.31 of section 7.3.3 
# (informalexample 7.31 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 

prediction <- predict(model_ridge,
                      newdata = cars_test,
                      type="response",
                      s = model_ridge$lambda.min)

