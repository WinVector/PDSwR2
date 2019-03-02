# example 8.5 of section 8.3 
# (example 8.5 of section 8.3)  : Advanced Data Preparation : Basic data preparation for classification 
# Title: Basic data preparation for classification 

library("vtreat")  	# Note: 1 

(cl <- parallel::makeCluster(parallel::detectCores())) 	# Note: 2 

treatment_plan <- vtreat::designTreatmentsC( 	# Note: 3 
  dTrain, 
  varlist = vars, 
  outcomename = "churn", 
  outcometarget = 1, 
  verbose = FALSE,
  parallelCluster = cl)

# Note 1: 
#   Attache the vtreat package for functions such as designTreatmentsC(). 

# Note 2: 
#   Start up a parallel cluster to speed up calculation. If you don't want a parallel cluster just set cl to NULL. 

# Note 3: 
#   Use designTreatmentsC() to learn the treatment plan from the training data. 

