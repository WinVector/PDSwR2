# example 7.2 of section 7.2.2 
# (example 7.2 of section 7.2.2)  : Advanced Data Preparation : KDD and KDD Cup 2009 : Characterizing the outcome 
# Title: Examining the distribution of churn 

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

