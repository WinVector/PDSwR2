# example 8.23 of section 8.3.1 
# (example 8.23 of section 8.3.1)  : Linear and logistic regression : Regularization : An Example of Quasi-separation 
# Title: Preparing the cars data 

cars <- read.table(
  'car.data.csv',
  sep = ',',
  header = TRUE,
  stringsAsFactor = TRUE
)


vars <- setdiff(colnames(cars), "rating") 	# Note: 1 

cars$fail <- cars$rating == "unacc"
outcome <- "fail"                     	# Note: 2 

set.seed(24351)
gp <- runif(nrow(cars))  	# Note: 3 
library(zeallot)
c(cars_test, cars_train) %<-% split(cars, gp < 0.7)  	# Note: 4 
                                    
nrow(cars_test)
## [1] 499
nrow(cars_train)
## [1] 1229

# Note 1: 
#   Get the input variables. 

# Note 2: 
#   You want to predict whether the car gets an "unacceptable" rating 

# Note 3: 
#   Create the grouping variable for the test/train split (70% for training, 30% for test). 

# Note 4: 
#   The split() function will put the group "gp < 0.7 == FALSE" first. 

