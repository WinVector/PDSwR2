# example 8.6 of section 8.4.1 
# (example 8.6 of section 8.4.1)  : Advanced data preparation : Advanced data preparation for classification : Using mkCrossFrameCExperiment() 
# Title: Advanced data preparation for classification 

library("vtreat")

parallel_cluster <- parallel::makeCluster(parallel::detectCores())

cross_frame_experiment <- vtreat::mkCrossFrameCExperiment(
  dTrainAll, 
  varlist = vars, 
  outcomename = "churn", 
  outcometarget = 1, 
  verbose = FALSE,
  parallelCluster = parallel_cluster)

dTrainAll_treated <- cross_frame_experiment$crossFrame 	# Note: 1 
treatment_plan <- cross_frame_experiment$treatments
score_frame <- treatment_plan$scoreFrame

dTest_treated <- prepare(treatment_plan, 	# Note: 2 
                         dTest,
                         parallelCluster = parallel_cluster)

# Note 1: 
#   We will use the cross-frame to train the logistic regression model. 

# Note 2: 
#   Prepare the test set so we can call the model on it. 

