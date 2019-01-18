# example 7.5 of section 7.2.2 
# (example 7.5 of section 7.2.2)  : Advanced Data Preparation : Building single-variable models : Using categorical features 
# Title: Build single-variable models for categorical variables 

library("vtreat") 	# Note: 1 

(treatment_plan <- vtreat::designTreatmentsC( 	# Note: 2 
  dTrain,                             
  varlist = "Var218",      
  outcomename = "churn",    
  outcometarget = 1,                 
  codeRestriction = "catB", 
  verbose = FALSE))                   

#       varName varMoves        rsq          sig needsSplit extraModelDegrees origName code
# 1 Var218_catB     TRUE 0.01298334 3.266565e-62       TRUE                 2   Var218 catB

(example_data <-  	# Note: 3 
    data.frame(Var218 = c("cJvF", "UYBR", NA)))

scores <- prepare( 	# Note: 4 
  treatment_plan,
  example_data)

(scores <- cbind(   	# Note: 5 
  example_data, scores))
)

#   Var218 Var218_catB
# 1   cJvF  -0.2285864
# 2   UYBR   0.1284412
# 3   <NA>   1.5063227

# Note 1: 
#   Attach the vtreat package to define the designTreatmentsC() and prepare() functions. 

# Note 2: 
#   Use designTreatmentsC() to build a single variable model from variable 218 predicting when churn has the value 1. The codeRestriction="catB" means we  
#   only want a model of type "catB" (we will explain this later), and verbose=FALSE is mearly turning off some messages. 

# Note 3: 
#   Build an example data frame to see how this single variable model works on new data. 

# Note 4: 
#   Apply the model to the new data using the prepare() function. 

# Note 5: 
#   Build up a data frame with both the original variable 218 values and the transformed scores. 

