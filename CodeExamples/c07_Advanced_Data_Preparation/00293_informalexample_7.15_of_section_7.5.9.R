# informalexample 7.15 of section 7.5.9 
# (informalexample 7.15 of section 7.5.9)  : Advanced Data Preparation : The vtreat package in general : The cross-frame 

cfe <- vtreat::mkCrossFrameNExperiment(d, 
                                       varlist = c("x"),
                                       outcomename = "y",
                                       codeRestriction = "catN",
                                       minFraction = 2,
                                       verbose = FALSE)
plan6 <- cfe$treatments
training_data2 <- cfe$crossFrame

training_data2$x <- d$x

head(training_data2)
##       x_catN           y x
## 1  0.4839205 -0.05294738 u
## 2  0.1946550 -0.23639840 s
## 3  0.0000000 -0.33796351 h
## 4 -0.5292162 -0.75548467 q
## 5  0.1448742 -0.86159347 b
## 6 -0.4061672 -0.52766549 b

sigr::wrapCorTest(training_data2, "x_catN", "y")

## [1] "Pearson's product-moment correlation: (r=0.03175, p=n.s.)."

plan6$scoreFrame
##   varName varMoves         rsq       sig needsSplit extraModelDegrees
## 1  x_catN     TRUE 0.001875803 0.6687523       TRUE                24
##   origName code
## 1        x catN

