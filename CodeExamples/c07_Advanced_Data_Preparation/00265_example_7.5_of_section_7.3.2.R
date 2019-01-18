# example 7.5 of section 7.3.2 
# (example 7.5 of section 7.3.2)  : Advanced Data Preparation : Building single-variable models : Building single variable models from categorical features 
# Title: Build single-variable models for categorical variables 

library("vtreat")  	# Note: 1 

(treatment_plan <- vtreat::designTreatmentsC( 	# Note: 2 
  dTrain, 
  varlist = "Var218", 
  outcomename = "churn", 
  outcometarget = 1, 
  codeRestriction = "catB",
  verbose = FALSE))
##   origName code        rsq         sig extraModelDegrees
## 1   Var218 catB 0.01306577 1.35134e-62                 2
(example_data <-         	# Note: 3 
    data.frame(Var218 = c("cJvF", "UYBR", NA, "NewValue")))

##     Var218
## 1     cJvF
## 2     UYBR
## 3     <NA>
## 4 NewValue
scores <- prepare(  	# Note: 4 
  treatment_plan,
  example_data)

(scores <- cbind(  	# Note: 5 
  example_data, scores))
 
##     Var218 Var218_catB
## 1     cJvF  -0.2285864
## 2     UYBR   0.1284412
## 3     <NA>   1.5063227
## 4 NewValue   0.0000000

# Note 1: 
#   Attach the vtreat package to define the designTreatmentsC() and prepare() functions. 

# Note 2: 
#   Use designTreatmentsC() to build a single variable model from variable 218 predicting when churn has the value 1. The codeRestriction="catB" means we  
#   only want a model of type "catB" (we will explain this later), and verbose=FALSE is mearly turning off some messages. 

# Note 3: 
#   Build an example data frame to see how this single variable model works on new data. 

# Note 4: 
#   Apply the treatment plan to the new data using the prepare() function. 

# Note 5: 
#   Build up a data frame with both the original variable 218 values and the transformed scores. 

