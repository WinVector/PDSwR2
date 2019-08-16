# informalexample 8.1 of section 8.2.1 
# (informalexample 8.1 of section 8.2.1)  : Advanced data preparation : KDD and KDD Cup 2009 : Getting started with KDD Cup 2009 data 

outcome_summary <- table(
   churn = dTrain[, outcome],                	# Note: 1 
   useNA = 'ifany')                               	# Note: 2 

knitr::kable(outcome_summary)

# Note 1: 
#   Tabulate levels of churn outcome. 

# Note 2: 
#   Include NA values in tabulation. 

