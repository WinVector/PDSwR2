# example 7.6 of section 7.3.2 
# (example 7.6 of section 7.3.2)  : Advanced Data Preparation : Building single-variable models : Building single variable models from categorical features 
# Title: Interpeting the single variable model 

logit <- function(x) {
  log(x/(1-x))
}

sigmoid <- function(v) {
  1/(1+exp(-v))
}

scores$conditional_probability <- sigmoid(
  scores$Var218_catB + 
    logit(mean(dTrain$churn==1)))

print(scores)

##     Var218 Var218_catB conditional_probability
## 1     cJvF  -0.2285864              0.05961398
## 2     UYBR   0.1284412              0.08306808
## 3     <NA>   1.5063227              0.26434790
## 4 NewValue   0.0000000              0.07379436

