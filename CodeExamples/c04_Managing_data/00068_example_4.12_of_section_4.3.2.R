# example 4.12 of section 4.3.2 
# (example 4.12 of section 4.3.2)  : Managing data : Sampling for modeling and validation : Creating a sample group column 
# Title: Splitting into test and training using a random group mark 

set.seed(25643)                                                     	# Note: 1 
customer_data$gp <- runif(nrow(customer_data))                        	# Note: 2 
customer_test <- subset(customer_data, gp <= 0.1)                  	# Note: 3 
customer_train <- subset(customer_data, gp > 0.1)                  	# Note: 4 

dim(customer_test)
## [1] 7463   16

dim(customer_train)
## [1] 65799    16

# Note 1: 
#   Set the random seed so this example is reproducible. 

# Note 2: 
#   Create the grouping column. 

# Note 3: 
#   Here we generate a test set of about 10% of 
#   the data. 

# Note 4: 
#   Here we generate a training set using the 
#   remaining data. 

