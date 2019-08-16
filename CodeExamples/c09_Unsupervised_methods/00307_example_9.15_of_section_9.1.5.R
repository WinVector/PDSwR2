# example 9.15 of section 9.1.5 
# (example 9.15 of section 9.1.5)  : Unsupervised methods : Cluster analysis : Assigning new points to clusters 
# Title: Generate and cluster synthetic data for cluster assignment example 

mean1 <- c(1, 1, 1)                                  	# Note: 1 
sd1 <- c(1, 2, 1)

mean2 <- c(10, -3, 5)
sd2 <- c(2, 1, 2)

mean3 <- c(-5, -5, -5)
sd3 <- c(1.5, 2, 1)

library(MASS)                                       	# Note: 2 
clust1 <- mvrnorm(100, mu = mean1, Sigma = diag(sd1))
clust2 <- mvrnorm(100, mu = mean2, Sigma = diag(sd2))
clust3 <- mvrnorm(100, mu = mean3, Sigma = diag(sd3))
toydata <- rbind(clust3, rbind(clust1, clust2))

tmatrix <- scale(toydata)                          	# Note: 3  
tcenter <- attr(tmatrix, "scaled:center")           	# Note: 4 
tscale <-attr(tmatrix, "scaled:scale")
tmatrix <- rm_scales(tmatrix)

kbest_t <- 3
tclusters <- kmeans(tmatrix, kbest_t, nstart = 100, iter.max = 100)     	# Note: 5 

tclusters$size                                   	# Note: 6        
## [1] 101 100  99

# Note 1: 
#   Set the parameters for three 3D 
#   Gaussian clusters. 

# Note 2: 
#   Use the mvrnorm() function from MASS package to generate 
#   three-dimensional axis-aligned Gaussian clusters. 

# Note 3: 
#   Scale the synthetic data. 

# Note 4: 
#   Get the scaling attributes, then remove them from the matrix. 

# Note 5: 
#   Cluster the synthetic data into three clusters. 

# Note 6: 
#   The generated clusters are consistent in size with the true clusters. 

