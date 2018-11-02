# example 7.8 of section 7.2.2 
# (example 7.8 of section 7.2.2)  : Memorization methods : Building single-variable models : Using numeric features 
# Title: Plotting variable performance 

library('ggplot2')
ggplot(data=dCal) +
   geom_density(aes(x=predVar126,color=as.factor(churn)))

