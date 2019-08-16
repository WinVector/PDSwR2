# example 3.3 of section 3.1.1 
# (example 3.3 of section 3.1.1)  : Exploring data : Using summary statistics to spot problems : Typical problems revealed by data summaries 
# Title: Examples of invalid values and outliers 

summary(customer_data$income)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   -6900   11200   27300   42522   52000 1257000    	# Note: 1 
                        
summary(customer_data$age)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    0.00   34.00   48.00   49.17   62.00  120.00    	# Note: 2

# Note 1: 
#   Negative values for income could indicate 
#   bad data. They might also have a special meaning, like “amount of 
#   debt.” Either way, you should check how prevalent the issue is, 
#   and decide what to do: Do you drop the data with negative income? Do you 
#   convert negative values to zero? 

# Note 2: 
#   Customers of age zero, or customers of an age greater than about 110, are outliers. They fall 
#   out of the range of expected customer values. Outliers could be data input errors. 
#   They could be special sentinel values: zero might mean “age unknown” or 
#   “refuse to state.” And some of your customers might be especially 
#   long-lived. 

