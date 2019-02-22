# informalexample 7.14 of section 7.5.9 
# (informalexample 7.14 of section 7.5.9)  : Advanced Data Preparation : The vtreat package in general : The cross-frame 

set.seed(2019)

d <- data.frame(
  x = sample(letters, 100, replace = TRUE),
  y = rnorm(100),
  stringsAsFactors = FALSE
)

head(d)

##   x           y
## 1 u -0.05294738
## 2 s -0.23639840
## 3 h -0.33796351
## 4 q -0.75548467
## 5 b -0.86159347
## 6 b -0.52766549

plan5 <- vtreat::designTreatmentsN(d, 
                                   varlist = c("x"),
                                   outcomename = "y",
                                   codeRestriction = "catN",
                                   minFraction = 2,
                                   verbose = FALSE)
                                   
training_data1 <- vtreat::prepare(plan5, d)

training_data1$x <- d$x

head(training_data1)
##       x_catN           y x
## 1  0.4070979 -0.05294738 u
## 2 -0.1133011 -0.23639840 s
## 3 -0.3202346 -0.33796351 h
## 4 -0.5447443 -0.75548467 q
## 5 -0.3890076 -0.86159347 b
## 6 -0.3890076 -0.52766549 b

sigr::wrapCorTest(training_data1, "x_catN", "y")

## [1] "Pearson's product-moment correlation: (r=0.4927, p<1e-05)."

plan5$scoreFrame
##   varName varMoves        rsq       sig needsSplit extraModelDegrees
## 1  x_catN     TRUE 0.01725439 0.1926781       TRUE                24
##   origName code
## 1        x catN

