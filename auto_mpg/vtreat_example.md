vtreat\_example
================

``` r
auto_mpg <- readRDS('auto_mpg.RDS')

str(auto_mpg)
```

    ## 'data.frame':    398 obs. of  9 variables:
    ##  $ mpg         : num  18 15 18 16 17 15 14 14 14 15 ...
    ##  $ cylinders   : num  8 8 8 8 8 8 8 8 8 8 ...
    ##  $ displacement: num  307 350 318 304 302 429 454 440 455 390 ...
    ##  $ horsepower  : num  130 165 150 150 140 198 220 215 225 190 ...
    ##  $ weight      : num  3504 3693 3436 3433 3449 ...
    ##  $ acceleration: num  12 11.5 11 12 10.5 10 9 8.5 10 8.5 ...
    ##  $ model_year  : num  70 70 70 70 70 70 70 70 70 70 ...
    ##  $ origin      : Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ car_name    : chr  "\"chevrolet chevelle malibu\"" "\"buick skylark 320\"" "\"plymouth satellite\"" "\"amc rebel sst\"" ...

``` r
library("wrapr")

vars <- c("cylinders", "displacement", 
          "horsepower", "weight", "acceleration",
          "model_year", "origin")
f <- mk_formula("mpg", vars)
model <- lm(f, data = auto_mpg)

auto_mpg$prediction <- predict(model, newdata = auto_mpg)

str(auto_mpg[!complete.cases(auto_mpg), , drop = FALSE])
```

    ## 'data.frame':    6 obs. of  10 variables:
    ##  $ mpg         : num  25 21 40.9 23.6 34.5 23
    ##  $ cylinders   : num  4 6 4 4 4 4
    ##  $ displacement: num  98 200 85 140 100 151
    ##  $ horsepower  : num  NA NA NA NA NA NA
    ##  $ weight      : num  2046 2875 1835 2905 2320 ...
    ##  $ acceleration: num  19 17 17.3 14.3 15.8 20.5
    ##  $ model_year  : num  71 74 80 80 81 82
    ##  $ origin      : Factor w/ 3 levels "1","2","3": 1 1 2 1 2 1
    ##  $ car_name    : chr  "\"ford pinto\"" "\"ford maverick\"" "\"renault lecar deluxe\"" "\"ford mustang cobra\"" ...
    ##  $ prediction  : num  NA NA NA NA NA NA

``` r
library("vtreat")

cfe <- mkCrossFrameNExperiment(auto_mpg, vars, "mpg", 
                               verbose = FALSE)
treatment_plan <- cfe$treatments
auto_mpg_treated <- cfe$crossFrame
score_frame <- treatment_plan$scoreFrame
new_vars <- score_frame$varName

newf <- mk_formula("mpg", new_vars)
new_model <- lm(newf, data = auto_mpg_treated)

auto_mpg$prediction <- predict(new_model, newdata = auto_mpg_treated)
```

    ## Warning in predict.lm(new_model, newdata = auto_mpg_treated): prediction
    ## from a rank-deficient fit may be misleading

``` r
str(auto_mpg[!complete.cases(auto_mpg), , drop = FALSE])
```

    ## 'data.frame':    6 obs. of  10 variables:
    ##  $ mpg         : num  25 21 40.9 23.6 34.5 23
    ##  $ cylinders   : num  4 6 4 4 4 4
    ##  $ displacement: num  98 200 85 140 100 151
    ##  $ horsepower  : num  NA NA NA NA NA NA
    ##  $ weight      : num  2046 2875 1835 2905 2320 ...
    ##  $ acceleration: num  19 17 17.3 14.3 15.8 20.5
    ##  $ model_year  : num  71 74 80 80 81 82
    ##  $ origin      : Factor w/ 3 levels "1","2","3": 1 1 2 1 2 1
    ##  $ car_name    : chr  "\"ford pinto\"" "\"ford maverick\"" "\"renault lecar deluxe\"" "\"ford mustang cobra\"" ...
    ##  $ prediction  : num  24.4 22.1 35.1 26.1 32.8 ...
