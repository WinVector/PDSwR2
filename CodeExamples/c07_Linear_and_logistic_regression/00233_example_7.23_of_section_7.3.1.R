# example 7.23 of section 7.3.1 
# (example 7.23 of section 7.3.1)  : Linear and logistic regression : Regularization : An example of quasi-separation 
# Title: Looking at the model summary 

summary(model_glm)

## 
## Call:
## glm(formula = fmla, family = binomial, data = cars_train)
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -2.35684  -0.02593   0.00000   0.00001   3.11185  
## 
## Coefficients:
##                   Estimate Std. Error z value Pr(>|z|)    
## (Intercept)        28.0132  1506.0310   0.019 0.985160    
## car_pricelow       -4.6616     0.6520  -7.150 8.67e-13 ***
## car_pricemed       -3.8689     0.5945  -6.508 7.63e-11 ***
## car_pricevhigh      1.9139     0.4318   4.433 9.30e-06 ***
## maint_pricelow     -3.2542     0.5423  -6.001 1.96e-09 ***
## maint_pricemed     -3.2458     0.5503  -5.899 3.66e-09 ***
## maint_pricevhigh    2.8556     0.4865   5.869 4.38e-09 ***
## doors3             -1.4281     0.4638  -3.079 0.002077 ** 
## doors4             -2.3733     0.4973  -4.773 1.82e-06 ***
## doors5more         -2.2652     0.5090  -4.450 8.58e-06 ***
## persons4          -29.8240  1506.0310  -0.020 0.984201      	# Note: 1 
## personsmore       -29.4551  1506.0310  -0.020 0.984396    
## lug_bootmed         1.5608     0.4529   3.446 0.000568 ***
## lug_bootsmall       4.5238     0.5721   7.908 2.62e-15 ***
## safetylow          29.9415  1569.3789   0.019 0.984778      	# Note: 2 
## safetymed           2.7884     0.4134   6.745 1.53e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 1484.7  on 1228  degrees of freedom
## Residual deviance:  245.5  on 1213  degrees of freedom
## AIC: 277.5                                                
## 
## Number of Fisher Scoring iterations: 21                         	# Note: 3

# Note 1: 
#   The variables persons4 and personsmore have notably large negative magnitudes, 
#   and a giant standard error. 

# Note 2: 
#   The variable safetylow has a notably large positive magnitude, 
#   and a giant standard error. 

# Note 3: 
#   The algorithm ran for an unusually large number of Fisher scoring iterations.. 

