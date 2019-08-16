# example 6.14 of section 6.3.2 
# (example 6.14 of section 6.3.2)  : Choosing and evaluating models : Local Interpretable Model-Agnostic Explanations (LIME) for explaining model predictions : Walking through LIME: a small example 
# Title: Load the iris dataset 

iris <- iris
                                        
iris$class <- as.numeric(iris$Species == "setosa")     	# Note: 1 
                                        
set.seed(2345)  
intrain <- runif(nrow(iris)) < 0.75                       	# Note: 2  
train <- iris[intrain,]
test <- iris[!intrain,]
                                        
head(train)
                                        
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species class
## 1          5.1         3.5          1.4         0.2  setosa     1
## 2          4.9         3.0          1.4         0.2  setosa     1
## 3          4.7         3.2          1.3         0.2  setosa     1
## 4          4.6         3.1          1.5         0.2  setosa     1
## 5          5.0         3.6          1.4         0.2  setosa     1
## 6          5.4         3.9          1.7         0.4  setosa     1

# Note 1: 
#   Setosa is the positive class. 

# Note 2: 
#   Use 75% of the data for training, the remainder as holdout (i.e. test data). 

