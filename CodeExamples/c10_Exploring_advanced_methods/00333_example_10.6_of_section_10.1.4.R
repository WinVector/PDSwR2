# example 10.6 of section 10.1.4 
# (example 10.6 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 
# Title: Load the iris data 

iris <- iris
iris$class <- as.numeric(iris$Species == "setosa")     	# Note: 1  
set.seed(2345)
intrain <- runif(nrow(iris)) < 0.75                        	# Note: 2 
train <- iris[intrain, ]
test <- iris[!intrain, ]
head(train)

##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species class
## 1          5.1         3.5          1.4         0.2  setosa     1
## 2          4.9         3.0          1.4         0.2  setosa     1
## 3          4.7         3.2          1.3         0.2  setosa     1
## 4          4.6         3.1          1.5         0.2  setosa     1
## 5          5.0         3.6          1.4         0.2  setosa     1
## 6          5.4         3.9          1.7         0.4  setosa     1

input <- as.matrix(train[, 1:4])                         	# Note: 3

# Note 1: 
#   setosa is the positive class. 

# Note 2: 
#   Split the data into training and test (75%/25%). 

# Note 3: 
#   Create the input matrix. 

