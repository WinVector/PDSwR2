KDD2009vtreat
================
John Mount

Practical data science with R built chapter 6 built a number of single variable models. In Listing 6.11 it used an ad-hoc entropy based out of sample effect size estimate for variable selection. This likely (though it isn't completely rigorous) picked variables conservatively.

``` r
date()
```

    ## [1] "Wed Feb 27 13:14:27 2019"

``` r
#load some libraries
library('vtreat')
library('WVPlots') 
library('sigr')
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

    ## [1] "Wed Feb 27 13:14:34 2019"

``` r
date()
```

    ## [1] "Wed Feb 27 13:14:34 2019"

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

    ## [1] "Wed Feb 27 13:18:45 2019"

``` r
date()
```

    ## [1] "Wed Feb 27 13:18:45 2019"

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

    ## [1] "vtreat 1.3.8 start initial treatment design Wed Feb 27 13:18:45 2019"
    ## [1] " start cross frame work Wed Feb 27 13:22:06 2019"
    ## [1] " vtreat::mkCrossFrameCExperiment done Wed Feb 27 13:24:21 2019"

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

    ## [1] "Wed Feb 27 13:24:21 2019"

``` r
date()
```

    ## [1] "Wed Feb 27 13:24:22 2019"

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

    ## [1]  train-logloss:0.502540+0.000629 test-logloss:0.503935+0.001050 
    ## Multiple eval metrics are present. Will use test_logloss for early stopping.
    ## Will train until test_logloss hasn't improved in 10 rounds.
    ## 
    ## [2]  train-logloss:0.399229+0.001076 test-logloss:0.402027+0.002116 
    ## [3]  train-logloss:0.336689+0.001201 test-logloss:0.341254+0.003123 
    ## [4]  train-logloss:0.297352+0.001418 test-logloss:0.303323+0.003797 
    ## [5]  train-logloss:0.272063+0.001537 test-logloss:0.279315+0.004559 
    ## [6]  train-logloss:0.255180+0.001467 test-logloss:0.263921+0.005135 
    ## [7]  train-logloss:0.243892+0.001701 test-logloss:0.254125+0.005463 
    ## [8]  train-logloss:0.236063+0.001759 test-logloss:0.247572+0.005824 
    ## [9]  train-logloss:0.230381+0.001819 test-logloss:0.243748+0.005979 
    ## [10] train-logloss:0.226055+0.001647 test-logloss:0.241380+0.006233 
    ## [11] train-logloss:0.222732+0.001652 test-logloss:0.239774+0.006337 
    ## [12] train-logloss:0.219934+0.001663 test-logloss:0.238841+0.006345 
    ## [13] train-logloss:0.217718+0.001783 test-logloss:0.238203+0.006416 
    ## [14] train-logloss:0.215477+0.001769 test-logloss:0.237869+0.006557 
    ## [15] train-logloss:0.213680+0.001679 test-logloss:0.237583+0.006805 
    ## [16] train-logloss:0.211506+0.001959 test-logloss:0.237681+0.006809 
    ## [17] train-logloss:0.209794+0.002097 test-logloss:0.237500+0.006898 
    ## [18] train-logloss:0.208174+0.001914 test-logloss:0.237484+0.006880 
    ## [19] train-logloss:0.206759+0.001903 test-logloss:0.237512+0.006956 
    ## [20] train-logloss:0.205380+0.002053 test-logloss:0.237528+0.006919 
    ## [21] train-logloss:0.203815+0.001907 test-logloss:0.237690+0.006940 
    ## [22] train-logloss:0.202362+0.001847 test-logloss:0.237666+0.007155 
    ## [23] train-logloss:0.201223+0.001582 test-logloss:0.237754+0.007049 
    ## [24] train-logloss:0.199637+0.001449 test-logloss:0.237866+0.007058 
    ## [25] train-logloss:0.198425+0.001514 test-logloss:0.237911+0.007103 
    ## [26] train-logloss:0.197201+0.001674 test-logloss:0.238108+0.007209 
    ## [27] train-logloss:0.196206+0.001931 test-logloss:0.238314+0.007358 
    ## [28] train-logloss:0.195006+0.002115 test-logloss:0.238311+0.007065 
    ## Stopping. Best iteration:
    ## [18] train-logloss:0.208174+0.001914 test-logloss:0.237484+0.006880

``` r
nrounds <- model$best_iteration
print(paste("nrounds", nrounds))
```

    ## [1] "nrounds 18"

``` r
model <- xgboost(data = as.matrix(treatedTrainM[, selvars, drop = FALSE]),
                 label = treatedTrainM[[yName]],
                 nrounds = nrounds,
                 params = params)
```

    ## [1]  train-error:0.071855 
    ## [2]  train-error:0.071705 
    ## [3]  train-error:0.071705 
    ## [4]  train-error:0.071755 
    ## [5]  train-error:0.071830 
    ## [6]  train-error:0.072055 
    ## [7]  train-error:0.072129 
    ## [8]  train-error:0.072204 
    ## [9]  train-error:0.072179 
    ## [10] train-error:0.071755 
    ## [11] train-error:0.071630 
    ## [12] train-error:0.071256 
    ## [13] train-error:0.071106 
    ## [14] train-error:0.070756 
    ## [15] train-error:0.070532 
    ## [16] train-error:0.070507 
    ## [17] train-error:0.070107 
    ## [18] train-error:0.069932

``` r
treatedTrainP[[mname]] = predict(model, 
                                 newdata=as.matrix(treatedTrainM[, selvars, drop = FALSE]), 
                                 type='response')
treatedTestP[[mname]] = predict(model,
                                newdata=as.matrix(treatedTest[, selvars, drop = FALSE]), 
                                n.trees=nTrees)
date()
```

    ## [1] "Wed Feb 27 13:27:18 2019"

``` r
calcAUC(treatedTestP[[mname]], treatedTestP[[yName]]==yTarget)
```

    ## [1] 0.7323941

``` r
permTestAUC(treatedTestP, mname, yName, yTarget = yTarget)
```

    ## [1] "AUC test alt. hyp. AUC>AUC(permuted): (AUC=0.7324, s.d.=0.01494, p<1e-05)."

``` r
wrapChiSqTest(treatedTestP, mname, yName, yTarget = yTarget)
```

    ## [1] "Chi-Square Test summary: pseudo-R2=0.09953 (X2(1,N=4975)=265.3, p<1e-05)."

``` r
date()
```

    ## [1] "Wed Feb 27 13:27:19 2019"

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

    ## [1] "Wed Feb 27 13:27:22 2019"

``` r
print("*****************************")
```

    ## [1] "*****************************"

``` r
date()
```

    ## [1] "Wed Feb 27 13:27:22 2019"

``` r
if(!is.null(cl)) {
    parallel::stopCluster(cl)
    cl = NULL
}
```
