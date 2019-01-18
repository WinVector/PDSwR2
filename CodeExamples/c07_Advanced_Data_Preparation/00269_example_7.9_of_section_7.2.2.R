# example 7.9 of section 7.2.2 
# (example 7.9 of section 7.2.2)  : Advanced Data Preparation : Building single-variable models : Using categorical features 
# Title: Recommended production of single varaible models 

cross_frame_experiment <- vtreat::mkCrossFrameCExperiment(
  dTrainAll, 
  varlist = catVars, 
  outcomename = "churn", 
  outcometarget = 1, 
  codeRestriction = "catB",
  verbose = FALSE,
  parallelCluster = cl)

dTrainAll <- cbind(
  dTrainAll,
  cross_frame_experiment$crossFrame)

treatment_plan <- cross_frame_experiment$treatments

dTest <- cbind(
  dTest,
  prepare(treatment_plan, 
          dTest[, catVars, drop = FALSE],
          parallelCluster = cl))

