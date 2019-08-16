# example 4.9 of section 4.2.2 
# (example 4.9 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Centering and scaling age 

(mean_age <- mean(training_prepared$age))                 	# Note: 1 
## [1] 49.21647

(sd_age <- sd(training_prepared$age))                     	# Note: 2 
## [1] 18.0124

print(mean_age + c(-sd_age, sd_age))                      	# Note: 3 
## [1] 31.20407 67.22886

training_prepared$scaled_age <- (training_prepared$age - mean_age) / sd_age 	# Note: 4 

training_prepared %>% 
  filter(abs(age - mean_age) < sd_age) %>%
  select(age, scaled_age) %>%
  head()

##   age scaled_age                                      	# Note: 5 
## 1  67  0.9872942
## 2  54  0.2655690
## 3  61  0.6541903
## 4  64  0.8207422
## 5  57  0.4321210
## 6  55  0.3210864

training_prepared %>% 
  filter(abs(age - mean_age) > sd_age) %>%
  select(age, scaled_age) %>%
  head()

##   age scaled_age                                       	# Note: 6 
## 1  24  -1.399951
## 2  82   1.820054
## 3  31  -1.011329
## 4  93   2.430745
## 5  76   1.486950
## 6  26  -1.288916

# Note 1: 
#   Take the mean. 

# Note 2: 
#   Take the standard deviation. 

# Note 3: 
#   The “typical” age range for this population is 
#   from about 31 to 67. 

# Note 4: 
#   Use the mean value as the origin (or 
#   reference point) and rescale the distance from the 
#   mean by the standard deviation. 

# Note 5: 
#   Customers in the typical age range have a scaled_age with magnitude less than 1. 

# Note 6: 
#   Customers outside the typical age range have a scaled_age with magnitude greater than 1. 

