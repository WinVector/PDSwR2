# example 3.12 of section 3.2.2 
# (example 3.12 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Examining the correlation between age and income 

customer_data2 <- subset(customer_data,
                   0 < age & age < 100 & 
                    0 < income & income < 200000)      	# Note: 1 
                    
cor(customer_data2$age, customer_data2$income)          	# Note: 2 
## [1] 0.005766697                                     	# Note: 3

# Note 1: 
#   Only consider a subset of data with 
#   reasonable age and income values. 

# Note 2: 
#   Get correlation of age and income. 

# Note 3: 
#   Resulting correlation is positive but nearly zero. 

