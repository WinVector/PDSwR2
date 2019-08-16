# example 9.6 of section 9.1.3 
# (example 9.6 of section 9.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Running clusterboot() on the protein data 

library(fpc)                                                	# Note: 1 
kbest_p <- 5                                                      	# Note: 2 
cboot_hclust <- clusterboot(pmatrix,
                           clustermethod = hclustCBI,    	# Note: 3  
                           method = "ward.D",
                           k = kbest_p)
                           
summary(cboot_hclust$result)                               	# Note: 4 

##               Length Class  Mode     
## result         7     hclust list     
## noise          1     -none- logical  
## nc             1     -none- numeric  
## clusterlist    5     -none- list     
## partition     25     -none- numeric  
## clustermethod  1     -none- character
## nccl           1     -none- numeric

groups <- cboot_hclust$result$partition                        	# Note: 5 
print_clusters(protein, groups, cols_to_print)                               	# Note: 6 

## $`1`
##       Country RedMeat Fish Fr.Veg
## 1     Albania    10.1  0.2    1.7
## 4    Bulgaria     7.8  1.2    4.2
## 18    Romania     6.2  1.0    2.8
## 25 Yugoslavia     4.4  0.6    3.2
## 
## $`2`
##        Country RedMeat Fish Fr.Veg
## 2      Austria     8.9  2.1    4.3
## 3      Belgium    13.5  4.5    4.0
## 9       France    18.0  5.7    6.5
## 12     Ireland    13.9  2.2    2.9
## 14 Netherlands     9.5  2.5    3.7
## 21 Switzerland    13.1  2.3    4.9
## 22          UK    17.4  4.3    3.3
## 24   W Germany    11.4  3.4    3.8
## 
## $`3`
##           Country RedMeat Fish Fr.Veg
## 5  Czechoslovakia     9.7  2.0    4.0
## 7       E Germany     8.4  5.4    3.6
## 11        Hungary     5.3  0.3    4.2
## 16         Poland     6.9  3.0    6.6
## 23           USSR     9.3  3.0    2.9
## 
## $`4`
##    Country RedMeat Fish Fr.Veg
## 6  Denmark    10.6  9.9    2.4
## 8  Finland     9.5  5.8    1.4
## 15  Norway     9.4  9.7    2.7
## 20  Sweden     9.9  7.5    2.0
## 
## $`5`
##     Country RedMeat Fish Fr.Veg
## 10   Greece    10.2  5.9    6.5
## 13    Italy     9.0  3.4    6.7
## 17 Portugal     6.2 14.2    7.9
## 19    Spain     7.1  7.0    7.2

cboot_hclust$bootmean                                       	# Note: 7 
## [1] 0.8090000 0.7939643 0.6247976 0.9366667 0.7815000

cboot_hclust$bootbrd                                        	# Note: 8 
## [1] 19 14 45  9 30

# Note 1: 
#   Load the fpc package. You may have to 
#   install it first. 

# Note 2: 
#   Set the desired number of clusters. 

# Note 3: 
#   Run clusterboot() with hclust 
#   (clustermethod = hclustCBI) using Ward’s method 
#   (method = "ward.D") and kbest_p clusters 
#   (k = kbest_p). Return the results in an object 
#   called cboot_hclust. 

# Note 4: 
#   The results of the clustering are in 
#   cboot_hclust$result. 

# Note 5: 
#   cboot_hclust$result$partition returns a 
#   vector of clusterlabels. 

# Note 6: 
#   The clusters are the same as those produced 
#   by a direct call to hclust(). 

# Note 7: 
#   The vector of cluster stabilities. 

# Note 8: 
#   The count of how many times each cluster was 
#   dissolved. By default clusterboot() runs 100 
#   bootstrap iterations. 

