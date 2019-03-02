# example 8.8 of section 8.6.7 
# (example 8.8 of section 8.6.7)  : Advanced Data Preparation : The vtreat package in general : The cross-frame 
# Title: The dangers of re-using data 

set.seed(2019) 	# Note: 1 

d <- data.frame( 	# Note: 2 
  x_bad = sample(letters, 100, replace = TRUE),
  y = rnorm(100),
  stringsAsFactors = FALSE
)
d$x_good <- ifelse(d$y > rnorm(100), "non-neg", "neg") 	# Note: 3 


head(d) 	# Note: 4 
#   x_bad           y  x_good
# 1     u -0.05294738 non-neg
# 2     s -0.23639840     neg
# 3     h -0.33796351 non-neg
# 4     q -0.75548467 non-neg
# 5     b -0.86159347     neg
# 6     b -0.52766549 non-neg

plan5 <- vtreat::designTreatmentsN(d, 	# Note: 5 
                                   varlist = c("x_bad", "x_good"),
                                   outcomename = "y",
                                   codeRestriction = "catN",
                                   minFraction = 2,
                                   verbose = FALSE)

class(plan5)
# [1] "treatmentplan"

print(plan5) 	# Note: 6 
#   origName     varName code          rsq          sig extraModelDegrees
# 1    x_bad  x_bad_catN catN 4.906903e-05 9.448548e-01                24
# 2   x_good x_good_catN catN 2.602702e-01 5.895285e-08                 1

training_data1 <- vtreat::prepare(plan5, d) 	# Note: 7 
                                
res1 <- vtreat::patch_columns_into_frame(d, training_data1)
head(res1)
#   x_bad  x_good x_bad_catN x_good_catN           y
# 1     u non-neg  0.4070979   0.4305195 -0.05294738
# 2     s     neg -0.1133011  -0.5706886 -0.23639840
# 3     h non-neg -0.3202346   0.4305195 -0.33796351
# 4     q non-neg -0.5447443   0.4305195 -0.75548467
# 5     b     neg -0.3890076  -0.5706886 -0.86159347
# 6     b non-neg -0.3890076   0.4305195 -0.52766549

sigr::wrapFTest(res1, "x_good_catN", "y") 	# Note: 8 
# [1] "F Test summary: (R2=0.2717, F(1,98)=36.56, p<1e-05)."

sigr::wrapFTest(res1, "x_bad_catN", "y") 	# Note: 9 
# [1] "F Test summary: (R2=0.2342, F(1,98)=29.97, p<1e-05)."

# Note 1: 
#   Set pseudo-random number generator seed to make example reproducible. 

# Note 2: 
#   Build example data where there is no relation between x_bad and y. 

# Note 3: 
#   x_good is a noisy prediction of the sign of y, so it does have some information about y. 

# Note 4: 
#   Take a look at our example data. 

# Note 5: 
#   Design a variable treatment plan using x_bad and x_good to try and predict y. 

# Note 6: 
#   Notice the derived variable x_good_catN comes out as having a significant signal, and x_bad_catN does not. This is due to proper cross-validation in estimating the variable qualities. 

# Note 7: 
#   Call prepare() on the same data used to design the treatment plan- this is not always safe, as we shall see. 

# Note 8: 
#   Use a statistical F-test to check the predictive power of x_good_catN. 

# Note 9: 
#   Here is the bad consequence: x_bad_catN's F-test is inflated and falsely looks significant. 

