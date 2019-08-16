# example 9.23 of section 9.2.3 
# (example 9.23 of section 9.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Finding the association rules 

rules <- apriori(bookbaskets_use,                                  	# Note: 1 
                 parameter = list(support = 0.002, confidence = 0.75))

summary(rules)
## set of 191 rules                                               	# Note: 2 
## 
## rule length distribution (lhs + rhs):sizes                     	# Note: 3 
##   2   3   4   5 
##  11 100  66  14 
## 
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   2.000   3.000   3.000   3.435   4.000   5.000 
## 
## summary of quality measures:                                   	# Note: 4 
##     support           confidence          lift            count      
##  Min.   :0.002009   Min.   :0.7500   Min.   : 40.89   Min.   : 82.0  
##  1st Qu.:0.002131   1st Qu.:0.8113   1st Qu.: 86.44   1st Qu.: 87.0  
##  Median :0.002278   Median :0.8468   Median :131.36   Median : 93.0  
##  Mean   :0.002593   Mean   :0.8569   Mean   :129.68   Mean   :105.8  
##  3rd Qu.:0.002695   3rd Qu.:0.9065   3rd Qu.:158.77   3rd Qu.:110.0  
##  Max.   :0.005830   Max.   :0.9882   Max.   :321.89   Max.   :238.0  
## 
## mining info:                                                  	# Note: 5 
##             data ntransactions support confidence
##  bookbaskets_use         40822   0.002       0.75

# Note 1: 
#   Call apriori() with a minimum support of 
#   0.002 and a minimum confidence of 0.75 

# Note 2: 
#   The number of rules found 

# Note 3: 
#   The distribution of rule lengths (in this 
#   example, most rules contain 3 items—2 on the left 
#   side, X (lhs), and one on the right side, Y 
#   (rhs)) 

# Note 4: 
#   A summary of rule quality measures, 
#   including support and confidence 

# Note 5: 
#   Some information on how apriori() was 
#   called 

