# informalexample 8.4 of section 8.3.1 
# (informalexample 8.4 of section 8.3.1)  : Advanced data preparation : Basic data preparation for classification : The variable score frame 

score_frame <-  treatment_plan$scoreFrame
t(subset(score_frame, origName %in% c("Var126", "Var189")))

#                   225            226            341            342           
# varName           "Var126"       "Var126_isBAD" "Var189"       "Var189_isBAD"  	# Note: 1 
# varMoves          "TRUE"         "TRUE"         "TRUE"         "TRUE"        	# Note: 2 
# rsq               "0.0030859179" "0.0136377093" "0.0118934515" "0.0001004614" 	# Note: 3 
# sig               "7.876602e-16" "2.453679e-64" "2.427376e-56" "1.460688e-01" 	# Note: 4 
# needsSplit        "FALSE"        "FALSE"        "FALSE"        "FALSE"       	# Note: 5 
# extraModelDegrees "0"            "0"            "0"            "0"           	# Note: 6 
# origName          "Var126"       "Var126"       "Var189"       "Var189"      	# Note: 7 
# code              "clean"        "isBAD"        "clean"        "isBAD"          	# Note: 8

# Note 1: 
#   The name of the derived variable or column. 

# Note 2: 
#   An indicator that this variable is not always the same value (not a constant, which would be useless for modeling). 

# Note 3: 
#   The R-squared or pseudo R-squared of the 
#   variable, what fraction of the outcome variation 
#   this variable can explain on its own in a linear 
#   model. 

# Note 4: 
#   The significance of the estimated 
#   R-squared. 

# Note 5: 
#   An indicator that when TRUE is a warning to the user that the variable is  
#   hiding extra degrees of freedom (a measure of model complexity) and needs to be evaluated using cross-validation techniques.. 

# Note 6: 
#   How complex is the variable, for a categorical variable this is related to the number of levels. 

# Note 7: 
#   Name of the original column the variable was derived from. 

# Note 8: 
#   Name of the type of transformation used to build this variable. 

