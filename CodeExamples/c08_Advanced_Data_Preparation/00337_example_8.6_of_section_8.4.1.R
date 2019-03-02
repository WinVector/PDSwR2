# example 8.6 of section 8.4.1 
# (example 8.6 of section 8.4.1)  : Advanced Data Preparation : Advanced data preparation for classification : Using mkCrossFrameCExperiment() 
# Title: Advanced data preparation for classification 

library("vtreat")

cl <- parallel::makeCluster(parallel::detectCores())

cross_frame_experiment <- vtreat::mkCrossFrameCExperiment(
  dTrainAll, 
  varlist = vars, 
  outcomename = "churn", 
  outcometarget = 1, 
  verbose = FALSE,
  parallelCluster = cl)

dTrainAll_treated <- cross_frame_experiment$crossFrame
treatment_plan <- cross_frame_experiment$treatments
score_frame <- treatment_plan$scoreFrame

dTest_treated <- prepare(treatment_plan, 
                         dTest,
                         parallelCluster = cl)

