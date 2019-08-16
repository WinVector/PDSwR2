# example 3.10 of section 3.2.1 
# (example 3.10 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Producing a dot plot with sorted categories 

library(WVPlots)                                              	# Note: 1 
ClevelandDotPlot(customer_data, "state_of_res",               	# Note: 2 
    sort = 1, title="Customers by state") +                   	# Note: 3 
coord_flip()                                                  	# Note: 4

# Note 1: 
#   Load the WVPlots library. 

# Note 2: 
#   Plot the state_of_res column of the customer_data data frame. 

# Note 3: 
#   “sort = 1” sorts the categories in increasing order (most frequent last). 

# Note 4: 
#   Flip the axes as before. 

