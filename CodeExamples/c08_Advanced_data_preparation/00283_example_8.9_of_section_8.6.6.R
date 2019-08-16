# example 8.9 of section 8.6.6 
# (example 8.9 of section 8.6.6)  : Advanced data preparation : Mastering the vtreat package : The cross-frame 
# Title: The dangers of re-using data 

plan5 <- vtreat::designTreatmentsN(d,                      	# Note: 1 
                                   varlist = c("x_bad", "x_good"),
                                   outcomename = "y",
                                   codeRestriction = "catN",
                                   minFraction = 2,
                                   verbose = FALSE)

class(plan5)
# [1] "treatmentplan"

print(plan5)                                                	# Note: 2 
#   origName     varName code          rsq          sig extraModelDegrees
# 1    x_bad  x_bad_catN catN 4.906903e-05 9.448548e-01                24
# 2   x_good x_good_catN catN 2.602702e-01 5.895285e-08                 1

training_data1 <- vtreat::prepare(plan5, d)                  	# Note: 3 
                                
res1 <- vtreat::patch_columns_into_frame(d, training_data1)    	# Note: 4 
head(res1)
#   x_bad  x_good x_bad_catN x_good_catN           y
# 1     u non-neg  0.4070979   0.4305195 -0.05294738
# 2     s     neg -0.1133011  -0.5706886 -0.23639840
# 3     h non-neg -0.3202346   0.4305195 -0.33796351
# 4     q non-neg -0.5447443   0.4305195 -0.75548467
# 5     b     neg -0.3890076  -0.5706886 -0.86159347
# 6     b non-neg -0.3890076   0.4305195 -0.52766549

sigr::wrapFTest(res1, "x_good_catN", "y")              	# Note: 5 
# [1] "F Test summary: (R2=0.2717, F(1,98)=36.56, p<1e-05)."

sigr::wrapFTest(res1, "x_bad_catN", "y")               	# Note: 6 
# [1] "F Test summary: (R2=0.2342, F(1,98)=29.97, p<1e-05)."

# Note 1: 
#   Design a variable treatment plan using x_bad and x_good to try predicting y. 

# Note 2: 
#   Notice the derived variable x_good_catN comes out as having a significant signal, and x_bad_catN does not.  
#   This is due to the proper use of cross-validation in the vtreat quality estimates. 

# Note 3: 
#   Call prepare() on the same data used to design the treatment 
#   plan—this is not always safe, as we shall 
#   see. 

# Note 4: 
#   Combine the data frames d an training_data1, using training_data1 when there are columns with duplicate names. 

# Note 5: 
#   Use a statistical F-test to check the predictive power of x_good_catN. 

# Note 6: 
#   x_bad_catN’s F-test is inflated and falsely looks 
#   significant, this is due to failure to use cross validated methods. 

