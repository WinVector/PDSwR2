# example 8.2 of section 8.2.1 
# (example 8.2 of section 8.2.1)  : Advanced Data Preparation : KDD and KDD Cup 2009 : Getting started with KDD Cup 2009 data 
# Title: Examining the distribution of churn 

table(
   churn = dTrain[, outcome], 	# Note: 1 
   useNA = 'ifany') 	# Note: 2 

# churn
#    -1     1 
# 37528  2990

# Note 1: 
#   Tabulate levels of churn outcome. 

# Note 2: 
#   Include NA values in tabulation. 

