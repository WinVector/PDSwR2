# example 4.4 of section 4.1.3 
# (example 4.4 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 
# Title: Creating and applying a treatment plan 

library(vtreat)
treatment_plan <- design_missingness_treatment(customer_data, varlist = varlist)
training_prepared <- prepare(treatment_plan, customer_data)

