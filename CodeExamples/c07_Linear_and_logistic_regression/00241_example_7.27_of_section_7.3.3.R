# example 7.27 of section 7.3.3 
# (example 7.27 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 
# Title: Looking at the ridge model’s coefficients 

(coefs <- coef(model_ridge)) 

## 22 x 1 sparse Matrix of class "dgCMatrix"
##                            1
## (Intercept)       2.01098708
## car_pricehigh     0.34564041
## car_pricelow     -0.76418240
## car_pricemed     -0.62791346
## car_pricevhigh    1.05949870
## maint_pricehigh   0.18896383
## maint_pricelow   -0.72148497
## maint_pricemed   -0.60000546
## maint_pricevhigh  1.14059599
## doors2            0.37594292
## doors3            0.01067978
## doors4           -0.21546650
## doors5more       -0.17649206
## persons2          2.61102897                     	# Note: 1 
## persons4         -1.35476871
## personsmore      -1.26074907
## lug_bootbig      -0.52193562
## lug_bootmed      -0.18681644
## lug_bootsmall     0.68419343
## safetyhigh       -1.70022006
## safetylow         2.54353980
## safetymed        -0.83688361

coef_frame <- data.frame(coef = rownames(coefs)[-1],
                        value = coefs[-1,1])

ggplot(coef_frame, aes(x = coef, y = value)) + 
  geom_pointrange(aes(ymin = 0, ymax = value)) + 
  ggtitle("Coefficients of ridge model") + 
  coord_flip()

# Note 1: 
#   Note that all the levels of the 
#   categorical variable “persons” are present (no 
#   reference level). 

