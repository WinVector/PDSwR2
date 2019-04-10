KDD2009vtreat
================
John Mount

KDD2009 example using the `vtreat` `R` package.

``` r
date()
```

    ## [1] "Wed Apr 10 10:25:16 2019"

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
dir = "./"


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

    ## [1] "Wed Apr 10 10:25:28 2019"

``` r
date()
```

    ## [1] "Wed Apr 10 10:25:28 2019"

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

    ## [1] "Wed Apr 10 10:33:28 2019"

``` r
date()
```

    ## [1] "Wed Apr 10 10:33:28 2019"

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

    ## [1] "vtreat 1.4.0 start initial treatment design Wed Apr 10 10:33:28 2019"
    ## [1] " start cross frame work Wed Apr 10 10:39:58 2019"
    ## [1] " vtreat::mkCrossFrameCExperiment done Wed Apr 10 10:45:03 2019"

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

    ## [1] "Wed Apr 10 10:45:04 2019"

``` r
date()
```

    ## [1] "Wed Apr 10 10:45:04 2019"

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

    ## [1]  train-logloss:0.502193+0.000578 test-logloss:0.503657+0.001099 
    ## Multiple eval metrics are present. Will use test_logloss for early stopping.
    ## Will train until test_logloss hasn't improved in 10 rounds.
    ## 
    ## [2]  train-logloss:0.398788+0.001037 test-logloss:0.401501+0.002130 
    ## [3]  train-logloss:0.336293+0.001184 test-logloss:0.340426+0.002931 
    ## [4]  train-logloss:0.297012+0.001491 test-logloss:0.302506+0.003549 
    ## [5]  train-logloss:0.271595+0.001531 test-logloss:0.278372+0.004130 
    ## [6]  train-logloss:0.254769+0.001566 test-logloss:0.262993+0.004615 
    ## [7]  train-logloss:0.243327+0.001584 test-logloss:0.253198+0.005169 
    ## [8]  train-logloss:0.235735+0.001644 test-logloss:0.247203+0.005481 
    ## [9]  train-logloss:0.230149+0.001598 test-logloss:0.243372+0.005684 
    ## [10] train-logloss:0.225769+0.001678 test-logloss:0.241090+0.006208 
    ## [11] train-logloss:0.222306+0.001778 test-logloss:0.239557+0.006249 
    ## [12] train-logloss:0.219579+0.001914 test-logloss:0.238442+0.006230 
    ## [13] train-logloss:0.217218+0.001746 test-logloss:0.237698+0.006417 
    ## [14] train-logloss:0.215185+0.001551 test-logloss:0.237298+0.006517 
    ## [15] train-logloss:0.212964+0.001414 test-logloss:0.236842+0.006548 
    ## [16] train-logloss:0.211125+0.001387 test-logloss:0.236456+0.006581 
    ## [17] train-logloss:0.209394+0.001626 test-logloss:0.236167+0.006658 
    ## [18] train-logloss:0.207668+0.001594 test-logloss:0.236152+0.006799 
    ## [19] train-logloss:0.205996+0.001464 test-logloss:0.236072+0.007031 
    ## [20] train-logloss:0.204061+0.001659 test-logloss:0.236295+0.007137 
    ## [21] train-logloss:0.202353+0.001624 test-logloss:0.236407+0.007216 
    ## [22] train-logloss:0.201008+0.001359 test-logloss:0.236331+0.007251 
    ## [23] train-logloss:0.199915+0.001331 test-logloss:0.236405+0.007242 
    ## [24] train-logloss:0.198619+0.001152 test-logloss:0.236624+0.007147 
    ## [25] train-logloss:0.197440+0.001129 test-logloss:0.236673+0.007105 
    ## [26] train-logloss:0.195814+0.001401 test-logloss:0.237096+0.007094 
    ## [27] train-logloss:0.194355+0.001503 test-logloss:0.237369+0.007021 
    ## [28] train-logloss:0.193297+0.001931 test-logloss:0.237387+0.007177 
    ## [29] train-logloss:0.192002+0.001789 test-logloss:0.237699+0.007054 
    ## Stopping. Best iteration:
    ## [19] train-logloss:0.205996+0.001464 test-logloss:0.236072+0.007031

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

    ## [1]  train-error:0.071231 
    ## [2]  train-error:0.071031 
    ## [3]  train-error:0.071355 
    ## [4]  train-error:0.071530 
    ## [5]  train-error:0.071655 
    ## [6]  train-error:0.071306 
    ## [7]  train-error:0.071306 
    ## [8]  train-error:0.071231 
    ## [9]  train-error:0.070931 
    ## [10] train-error:0.070831 
    ## [11] train-error:0.070856 
    ## [12] train-error:0.070681 
    ## [13] train-error:0.070357 
    ## [14] train-error:0.070132 
    ## [15] train-error:0.069982 
    ## [16] train-error:0.069932 
    ## [17] train-error:0.069708 
    ## [18] train-error:0.069533 
    ## [19] train-error:0.069308

``` r
treatedTrainP[[mname]] = predict(model, 
                                 newdata=as.matrix(treatedTrainM[, selvars, drop = FALSE]), 
                                 type='response')
treatedTestP[[mname]] = predict(model,
                                newdata=as.matrix(treatedTest[, selvars, drop = FALSE]), 
                                n.trees=nTrees)
date()
```

    ## [1] "Wed Apr 10 10:52:27 2019"

``` r
calcAUC(treatedTestP[[mname]], treatedTestP[[yName]]==yTarget)
```

    ## [1] 0.7318291

``` r
permTestAUC(treatedTestP, mname, yName, yTarget = yTarget)
```

    ## [1] "AUC test alt. hyp. AUC>AUC(permuted): (AUC=0.7318, s.d.=0.01551, p<1e-05)."

``` r
wrapChiSqTest(treatedTestP, mname, yName, yTarget = yTarget)
```

    ## [1] "Chi-Square Test summary: pseudo-R2=0.09748 (X2(1,N=4975)=259.8, p<1e-05)."

``` r
date()
```

    ## [1] "Wed Apr 10 10:52:29 2019"

``` r
t1 = paste(mname,'trainingM data')
print(DoubleDensityPlot(treatedTrainP, mname, yName, 
                        title=t1))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-1.png)

``` r
print(ROCPlot(treatedTrainP, mname, yName, yTarget,
              title=t1))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-2.png)

``` r
print(WVPlots::PRPlot(treatedTrainP, mname, yName, yTarget,
              title=t1))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-3.png)

``` r
t2 = paste(mname,'test data')
print(DoubleDensityPlot(treatedTestP, mname, yName, 
                        title=t2))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-4.png)

``` r
print(ROCPlot(treatedTestP, mname, yName, yTarget,
              title=t2))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-5.png)

``` r
print(WVPlots::PRPlot(treatedTestP, mname, yName, yTarget,
              title=t2))
```

![](KDD2009vtreat_files/figure-markdown_github/kddplot-6.png)

``` r
print(date())
```

    ## [1] "Wed Apr 10 10:52:36 2019"

``` r
print("*****************************")
```

    ## [1] "*****************************"

``` r
date()
```

    ## [1] "Wed Apr 10 10:52:36 2019"

``` r
if(!is.null(cl)) {
    parallel::stopCluster(cl)
    cl = NULL
}
```
