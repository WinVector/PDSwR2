# informalexample 5.1 of section 5.1.1 
# (informalexample 5.1 of section 5.1.1)  : Data engineering and data shaping : Data selection : Sub-setting rows and columns 

library("ggplot2") 	# Note: 1 

summary(iris) 	# Note: 2 
      
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50

# Note 1: 
#   Attach the ggplot2 package for later plotting. 

# Note 2: 
#   Take a look at the built-in iris data. 

