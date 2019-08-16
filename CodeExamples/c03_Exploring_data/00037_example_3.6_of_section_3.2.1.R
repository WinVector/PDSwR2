# example 3.6 of section 3.2.1 
# (example 3.6 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Plotting a histogram 

library(ggplot2)                                    	# Note: 1 
ggplot(customer_data, aes(x=gas_usage)) + 
  geom_histogram(binwidth=10, fill="gray")          	# Note: 2

# Note 1: 
#   Load the ggplot2 library, if you haven’t 
#   already done so. 

# Note 2: 
#   binwidth parameterThe binwidth parameter tells the 
#   geom_histogram call how to make bins of ten dollar intervals (default is 
#   datarange/30). The fill parameter specifies the color of the histogram 
#   bars (default: black). 

