# example 7.24 of section 7.3.1 
# (example 7.24 of section 7.3.1)  : Linear and logistic regression : Regularization : An example of quasi-separation 
# Title: Looking at the logistic model’s coefficients 

coefs <- coef(model_glm)[-1]                         	# Note: 1 
coef_frame <- data.frame(coef = names(coefs),
                        value = coefs)

library(ggplot2)
ggplot(coef_frame, aes(x = coef, y = value)) + 
  geom_pointrange(aes(ymin = 0, ymax = value)) + 
  ggtitle("Coefficients of logistic regression model") + 
  coord_flip()

# Note 1: 
#   Get the coefficients (except the intercept) 

