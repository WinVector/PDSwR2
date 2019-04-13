KDD2009vtreat
================
John Mount

KDD2009 example using the `vtreat` `R` package.

``` r
date()
```

    ## [1] "Sat Apr 13 06:06:07 2019"

``` r
#load some libraries
library('vtreat')
library('WVPlots') 
```

    ## Warning: package 'WVPlots' was built under R version 3.5.2

``` r
library('sigr')
```

    ## Warning: package 'sigr' was built under R version 3.5.2

``` r
library('parallel')
library('xgboost')
```

    ## Warning: package 'xgboost' was built under R version 3.5.2

``` r
# generated/code/CodeExamples/c08_Advanced_Data_Preparation/00327_example_8.1_of_section_8.2.1.R 
# example 8.1 of section 8.2.1 
# (example 8.1 of section 8.2.1)  : Advanced Data Preparation : KDD and KDD Cup 2009 : Getting started with KDD Cup 2009 data 
# Title: Preparing the KDD data for analysis 

d <- read.table('orange_small_train.data.gz',   # Note: 1 
   header = TRUE,
   sep = '\t',
   na.strings = c('NA', ''))    # Note: 2 
                                                
churn <- read.table('orange_small_train_churn.labels.txt',
   header = FALSE, sep = '\t')  # Note: 3 
d$churn <- churn$V1     # Note: 4 

set.seed(729375)    # Note: 5 
rgroup <- base::sample(c('train', 'calibrate', 'test'),     # Note: 6 
   nrow(d), 
   prob = c(0.8, 0.1, 0.1),
   replace = TRUE)
dTrain <- d[rgroup=='train', , drop = FALSE]
dCal <- d[rgroup=='calibrate', , drop = FALSE]
dTrainAll <- d[rgroup %in% c('train', 'calibrate'), , drop = FALSE]
dTest <- d[rgroup == 'test', , drop = FALSE]
                                                
outcome <- 'churn' 
vars <- setdiff(colnames(dTrainAll), outcome)

                                                
rm(list=c('d', 'churn', 'rgroup'))  # Note: 9

# Note 1: 
#   Read the file of independent variables. All 
#   data from 
#   https://github.com/WinVector/PDSwR2/tree/master/KDD2009. 

# Note 2: 
#   Treat both NA and the empty string as missing 
#   data. 

# Note 3: 
#   Read churn dependent variable. 

# Note 4: 
#   Add churn as a new column. 

# Note 5: 
#   By setting the seed to the pseudo-random 
#   number generator, we make our work reproducible: 
#   someone redoing it will see the exact same 
#   results. 

# Note 6: 
#   Split data into train, calibration, and test sets. 
#   We took extra care and wrote base::sample() even if 
#   the popular dplyr package is attached, which also  
#   has a function with this name. 

# Note 9: 
#   Remove unneeded objects from workspace. 

# Note 10: 
#   Further split training data into training and 
#   calibration. 

set.seed(239525)

ncore <- parallel::detectCores()
(cl = parallel::makeCluster(ncore))
```

    ## socket cluster with 4 nodes on host 'localhost'

``` r
yName <- "churn"
yTarget <- 1

date()
```

    ## [1] "Sat Apr 13 06:06:19 2019"

``` r
date()
```

    ## [1] "Sat Apr 13 06:06:19 2019"

``` r
var_values <- vtreat::value_variables_C(dTrain,
    vars,yName,yTarget,
    smFactor=2.0, 
    parallelCluster=cl
    )


summary(var_values$sig < 1/nrow(var_values))
```

    ##    Mode   FALSE    TRUE 
    ## logical      63     149

``` r
length(vars)
```

    ## [1] 230

``` r
vars <- var_values$var[var_values$sig < 1/nrow(var_values)]
length(vars)
```

    ## [1] 149

``` r
date()
```

    ## [1] "Sat Apr 13 06:14:27 2019"

``` r
date()
```

    ## [1] "Sat Apr 13 06:14:27 2019"

``` r
# Run other models (with proper coding/training separation).
#
# This gets us back to AUC 0.74 range

customCoders = list('c.PiecewiseV.num' = vtreat::solve_piecewise,
                    'n.PiecewiseV.num' = vtreat::solve_piecewise,
                    'c.knearest.num' = vtreat::square_window,
                    'n.knearest.num' = vtreat::square_window)
cfe = mkCrossFrameCExperiment(dTrain,
                              vars,yName,yTarget,
                              customCoders=customCoders,
                              smFactor=2.0, 
                              parallelCluster=cl)
```

    ## [1] "vtreat 1.4.0 start initial treatment design Sat Apr 13 06:14:27 2019"
    ## [1] " start cross frame work Sat Apr 13 06:20:19 2019"
    ## [1] " vtreat::mkCrossFrameCExperiment done Sat Apr 13 06:24:25 2019"

