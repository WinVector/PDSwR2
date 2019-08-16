# example 3.5 of section 3.1.1 
# (example 3.5 of section 3.1.1)  : Exploring data : Using summary statistics to spot problems : Typical problems revealed by data summaries 
# Title: Checking units sounds silly, but mistakes can lead to spectacular errors if not caught 

IncomeK = customer_data$income/1000
summary(IncomeK)                                            	# Note: 1 
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   -6.90   10.70   26.20   41.76   51.70 1257.00

# Note 1: 
#   The variable IncomeK is defined as IncomeK = customer_data$income/1000. But suppose you didn’t know 
#   that. Looking only at the summary, the values could plausibly be 
#   interpreted to mean either “hourly wage” or “yearly income in units 
#   of $1000.” 

