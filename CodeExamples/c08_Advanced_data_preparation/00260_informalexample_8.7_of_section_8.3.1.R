# informalexample 8.7 of section 8.3.1 
# (informalexample 8.7 of section 8.3.1)  : Advanced data preparation : Basic data preparation for classification : The variable score frame 

treatment_plan_2 <- design_missingness_treatment(dTrain, varlist = vars) 	# Note: 1 
dtrain_2 <- prepare(treatment_plan_2, dTrain)                           	# Note: 2 
head(dtrain_2$Var218)

## [1] "cJvF"      "_invalid_" "UYBR"      "UYBR"      "UYBR"      "UYBR"

model <- glm(churn ==1  ~ Var218,         	# Note: 3 
            data = dtrain_2, 
            family = "binomial")
            
pred <- predict(model,                 	# Note: 4 
               newdata = dtrain_2, 
               type = "response")  
               
(prevalence <- mean(dTrain$churn == 1) )  	# Note: 5 
## [1] 0.07347764

logit <- function(p) {                	# Note: 6 
  log (p / (1-p) )
}

comparison$glm218 <- logit(pred) - logit(prevalence)  	# Note: 7 
head(comparison)

##   original218  impact218     glm218
## 1        cJvF -0.2180735 -0.2180735  	# Note: 8 
## 2        <NA>  1.5155125  1.5155121
## 3        UYBR  0.1221393  0.1221392
## 4        UYBR  0.1221393  0.1221392
## 5        UYBR  0.1221393  0.1221392
## 6        UYBR  0.1221393  0.1221392

# Note 1: 
#   Simple treatment to turn NA into a safe string. 

# Note 2: 
#   Create the treated data. 

# Note 3: 
#   Fit the one-variable logistic regression model. 

# Note 4: 
#   Make predictions on the data. 

# Note 5: 
#   Calculate the global probability of churn. 

# Note 6: 
#   A function to calculate the logit, or log-odds of a probability. 

# Note 7: 
#   Calculate the catB values by hand. 

# Note 8: 
#   Notice the impact codes 
#   from vtreat match the “delta logit” encoded 
#   predictions from the standard glm model. This helps 
#   illustrate how vtreat is implemented. 

