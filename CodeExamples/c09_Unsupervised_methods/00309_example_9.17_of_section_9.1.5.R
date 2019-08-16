# example 9.17 of section 9.1.5 
# (example 9.17 of section 9.1.5)  : Unsupervised methods : Cluster analysis : Assigning new points to clusters 
# Title: An example of assigning points to clusters 

assign_cluster(mvrnorm(1, mean1, diag(sd1)),    	# Note: 1 
                tclusters$centers,
                tcenter, tscale)

## 3 
## 3

assign_cluster(mvrnorm(1, mean2, diag(sd2)),     	# Note: 2 
                tclusters$centers,
                tcenter, tscale)

## 1 
## 1

assign_cluster(mvrnorm(1, mean3, diag(sd3)),        	# Note: 3 
                tclusters$centers,
                tcenter, tscale)

## 2 
## 2

# Note 1: 
#   # This should be assigned to cluster 3. 

# Note 2: 
#   # This should be assigned to cluster 1. 

# Note 3: 
#   # This should be assigned to cluster 2. 

