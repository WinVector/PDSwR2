# example 8.10 of section 8.6.6 
# (example 8.10 of section 8.6.6)  : Advanced data preparation : Mastering the vtreat package : The cross-frame 
# Title: Using mkCrossFrameNExperiment() 

cfe <- vtreat::mkCrossFrameNExperiment(d, 
                                       varlist = c("x_bad", "x_good"),
                                       outcomename = "y",
                                       codeRestriction = "catN",
                                       minFraction = 2,
                                       verbose = FALSE)
plan6 <- cfe$treatments

training_data2 <- cfe$crossFrame
res2 <- vtreat::patch_columns_into_frame(d, training_data2)

head(res2)
#   x_bad  x_good x_bad_catN x_good_catN           y
# 1     u non-neg  0.2834739   0.4193180 -0.05294738
# 2     s     neg -0.1085887  -0.6212118 -0.23639840
# 3     h non-neg  0.0000000   0.5095586 -0.33796351
# 4     q non-neg -0.5142570   0.5095586 -0.75548467
# 5     b     neg -0.3540889  -0.6212118 -0.86159347
# 6     b non-neg -0.3540889   0.4193180 -0.52766549

sigr::wrapFTest(res2, "x_bad_catN", "y")
# [1] "F Test summary: (R2=-0.1389, F(1,98)=-11.95, p=n.s.)."

sigr::wrapFTest(res2, "x_good_catN", "y")
# [1] "F Test summary: (R2=0.2532, F(1,98)=33.22, p<1e-05)."

plan6$scoreFrame                                               	# Note: 1 
#       varName varMoves        rsq          sig needsSplit
# 1  x_bad_catN     TRUE 0.01436145 2.349865e-01       TRUE
# 2 x_good_catN     TRUE 0.26478467 4.332649e-08       TRUE
#   extraModelDegrees origName code
# 1                24    x_bad catN
# 2                 1   x_good catN

# Note 1: 
#   The F-tests on the data and the scoreFrame statistics now largely agree. 

