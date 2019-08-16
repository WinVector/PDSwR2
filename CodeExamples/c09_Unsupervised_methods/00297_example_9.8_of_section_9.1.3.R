# example 9.8 of section 9.1.3 
# (example 9.8 of section 9.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Plot WSS for a range of k 

get_wss <- function(dmatrix, max_clusters) {       	# Note: 1 
   wss = numeric(max_clusters)
  
 
  wss[1] <- wss_cluster(dmatrix)                  	# Note: 2 
  
  d <- dist(dmatrix, method = "euclidean")
  pfit <- hclust(d, method = "ward.D")       	# Note: 3 
  
  for(k in 2:max_clusters) {                     	# Note: 4     
    labels <- cutree(pfit, k = k)
    wss[k] <- wss_total(dmatrix, labels)
  }
  
  wss
}

kmax <- 10
cluster_meas <- data.frame(nclusters = 1:kmax,
                          wss = get_wss(pmatrix, kmax))

breaks <- 1:kmax
ggplot(cluster_meas, aes(x=nclusters, y = wss)) +      	# Note: 5 
  geom_point() + geom_line() +
  scale_x_continuous(breaks = breaks)

# Note 1: 
#   A function to get the total WSS for a  
#   range of clusters from 1 to max 

# Note 2: 
#   wss[1] is just the WSS of all the data 

# Note 3: 
#   Cluster the data. 

# Note 4: 
#   For each k, calculate the cluster labels and the cluster WSS 

# Note 5: 
#   Plot WSS as a function of k 

