# example 7.7 of section 7.3.2 
# (example 7.7 of section 7.3.2)  : Advanced Data Preparation : Building single-variable models : Building single variable models from categorical features 
# Title: Naive production of single varaible models 

(cl <- parallel::makeCluster(parallel::detectCores()))
                                        
## socket cluster with 4 nodes on host 'localhost'

treatment_plan <- vtreat::designTreatmentsC(
  dTrain, 
  varlist = catVars, 
  outcomename = "churn", 
  outcometarget = 1, 
  codeRestriction = "catB",
  verbose = FALSE,
  parallelCluster = cl)

patch_frame <- function(origstuff, newstuff) {
  if(ncol(newstuff)<=0) {
    return(origstuff)
  }
  trimed_cols <- setdiff(colnames(origstuff),
                            colnames(newstuff))
  if(length(trimed_cols)<=0) {
    return(newstuff)
  }
  trimmed <- origstuff[, trimed_cols, drop = FALSE]
  cbind(trimmed, newstuff)
}

dTrain_treated <- patch_frame(
  dTrain,
  prepare(treatment_plan, 
          dTrain[, catVars],
          parallelCluster = cl))

dCal_treated <- patch_frame(
  dCal,
  prepare(treatment_plan, 
          dCal[, catVars, drop = FALSE],
          parallelCluster = cl))

dTest_treated <- patch_frame(
  dTest,
  prepare(treatment_plan, 
          dTest[, catVars, drop = FALSE],
          parallelCluster = cl))

