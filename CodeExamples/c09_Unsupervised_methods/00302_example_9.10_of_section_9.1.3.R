# example 9.10 of section 9.1.3 
# (example 9.10 of section 9.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: The Calinski-Harabasz index 

cluster_meas$B <- with(cluster_meas,  bss / (nclusters - 1))                	# Note: 1 

n = nrow(pmatrix)
cluster_meas$W <- with(cluster_meas,  wss / (n - nclusters))                 	# Note: 2 
                                                        
cluster_meas$ch_crit <- with(cluster_meas, B / W)                           	# Note: 3 
                           
ggplot(cluster_meas, aes(x = nclusters, y = ch_crit)) + 
  geom_point() + geom_line() + 
  scale_x_continuous(breaks = 1:kmax)

# Note 1: 
#   Calculate the between-cluster variance B 

# Note 2: 
#   Calculate the within-cluster variance W 

# Note 3: 
#   Calculate the CH index 

