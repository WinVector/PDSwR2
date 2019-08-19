# example 7.22 of section 7.3.1 
# (example 7.22 of section 7.3.1)  : Linear and logistic regression : Regularization : An example of quasi-separation 
# Title: Fitting a logistic regression model 

library(wrapr)
(fmla <- mk_formula(outcome, vars) )

## fail ~ car_price + maint_price + doors + persons + lug_boot + 
##     safety
## <environment: base>

model_glm <- glm(fmla,
            data = cars_train,
            family = binomial)

