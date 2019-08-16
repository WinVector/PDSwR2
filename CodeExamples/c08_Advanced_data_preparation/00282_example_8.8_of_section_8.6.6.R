# example 8.8 of section 8.6.6 
# (example 8.8 of section 8.6.6)  : Advanced data preparation : Mastering the vtreat package : The cross-frame 
# Title: An information-free dataset 

set.seed(2019)                                               	# Note: 1 

d <- data.frame(                                             	# Note: 2 
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

# Note 1: 
#   Set pseudo-random number generator seed to make example reproducible. 

# Note 2: 
#   Build example data where there is no relation between x_bad and y. 

# Note 3: 
#   x_good is a noisy prediction of the sign of y, so it does have some information about y. 

# Note 4: 
#   Take a look at our synthetic example data. The idea is: y is related to x_good in a noisy fashion, but unrelated to x_bad.  
#   In this case, we know what variables should be chosen, so we can tell if our acceptance procedure is working correctly. 

