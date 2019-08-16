# informalexample 8.19 of section 8.5 
# (informalexample 8.19 of section 8.5)  : Advanced data preparation : Preparing data for regression modeling 

library("vtreat")

cfe <- mkCrossFrameNExperiment(auto_mpg, vars, "mpg",           	# Note: 1 
                               verbose = FALSE)
treatment_plan <- cfe$treatments
auto_mpg_treated <- cfe$crossFrame
score_frame <- treatment_plan$scoreFrame
new_vars <- score_frame$varName

newf <- mk_formula("mpg", new_vars)
new_model <- lm(newf, data = auto_mpg_treated)

auto_mpg$prediction <- predict(new_model, newdata = auto_mpg_treated)
# Warning in predict.lm(new_model, newdata = auto_mpg_treated): prediction
# from a rank-deficient fit may be misleading
str(auto_mpg[!complete.cases(auto_mpg), , drop = FALSE])
# 'data.frame':    6 obs. of  10 variables:
#  $ mpg         : num  25 21 40.9 23.6 34.5 23
#  $ cylinders   : num  4 6 4 4 4 4
#  $ displacement: num  98 200 85 140 100 151
#  $ horsepower  : num  NA NA NA NA NA NA
#  $ weight      : num  2046 2875 1835 2905 2320 ...
#  $ acceleration: num  19 17 17.3 14.3 15.8 20.5
#  $ model_year  : num  71 74 80 80 81 82
#  $ origin      : Factor w/ 3 levels "1","2","3": 1 1 2 1 2 1
#  $ car_name    : chr  "\"ford pinto\"" "\"ford maverick\"" "\"renault lecar deluxe\"" ...
#  $ prediction  : num  24.6 22.4 34.2 26.1 33.3 ...               	# Note: 2

# Note 1: 
#   Try it again with vtreat data preparation. 

# Note 2: 
#   Now we can make predictions, even for items that have missing data. 

