# example 10.8 of section 10.1.4 
# (example 10.8 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 
# Title: Fit an xgboost model 

model <- xgboost(data = input, 
                 label = train$class,   
                  params = list(
                    objective = "binary:logistic" 
                  ),
                  nrounds = NROUNDS,
                  verbose = FALSE)

test_input <- as.matrix(test[, 1:4])               	# Note: 1 
pred <- predict(model,  test_input)                	# Note: 2 

accuracyMeasures(pred, test$class) 

##   model accuracy f1   dev.norm
## 1 model        1  1 0.03458392

# Note 1: 
#   Create the input matrix for the test data. 

# Note 2: 
#   Make predictions 

