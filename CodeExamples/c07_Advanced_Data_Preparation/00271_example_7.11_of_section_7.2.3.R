# example 7.11 of section 7.2.3 
# (example 7.11 of section 7.2.3)  : Advanced Data Preparation : Building single-variable models : Using numeric features 
# Title: Plotting variable performance 

library('ggplot2')
ggplot(data=dCal) +
   geom_density(aes(x=predVar126,color=as.factor(churn)))

