# example 7.13 of section 7.2.4 
# (example 7.13 of section 7.2.4)  : Advanced Data Preparation : Building single-variable models : Using cross-validation to estimate effects of overfitting 
# Title: Empirically cross-validating performance 

fCross <- function() {
   useForCalRep <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0
   predRep <- mkPredC(dTrainAll[!useForCalRep,outcome],
      dTrainAll[!useForCalRep,var],
      dTrainAll[useForCalRep,var])
   calcAUC(predRep,dTrainAll[useForCalRep,outcome])
}
aucs <- replicate(100,fCross())

