# example 4.7 of section 4.2 
# (example 4.7 of section 4.2)  : Managing data : Data transformations 
# Title: Normalizing income by state 

library(dplyr)
median_income_table <- readRDS("median_income.RDS")                      	# Note: 1 
head(median_income_table)  

##   state_of_res median_income
## 1      Alabama         21100
## 2       Alaska         32050
## 3      Arizona         26000
## 4     Arkansas         22900
## 5   California         25000
## 6     Colorado         32000

training_prepared <-  training_prepared %>%
  left_join(., median_income_table, by="state_of_res") %>%             	# Note: 2 
  mutate(income_normalized = income/median_income) 

head(training_prepared[, c("income", "median_income", "income_normalized")]) 	# Note: 3 

##   income median_income income_normalized
## 1  22000         21100         1.0426540
## 2  23200         21100         1.0995261
## 3  21000         21100         0.9952607
## 4  37770         21100         1.7900474
## 5  39000         21100         1.8483412
## 6  11100         21100         0.5260664

summary(training_prepared$income_normalized)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.0000  0.4049  1.0000  1.5685  1.9627 46.5556

# Note 1: 
#   If you have downloaded the PDSwR2 code example directory, then median_income.RDS is in the 
#   directory PDSwR2/Custdata. Here we assume that this is your working directory. 

# Note 2: 
#   Join median_income_table into the customer data, so 
#   you can normalize each person’s income by the median 
#   income of their state. 

# Note 3: 
#   Compare the values of income and income_normalized. 

