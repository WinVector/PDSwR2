# example 7.12 of section 7.3.2 
# (example 7.12 of section 7.3.2)  : Advanced Data Preparation : Building single-variable models : Building single variable models from numeric features 
# Title: Plotting variable performance 

library('ggplot2')
ggplot(data=dCal) +
   geom_density(aes(x=predVar126,color=as.factor(churn)))

