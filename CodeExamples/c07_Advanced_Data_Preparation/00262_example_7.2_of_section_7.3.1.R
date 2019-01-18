# example 7.2 of section 7.3.1 
# (example 7.2 of section 7.3.1)  : Advanced Data Preparation : Building single-variable models : Characterizing the outcome 
# Title: Plotting the distribution of churn 

table(
   churn = dTrain[, outcome], 	# Note: 1 
   useNA = 'ifany') 	# Note: 2 

## churn
##    -1     1 
## 37528  2990

# Note 1: 
#   Tabulate levels of churn outcome. 

# Note 2: 
#   Include NA values in tabulation. 

