# informalexample 10.7 of section 10.1.4 
# (informalexample 10.7 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 

cv <- xgb.cv(dtm_train, 
             label = labels,
             params = list(
               objective = "binary:logistic"
               ),
             nfold = 5,
             nrounds = 500,
             early_stopping_rounds = 20,             	# Note: 1 
             print_every_n = 10,
             metrics = "logloss")    
             
evalframe <- as.data.frame(cv$evaluation_log)
(NROUNDS <- which.min(evalframe$test_logloss_mean))             
## [1] 319

# Note 1: 
#   Stop early if performance doesn’t improve for 
#   20 rounds. 

