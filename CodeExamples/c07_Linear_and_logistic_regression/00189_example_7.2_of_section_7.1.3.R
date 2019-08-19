# example 7.2 of section 7.1.3 
# (example 7.2 of section 7.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Plotting log income as a function of predicted log income 

library('ggplot2')
ggplot(data = dtest, aes(x = predLogPINCP, y = log10(PINCP))) +
   geom_point(alpha = 0.2, color = "darkgray") +
   geom_smooth(color = "darkblue") +
   geom_line(aes(x = log10(PINCP),                              	# Note: 1 
                 y = log10(PINCP)),
             color = "blue", linetype = 2) +
   coord_cartesian(xlim = c(4, 5.25),                           	# Note: 2 
                   ylim = c(3.5, 5.5))

# Note 1: 
#   Plot the line x=y 

# Note 2: 
#   Limit the range of the graph for legibility 