``` r
treatmentsC = cfe$treatments
scoreFrame = treatmentsC$scoreFrame
table(scoreFrame$code)
```

    ## 
    ##       catB       catP      clean      isBAD   knearest        lev 
    ##         28         28        119        117          2        118 
    ## PiecewiseV 
    ##        115

``` r
selvars <- scoreFrame$varName
treatedTrainM <- cfe$crossFrame[,c(yName,selvars),drop=FALSE]
treatedTrainM[[yName]] = treatedTrainM[[yName]]==yTarget

treatedTest = prepare(treatmentsC,
                      dTest,
                      pruneSig=NULL, 
                      varRestriction = selvars,
                      parallelCluster=cl)
treatedTest[[yName]] = treatedTest[[yName]]==yTarget

# prepare plotting frames
treatedTrainP = treatedTrainM[, yName, drop=FALSE]
treatedTestP = treatedTest[, yName, drop=FALSE]
date()
```

    ## [1] "Sat Apr 13 06:24:27 2019"

``` r
date()
```

    ## [1] "Sat Apr 13 06:24:27 2019"

``` r
mname = 'xgbPred'
print(paste(mname,length(selvars)))
```

    ## [1] "xgbPred 527"

``` r
params <- list(max_depth = 5, 
              objective = "binary:logistic",
              nthread = ncore)
model <- xgb.cv(data = as.matrix(treatedTrainM[, selvars, drop = FALSE]),
                label = treatedTrainM[[yName]],
                nrounds = 400,
                params = params,
                nfold = 5,
                early_stopping_rounds = 10,
                eval_metric = "logloss")
```

    ## [1]  train-logloss:0.502159+0.000620 test-logloss:0.503705+0.001144 
    ## Multiple eval metrics are present. Will use test_logloss for early stopping.
    ## Will train until test_logloss hasn't improved in 10 rounds.
    ## 
    ## [2]  train-logloss:0.398753+0.001097 test-logloss:0.401479+0.002218 
    ## [3]  train-logloss:0.336302+0.001233 test-logloss:0.340424+0.003055 
    ## [4]  train-logloss:0.296987+0.001516 test-logloss:0.302583+0.003754 
    ## [5]  train-logloss:0.271537+0.001521 test-logloss:0.278552+0.004470 
    ## [6]  train-logloss:0.254783+0.001588 test-logloss:0.263004+0.005012 
    ## [7]  train-logloss:0.243489+0.001624 test-logloss:0.253144+0.005416 
    ## [8]  train-logloss:0.235563+0.001707 test-logloss:0.246959+0.005732 
    ## [9]  train-logloss:0.230037+0.001569 test-logloss:0.243185+0.005829 
    ## [10] train-logloss:0.225742+0.001519 test-logloss:0.240639+0.005974 
    ## [11] train-logloss:0.222362+0.001614 test-logloss:0.238949+0.006371 
    ## [12] train-logloss:0.219591+0.001556 test-logloss:0.237901+0.006568 
    ## [13] train-logloss:0.217377+0.001563 test-logloss:0.237363+0.006704 
    ## [14] train-logloss:0.215518+0.001576 test-logloss:0.237099+0.006719 
    ## [15] train-logloss:0.213515+0.001549 test-logloss:0.236753+0.006572 
    ## [16] train-logloss:0.211624+0.001351 test-logloss:0.236627+0.006714 
    ## [17] train-logloss:0.209626+0.001522 test-logloss:0.236626+0.006633 
    ## [18] train-logloss:0.207940+0.001689 test-logloss:0.236419+0.006786 
    ## [19] train-logloss:0.206242+0.001860 test-logloss:0.236392+0.006808 
    ## [20] train-logloss:0.204831+0.001800 test-logloss:0.236504+0.006879 
    ## [21] train-logloss:0.203383+0.002027 test-logloss:0.236565+0.006968 
    ## [22] train-logloss:0.202086+0.001897 test-logloss:0.236733+0.007030 
    ## [23] train-logloss:0.200743+0.001976 test-logloss:0.236896+0.007089 
    ## [24] train-logloss:0.199439+0.001718 test-logloss:0.236858+0.007081 
    ## [25] train-logloss:0.198148+0.001348 test-logloss:0.237026+0.006904 
    ## [26] train-logloss:0.197186+0.001331 test-logloss:0.237218+0.007037 
    ## [27] train-logloss:0.196128+0.001258 test-logloss:0.237225+0.006925 
    ## [28] train-logloss:0.195027+0.001381 test-logloss:0.237298+0.006904 
    ## [29] train-logloss:0.193811+0.001495 test-logloss:0.237520+0.006961 
    ## Stopping. Best iteration:
    ## [19] train-logloss:0.206242+0.001860 test-logloss:0.236392+0.006808

