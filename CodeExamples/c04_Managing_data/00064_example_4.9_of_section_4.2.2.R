# example 4.9 of section 4.2.2 
# (example 4.9 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Centering and scaling age 

(mean_age = mean(training_prepared$age)) 	# Note: 1 
## [1] 49.21647

(sd_age = sd(training_prepared$age))  	# Note: 2 
## [1] 18.0124

scaled_age = (training_prepared$age - mean_age) / sd_age  	# Note: 3 

summary(scaled_age)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.56650 -0.84478 -0.06753  0.00000  0.70971  3.92971

# Note 1: 
#   Take the mean. 

# Note 2: 
#   Take the standard deviation. 

# Note 3: 
#   Use the mean value as the origin (or 
#   reference point) and rescale the distance from the 
#   mean by the standard deviation. 

