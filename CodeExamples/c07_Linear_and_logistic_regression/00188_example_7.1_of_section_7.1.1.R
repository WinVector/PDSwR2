# example 7.1 of section 7.1.1 
# (example 7.1 of section 7.1.1)  : Linear and logistic regression : Using linear regression : Understanding linear regression 
# Title: Loading the PUMS data and fitting a model 

psub <- readRDS("psub.RDS")
                                                
set.seed(3454351)     
gp <- runif(nrow(psub))                                            	# Note: 1 
                                                
dtrain <- subset(psub, gp >= 0.5)                                	# Note: 2 
dtest <- subset(psub, gp < 0.5)
                                                
model <- lm(log10(PINCP) ~ AGEP + SEX + COW + SCHL, data = dtrain)  	# Note: 3 
dtest$predLogPINCP <- predict(model, newdata = dtest)              	# Note: 4 
dtrain$predLogPINCP <- predict(model, newdata = dtrain)

# Note 1: 
#   Make a random variable to group and partition the data 

# Note 2: 
#   Split 50-50 into training and test sets 

# Note 3: 
#   Fit a linear model to log(income). 

# Note 4: 
#   Get the predicted log(income) on the test and training sets. 

