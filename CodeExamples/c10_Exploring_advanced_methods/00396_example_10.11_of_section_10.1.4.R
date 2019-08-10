# example 10.11 of section 10.1.4 
# (example 10.11 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 
# Title: Fit and apply an xgboost model for birth weight 

birthwt_model <- xgboost(as.matrix(train_treated), 
                         train$DBWT,
                         params = list(
                           objective = "reg:linear",
                           base_score = mean(train$DBWT)
                         ),
                         nrounds = 50,
                         verbose = FALSE)

test_treated <- prepare(treatplan, test)
pred <- predict(birthwt_model, as.matrix(test_treated))

