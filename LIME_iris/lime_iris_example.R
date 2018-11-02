#
# Convenience function for running iris example from section 6.3.2
# of Practical Data Science with R, Second Edition
#

# if this fails, make sure xgboost is installed:
# install.packages("xgboost")
library(xgboost)

#
# Input:
# - variable_matrix: matrix of input data
# - labelvvec: numeric vector of class labels (1 is positive class)
#
# Returns:
# - xgboost model
#
fit_iris_example = function(variable_matrix, labelvec) {

  cv = xgb.cv(variable_matrix, label = labelvec,
              params=list(
                objective="binary:logistic"
              ),
              nfold=5,
              nrounds=100,
              print_every_n=10,
              metrics="logloss")

  evalframe = as.data.frame(cv$evaluation_log)
  NROUNDS = which.min(evalframe$test_logloss_mean)

  model = xgboost(data=variable_matrix, label=labelvec,
                  params=list(
                    objective="binary:logistic"
                  ),
                  nrounds=NROUNDS,
                  verbose=FALSE)

  model
}

