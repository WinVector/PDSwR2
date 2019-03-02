# informalexample 8.4 of section 8.3.2 
# (informalexample 8.4 of section 8.3.2)  : Advanced Data Preparation : Basic data preparation for classification : Using the treatment plan 

dTrain_treated <- prepare(treatment_plan, 
                          dTrain,
                          parallelCluster = cl)

dCal_treated <- prepare(treatment_plan, 
                        dCal,
                        parallelCluster = cl)