``` r
nrounds <- model$best_iteration
print(paste("nrounds", nrounds))
```

    ## [1] "nrounds 19"

``` r
model <- xgboost(data = as.matrix(treatedTrainM[, selvars, drop = FALSE]),
                 label = treatedTrainM[[yName]],
                 nrounds = nrounds,
                 params = params)
```

    ## [1]  train-error:0.071630 
    ## [2]  train-error:0.071206 
    ## [3]  train-error:0.071530 
    ## [4]  train-error:0.071330 
    ## [5]  train-error:0.071505 
    ## [6]  train-error:0.071730 
    ## [7]  train-error:0.071655 
    ## [8]  train-error:0.071430 
    ## [9]  train-error:0.071430 
    ## [10] train-error:0.071380 
    ## [11] train-error:0.071256 
    ## [12] train-error:0.071206 
    ## [13] train-error:0.070781 
    ## [14] train-error:0.070457 
    ## [15] train-error:0.070407 
    ## [16] train-error:0.070357 
    ## [17] train-error:0.069533 
    ## [18] train-error:0.069308 
    ## [19] train-error:0.069009

``` r
treatedTrainP[[mname]] = predict(
  model, 
  newdata = as.matrix(treatedTrainM[, selvars, drop = FALSE]), 
  n.trees = nTrees,
  type = 'response')
treatedTestP[[mname]] = predict(
  model,
  newdata = as.matrix(treatedTest[, selvars, drop = FALSE]), 
  n.trees = nTrees,
  type = "response")
date()
```

    ## [1] "Sat Apr 13 06:30:27 2019"

``` r
calcAUC(treatedTestP[[mname]], treatedTestP[[yName]]==yTarget)
```

    ## [1] 0.7324135

``` r
permTestAUC(treatedTestP, mname, yName, yTarget = yTarget)
```

    ## [1] "AUC test alt. hyp. AUC>AUC(permuted): (AUC=0.7324, s.d.=0.0153, p<1e-05)."

``` r
wrapChiSqTest(treatedTestP, mname, yName, yTarget = yTarget)
```

    ## [1] "Chi-Square Test summary: pseudo-R2=0.09674 (X2(1,N=4975)=257.8, p<1e-05)."

``` r
date()
```

    ## [1] "Sat Apr 13 06:30:28 2019"

``` r
t1 = paste(mname,'trainingM data')
print(DoubleDensityPlot(treatedTrainP, mname, yName, 
                        title=t1))
```

![](KDD2009vtreat_files/figure-gfm/kddplot-1.png)<!-- -->

``` r
print(ROCPlot(treatedTrainP, mname, yName, yTarget,
              title=t1))
```

![](KDD2009vtreat_files/figure-gfm/kddplot-2.png)<!-- -->

``` r
print(WVPlots::PRPlot(treatedTrainP, mname, yName, yTarget,
              title=t1))
```

![](KDD2009vtreat_files/figure-gfm/kddplot-3.png)<!-- -->

``` r
t2 = paste(mname,'test data')
print(DoubleDensityPlot(treatedTestP, mname, yName, 
                        title=t2))
```

![](KDD2009vtreat_files/figure-gfm/kddplot-4.png)<!-- -->

``` r
print(ROCPlot(treatedTestP, mname, yName, yTarget,
              title=t2))
```

![](KDD2009vtreat_files/figure-gfm/kddplot-5.png)<!-- -->

``` r
print(WVPlots::PRPlot(treatedTestP, mname, yName, yTarget,
              title=t2))
```

![](KDD2009vtreat_files/figure-gfm/kddplot-6.png)<!-- -->

``` r
print(date())
```

    ## [1] "Sat Apr 13 06:30:35 2019"

``` r
print("*****************************")
```

    ## [1] "*****************************"

``` r
date()
```

    ## [1] "Sat Apr 13 06:30:35 2019"

``` r
if(!is.null(cl)) {
    parallel::stopCluster(cl)
    cl = NULL
}
```
