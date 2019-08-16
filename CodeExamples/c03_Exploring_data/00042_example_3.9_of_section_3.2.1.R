# example 3.9 of section 3.2.1 
# (example 3.9 of section 3.2.1)  : Exploring data : Spotting problems using graphics and visualization : Visually checking distributions for a single variable 
# Title: Producing a horizontal bar chart 

ggplot(customer_data, aes(x=state_of_res)) + 
  geom_bar(fill="gray") +                       	# Note: 1 
  coord_flip()                                  	# Note: 2

# Note 1: 
#   Plot bar chart as before: state_of_res is on x-axis, count is on y-axis. 

# Note 2: 
#   Flip the x and y axes: state_of_res is 
#   now on the y-axis. 

