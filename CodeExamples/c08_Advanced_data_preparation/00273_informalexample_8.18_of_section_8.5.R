# informalexample 8.18 of section 8.5 
# (informalexample 8.18 of section 8.5)  : Advanced data preparation : Preparing data for regression modeling 

library("wrapr")

vars <- c("cylinders", "displacement",                       	# Note: 1 
          "horsepower", "weight", "acceleration",
          "model_year", "origin")
f <- mk_formula("mpg", vars)
model <- lm(f, data = auto_mpg)

auto_mpg$prediction <- predict(model, newdata = auto_mpg)            	# Note: 2 

str(auto_mpg[!complete.cases(auto_mpg), , drop = FALSE])

# 'data.frame':    6 obs. of  10 variables:
#  $ mpg         : num  25 21 40.9 23.6 34.5 23
#  $ cylinders   : num  4 6 4 4 4 4
#  $ displacement: num  98 200 85 140 100 151
#  $ horsepower  : num  NA NA NA NA NA NA                            	# Note: 3 
#  $ weight      : num  2046 2875 1835 2905 2320 ...
#  $ acceleration: num  19 17 17.3 14.3 15.8 20.5
#  $ model_year  : num  71 74 80 80 81 82
#  $ origin      : Factor w/ 3 levels "1","2","3": 1 1 2 1 2 1
#  $ car_name    : chr  "\"ford pinto\"" "\"ford maverick\"" "\"renault lecar deluxe\"" ...
#  $ prediction  : num  NA NA NA NA NA NA                            	# Note: 4

# Note 1: 
#   Jump into modeling without bothering to treat the data. 

# Note 2: 
#   Add the model predictions as a new column. 

# Note 3: 
#   Notice these cars do not have a recorded horsepower. 

# Note 4: 
#   So these cars do not get a prediction. 

