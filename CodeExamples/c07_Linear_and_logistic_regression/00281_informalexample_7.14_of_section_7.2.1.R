# informalexample 7.14 of section 7.2.1 
# (informalexample 7.14 of section 7.2.1)  : Linear and logistic regression : Using logistic regression : Understanding logistic regression 

logit <- function(p) { log(p/(1-p)) }
s <- function(x) { 1/(1 + exp(-x))}

s(logit(0.7))
# [1] 0.7

logit(s(-2))
# -2

