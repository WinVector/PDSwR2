# example 8.3 of section 8.2.2 
# (example 8.3 of section 8.2.2)  : Advanced data preparation : KDD and KDD Cup 2009 : The bull in the china shop approach 
# Title: Trying just one variable 

model2 <- glm((churn == 1) ~ Var1, data = dTrainAll, family = binomial)
summary(model2)
# 
# Call:
# glm(formula = (churn == 1) ~ Var1, family = binomial, data = dTrainAll)
# 
# Deviance Residuals: 
#     Min       1Q   Median       3Q      Max  
# -0.3997  -0.3694  -0.3691  -0.3691   2.3326  
# 
# Coefficients:
#               Estimate Std. Error z value Pr(>|z|)    
# (Intercept) -2.6523837  0.1674387 -15.841   <2e-16 ***
# Var1         0.0002429  0.0035759   0.068    0.946    
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
#     Null deviance: 302.09  on 620  degrees of freedom
# Residual deviance: 302.08  on 619  degrees of freedom
#   (44407 observations deleted due to missingness)                  	# Note: 1 
# AIC: 306.08
# 
# Number of Fisher Scoring iterations: 5

dim(dTrainAll)
# [1] 45028   234

# Note 1: 
#   This means the modeling procedure threw out this much (almost all) of our training data. 

