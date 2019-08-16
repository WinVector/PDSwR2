# example 8.5 of section 8.3 
# (example 8.5 of section 8.3)  : Advanced data preparation : Basic data preparation for classification 
# Title: Preparing data with vtreat 

dTrain_treated <- prepare(treatment_plan, 
                          dTrain,
                          parallelCluster = parallel_cluster)
                        
head(colnames(dTrain))
## [1] "Var1" "Var2" "Var3" "Var4" "Var5" "Var6"
head(colnames(dTrain_treated))                          	# Note: 1 
## [1] "Var1"       "Var1_isBAD" "Var2"       "Var2_isBAD" "Var3"      
## [6] "Var3_isBAD"

# Note 1: 
#   Compare the columns of the original dTrain data to its treated counterpart. 

