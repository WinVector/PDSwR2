# example 8.4 of section 8.3 
# (example 8.4 of section 8.3)  : Advanced data preparation : Basic data preparation for classification 
# Title: Basic data preparation for classification 

library("vtreat")                                               	# Note: 1 

(parallel_cluster <- parallel::makeCluster(parallel::detectCores()))  	# Note: 2 

treatment_plan <- vtreat::designTreatmentsC(                        	# Note: 3 
  dTrain, 
  varlist = vars, 
  outcomename = "churn", 
  outcometarget = 1, 
  verbose = FALSE,
  parallelCluster = parallel_cluster)

# Note 1: 
#   Attach the vtreat package for functions such as designTreatmentsC(). 

# Note 2: 
#   Start up a parallel cluster to speed up 
#   calculation. If you don’t want a parallel cluster, just set 
#   parallel_cluster to NULL. 

# Note 3: 
#   Use designTreatmentsC() to learn the treatment plan from the training data. For a dataset of the size and complexity of KDD2009, this can take a few minutes. 

