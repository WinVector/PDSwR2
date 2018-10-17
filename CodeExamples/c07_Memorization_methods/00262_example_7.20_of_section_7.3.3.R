# example 7.20 of section 7.3.3 
# (example 7.20 of section 7.3.3)  : Memorization methods : Building models using many variables : Using nearest neighbor methods 
# Title: Platting 200-nearest neighbor performance 

dCal$kpred <- knnPred(dCal[,selVars])
ggplot(data=dCal) +
   geom_density(aes(x=kpred,
      color=as.factor(churn),linetype=as.factor(churn)))

