# example 3.17 of section 3.2.2 
# (example 3.17 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Comparing population densities across categories 

customer_data3 = subset(customer_data2, marital_status %in% c("Never married", "Widowed"))    	# Note: 1 
ggplot(customer_data3, aes(x=age, color=marital_status, linetype=marital_status)) +          	# Note: 2 
  geom_density() + scale_color_brewer(palette="Dark2")

# Note 1: 
#   Restrict to the data for widowed or never married people. 

# Note 2: 
#   Differentiate the color and line style of the plots by marital_status 

