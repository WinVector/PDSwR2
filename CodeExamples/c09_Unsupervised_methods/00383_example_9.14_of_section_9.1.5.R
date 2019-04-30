# example 9.14 of section 9.1.5 
# (example 9.14 of section 9.1.5)  : Unsupervised methods : Cluster analysis : Assigning new points to clusters 
# Title: A function to assign points to a cluster 

assign_cluster <- function(newpt, centers, xcenter = 0, xscale = 1) { 
   xpt <- (newpt - xcenter) / xscale                                	# Note: 1 
   dists <- apply(centers, 1, FUN = function(c0) { sqr_edist(c0, xpt) })  	# Note: 2 
   which.min(dists)                                                 	# Note: 3 
 }

# Note 1: 
#   Center and scale the new data point. 

# Note 2: 
#   Calculate how far the new data point is from 
#   each of the cluster centers. 

# Note 3: 
#   Return the cluster number of the closest 
#   centroid. 

