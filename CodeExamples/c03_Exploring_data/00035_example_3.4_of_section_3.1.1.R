# example 3.4 of section 3.1.1 
# (example 3.4 of section 3.1.1)  : Exploring data : Using summary statistics to spot problems : Typical problems revealed by data summaries 
# Title: Looking at the data range of a variable 

summary(customer_data$income)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   -6900   10700   26200   41764   51700 1257000     	# Note: 1

# Note 1: 
#   Income ranges from zero to over a million 
#   dollars; a very wide range. 

