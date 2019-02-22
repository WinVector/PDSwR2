# example 7.15 of section 7.4.1 
# (example 7.15 of section 7.4.1)  : Advanced Data Preparation : Building models using many variables : Variable selection 
# Title: Basic variable re-coding and selection 

cross_frame_experiment <- vtreat::mkCrossFrameCExperiment( 	# Note: 1 
  dTrainAll, 
  varlist = vars,                    	# Note: 2 
  outcomename = "churn", 
  outcometarget = 1,
  verbose = FALSE,
  customCoders = list('c.spline.num' = vtreat::spline_variablec), 	# Note: 3 
  parallelCluster = cl,
  scale = TRUE)  

dTrainAll_treated <- patch_columns_into_frame( 	# Note: 4 
  dTrainAll,
  cross_frame_experiment$crossFrame)

treatment_plan <- cross_frame_experiment$treatments 	# Note: 5 

dTest_treated <- patch_columns_into_frame( 	# Note: 6 
  dTest,
  prepare(treatment_plan, 
          dTest[, vars, drop = FALSE],
          parallelCluster = cl,
          scale = TRUE))

score_frame <- treatment_plan$scoreFrame 	# Note: 7 


selected <- score_frame[  	# Note: 8 
  score_frame$sig<1/nrow(score_frame), 
  , drop = FALSE]
newvars <- selected$varName

# Note 1: 
#   Use vtreat::mkCrossFrameCExperiment to prepare cleaned versions of all variables. 

# Note 2: 
#   Specify which columns are to be considered variables here. 

# Note 3: 
#   Add in the spline custom coder to get re-shaped numeric variables, we demonstrate the concept in the next section. 

# Note 4: 
#   Build a data frame with original training columns plus new cleaned and derived columns. 

# Note 5: 
#   Get the treatment object so we can apply it to test data or new data. 

# Note 6: 
#   Augment the test data frame with cleaned and derived columns. 

# Note 7: 
#   Get the variable scoring frame out of the treatment plan so we can evaluate variable utility. 

# Note 8: 
#   Select any variables that appear to be statistically significant. The 1/number-of-rows criterion means we only expect a few false selections. 

