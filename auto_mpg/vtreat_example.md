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
library("vtreat")
library("wrapr")

vars <- c("cylinders", "displacement", 
          "horsepower", "weight", "acceleration",
          "model_year", "origin")
f <- mk_formula("mpg", vars)

summary(lm(f, data = auto_mpg))
```

    ## 
    ## Call:
    ## lm(formula = f, data = auto_mpg)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -9.0095 -2.0785 -0.0982  1.9856 13.3608 
    ## 
    ## Coefficients:
    ##                Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  -1.795e+01  4.677e+00  -3.839 0.000145 ***
    ## cylinders    -4.897e-01  3.212e-01  -1.524 0.128215    
    ## displacement  2.398e-02  7.653e-03   3.133 0.001863 ** 
    ## horsepower   -1.818e-02  1.371e-02  -1.326 0.185488    
    ## weight       -6.710e-03  6.551e-04 -10.243  < 2e-16 ***
    ## acceleration  7.910e-02  9.822e-02   0.805 0.421101    
    ## model_year    7.770e-01  5.178e-02  15.005  < 2e-16 ***
    ## origin2       2.630e+00  5.664e-01   4.643 4.72e-06 ***
    ## origin3       2.853e+00  5.527e-01   5.162 3.93e-07 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.307 on 383 degrees of freedom
    ##   (6 observations deleted due to missingness)
    ## Multiple R-squared:  0.8242, Adjusted R-squared:  0.8205 
    ## F-statistic: 224.5 on 8 and 383 DF,  p-value: < 2.2e-16

``` r
cfe <- mkCrossFrameNExperiment(auto_mpg, vars, "mpg", 
                               verbose = FALSE)
treatment_plan <- cfe$treatments
auto_mpg_treated <- cfe$crossFrame
score_frame <- treatment_plan$scoreFrame
new_vars <- score_frame$varName

newf <- mk_formula("mpg", new_vars)
new_model <- lm(newf, data = auto_mpg_treated)
summary(new_model)
```

    ## 
    ## Call:
    ## lm(formula = newf, data = auto_mpg_treated)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -8.6482 -2.1304 -0.0536  1.9198 13.0973 
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                    Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)      -3.229e+00  1.605e+01  -0.201  0.84061    
    ## cylinders        -4.486e-01  3.222e-01  -1.392  0.16465    
    ## displacement      2.421e-02  7.684e-03   3.151  0.00175 ** 
    ## horsepower       -1.522e-02  1.361e-02  -1.118  0.26417    
    ## horsepower_isBAD  6.337e-01  1.434e+00   0.442  0.65880    
    ## weight           -6.918e-03  6.488e-04 -10.662  < 2e-16 ***
    ## acceleration      9.281e-02  9.772e-02   0.950  0.34284    
    ## model_year        7.771e-01  5.186e-02  14.985  < 2e-16 ***
    ## origin_catP       8.591e+00  2.528e+01   0.340  0.73419    
    ## origin_catN      -9.693e-01  9.751e-01  -0.994  0.32082    
    ## origin_catD      -1.153e+00  1.719e+00  -0.671  0.50272    
    ## origin_lev_x_1   -1.625e+01  1.604e+01  -1.013  0.31153    
    ## origin_lev_x_2   -1.646e+00  2.291e+00  -0.718  0.47305    
    ## origin_lev_x_3           NA         NA      NA       NA    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.32 on 385 degrees of freedom
    ## Multiple R-squared:  0.8251, Adjusted R-squared:  0.8196 
    ## F-statistic: 151.3 on 12 and 385 DF,  p-value: < 2.2e-16

``` r
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
    ##  $ prediction  : num  24.3 22.3 35.3 25.7 32.9 ...
