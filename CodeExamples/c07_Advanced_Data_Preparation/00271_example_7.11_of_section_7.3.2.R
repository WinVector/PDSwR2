# example 7.11 of section 7.3.2 
# (example 7.11 of section 7.3.2)  : Advanced Data Preparation : Building single-variable models : Building single variable models from numeric features 
# Title: Scoring numeric variables by AUC 

cross_frame_experiment <- vtreat::mkCrossFrameCExperiment(
  dTrainAll, 
  varlist = numericVars, 
  outcomename = "churn", 
  outcometarget = 1, 
  customCoders = list('c.spline.num' = vtreat::spline_variablec),
  codeRestriction = c("spline",
                      "clean", "isBAD"),
  verbose = FALSE,
  parallelCluster = cl)

dTrainAll_treated <- patch_frame(
  dTrainAll,
  cross_frame_experiment$crossFrame)

treatment_plan <- cross_frame_experiment$treatments

dTest_treated <- patch_frame(
  dTest,
  prepare(treatment_plan, 
          dTest[, numericVars, drop = FALSE],
          parallelCluster = cl))
                                
 calcAUC(dTrainAll_treated$Var73_spline, dTrainAll_treated$churn == 1)
## [1] 0.6064692
calcAUC(dTest_treated$Var73_spline, dTest_treated$churn == 1)
## [1] 0.5918791

