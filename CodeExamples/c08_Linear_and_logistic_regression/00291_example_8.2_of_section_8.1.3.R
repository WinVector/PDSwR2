# example 8.2 of section 8.1.3 
# (example 8.2 of section 8.1.3)  : Linear and logistic regression : Using linear regression : Making predictions 
# Title: Plotting log income as a function of predicted log income 

library('ggplot2')
ggplot(data = dtest, aes(x = predLogPINCP, y = log(PINCP,base=10))) +
   geom_point(alpha = 0.2,color = "darkgray") +
   geom_smooth(color="darkblue") +
   geom_line(aes(x = log(PINCP,base = 10),
                 y = log(PINCP,base = 10)),
             color = "blue", linetype=2) +
   coord_cartesian(xlim = c(4,5.25),
                   ylim = c(c(3.5,5.5)))

