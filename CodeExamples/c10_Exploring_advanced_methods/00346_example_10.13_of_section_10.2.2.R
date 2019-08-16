# example 10.13 of section 10.2.2 
# (example 10.13 of section 10.2.2)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : A one-dimensional regression example 
# Title: Linear regression applied to the artificial example 

lin_model <- lm(y ~ x, data = train)
summary(lin_model)

## 
## Call:
## lm(formula = y ~ x, data = train)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -17.698  -1.774   0.193   2.499   7.529 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -0.8330     0.1161  -7.175 1.51e-12 ***
## x             0.7395     0.1197   6.180 9.74e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 3.485 on 899 degrees of freedom
## Multiple R-squared:  0.04075,    Adjusted R-squared:  0.03968 
## F-statistic: 38.19 on 1 and 899 DF,  p-value: 9.737e-10

rmse <- function(residuals) {                    	# Note: 1 
  sqrt(mean(residuals^2))
}

train$pred_lin <- predict(lin_model, train)              	# Note: 2 
resid_lin <- with(train, y - pred_lin)
rmse(resid_lin)
## [1] 3.481091

library(ggplot2)                                  	# Note: 3 

ggplot(train, aes(x = pred_lin, y = y)) + 
  geom_point(alpha = 0.3) + 
  geom_abline()

# Note 1: 
#   A convenience function for calculating  
#   root mean squared error (RMSE) from a vector of residuals. 

# Note 2: 
#   Calculate the RMSE of this model on the training data. 

# Note 3: 
#   Plot y versus prediction. 

