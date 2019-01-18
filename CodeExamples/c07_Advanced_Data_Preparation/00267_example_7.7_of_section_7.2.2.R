# example 7.7 of section 7.2.2 
# (example 7.7 of section 7.2.2)  : Advanced Data Preparation : Building single-variable models : Using categorical features 
# Title: Naive production of single varaible models 

(cl <- parallel::makeCluster(parallel::detectCores()))
# socket cluster with 4 nodes on host ‘localhost’

treatment_plan <- vtreat::designTreatmentsC(
  dTrain, 
  varlist = catVars, 
  outcomename = "churn", 
  outcometarget = 1, 
  codeRestriction = "catB",
  verbose = FALSE,
  parallelCluster = cl)

dTrain <- cbind(
  dTrain,
  prepare(treatment_plan, 
          dTrain[, catVars],
          parallelCluster = cl))

dTrain <- cbind(
  dTrain,
  prepare(treatment_plan, 
          dTrain[, catVars, drop = FALSE],
          parallelCluster = cl))

dCal <- cbind(
  dCal,
  prepare(treatment_plan, 
          dCal[, catVars, drop = FALSE],
          parallelCluster = cl))

dTest <- cbind(
  dTest,
  prepare(treatment_plan, 
          dTest[, catVars, drop = FALSE],
          parallelCluster = cl))

