# example 4.10 of section 4.2.2 
# (example 4.10 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Centering and scaling multiple numeric variables 

dataf <- training_prepared[, c("age", "income", "num_vehicles", "gas_usage")]
summary(dataf)

##       age             income         num_vehicles     gas_usage     
##  Min.   : 21.00   Min.   :      0   Min.   :0.000   Min.   :  4.00  
##  1st Qu.: 34.00   1st Qu.:  10700   1st Qu.:1.000   1st Qu.: 50.00  
##  Median : 48.00   Median :  26300   Median :2.000   Median : 76.01  
##  Mean   : 49.22   Mean   :  41792   Mean   :2.066   Mean   : 76.01  
##  3rd Qu.: 62.00   3rd Qu.:  51700   3rd Qu.:3.000   3rd Qu.: 76.01  
##  Max.   :120.00   Max.   :1257000   Max.   :6.000   Max.   :570.00

dataf_scaled <- scale(dataf, center=TRUE, scale=TRUE)               	# Note: 1 
                                        
summary(dataf_scaled)
##       age               income         num_vehicles        gas_usage      
##  Min.   :-1.56650   Min.   :-0.7193   Min.   :-1.78631   Min.   :-1.4198  
##  1st Qu.:-0.84478   1st Qu.:-0.5351   1st Qu.:-0.92148   1st Qu.:-0.5128  
##  Median :-0.06753   Median :-0.2666   Median :-0.05665   Median : 0.0000  
##  Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000  
##  3rd Qu.: 0.70971   3rd Qu.: 0.1705   3rd Qu.: 0.80819   3rd Qu.: 0.0000  
##  Max.   : 3.92971   Max.   :20.9149   Max.   : 3.40268   Max.   : 9.7400

(means <- attr(dataf_scaled, 'scaled:center'))                  	# Note: 2 
##          age       income num_vehicles    gas_usage 
##     49.21647  41792.51062      2.06550     76.00745

(sds <- attr(dataf_scaled, 'scaled:scale'))
##          age       income num_vehicles    gas_usage 
##    18.012397 58102.481410     1.156294    50.717778

# Note 1: 
#   Center the data by its mean and scale it by its standard deviation 

# Note 2: 
#   Get the means and standard deviations of the original data, which are stored as 
#   attributes of dataf_scaled 

