# example 6.1 of section 6.2.3 
# (example 6.1 of section 6.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: Building and applying a logistic regression spam model 

spamD <- read.table('spamD.tsv',header=T,sep='\t')              	# Note: 1 

spamTrain <- subset(spamD,spamD$rgroup  >= 10)                	# Note: 2 
spamTest <- subset(spamD,spamD$rgroup < 10)

spamVars <- setdiff(colnames(spamD), list('rgroup','spam'))     	# Note: 3 
spamFormula <- as.formula(paste('spam == "spam"',
paste(spamVars, collapse = ' + '),sep = ' ~ '))

spamModel <- glm(spamFormula,family = binomial(link = 'logit'),     	# Note: 4 
                                 data = spamTrain)
                                 
spamTrain$pred <- predict(spamModel,newdata = spamTrain,        	# Note: 5 
                             type = 'response')
spamTest$pred <- predict(spamModel,newdata = spamTest,
                            type = 'response')

# Note 1: 
#   Read in the data 

# Note 2: 
#   Split the data into training and test sets 

# Note 3: 
#   Create a formula that describes the model 

# Note 4: 
#   Fit the logistic regression model 

# Note 5: 
#   Make predictions on the training and test sets 

