# example 7.10 of section 7.3.1 
# (example 7.10 of section 7.3.1)  : Advanced Data Preparation : Building single-variable models : Building single variable models from categorical features 
# Title: Recommended production of single variable models 

cross_frame_experiment <- vtreat::mkCrossFrameCExperiment(
  dTrainAll, 
  varlist = catVars, 
  outcomename = "churn", 
  outcometarget = 1, 
  codeRestriction = "catB",
  verbose = FALSE,
  parallelCluster = cl)

dTrainAll_treated <- cbind(
  dTrainAll,
  cross_frame_experiment$crossFrame)

treatment_plan <- cross_frame_experiment$treatments

dTest_treated <- cbind(
  dTest,
  prepare(treatment_plan, 
          dTest[, catVars, drop = FALSE],
          parallelCluster = cl))
          
length(unique(dTrainAll_treated$Var218))
## [1] 3
calcAUC(dTrainAll_treated$Var218_catB, dTrainAll_treated$churn == 1)
## [1] 0.5581087
calcAUC(dTest_treated$Var218_catB, dTest_treated$churn == 1)
## [1] 0.5690049


length(unique(dTrainAll_treated$Var222))
## [1] 4094
calcAUC(dTrainAll_treated$Var222_catB, dTrainAll_treated$churn == 1)
## [1] 0.5453733
calcAUC(dTest_treated$Var222_catB, dTest_treated$churn == 1)
## [1] 0.5374144

