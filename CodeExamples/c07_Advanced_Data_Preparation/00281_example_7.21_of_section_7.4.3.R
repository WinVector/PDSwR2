# example 7.21 of section 7.4.3 
# (example 7.21 of section 7.4.3)  : Advanced Data Preparation : Building models using many variables : Using nearest neighbor methods 
# Title: Platting 200-nearest neighbor performance 

dCal$kpred <- knnPred(dCal[,selVars])
ggplot(data=dCal) +
   geom_density(aes(x=kpred,
      color=as.factor(churn),linetype=as.factor(churn)))

