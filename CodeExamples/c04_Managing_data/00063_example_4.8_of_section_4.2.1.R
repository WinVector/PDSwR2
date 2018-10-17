# example 4.8 of section 4.2.1 
# (example 4.8 of section 4.2.1)  : Managing data : Data transformations : Normalization 
# Title: Normalizing by mean age 

summary(training_prepared$age)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   21.00   34.00   48.00   49.22   62.00  120.00

mean_age <- mean(training_prepared$age)
age_normalized <- training_prepared$age/mean_age
summary(age_normalized)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.4267  0.6908  0.9753  1.0000  1.2597  2.4382

