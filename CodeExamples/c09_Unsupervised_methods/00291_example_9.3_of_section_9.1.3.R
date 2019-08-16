# example 9.3 of section 9.1.3 
# (example 9.3 of section 9.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Hierarchical clustering 

distmat <- dist(pmatrix, method = "euclidean")       	# Note: 1 
pfit <- hclust(distmat, method = "ward.D")           	# Note: 2 
plot(pfit, labels = protein$Country)                 	# Note: 3

# Note 1: 
#   Create the distance matrix. 

# Note 2: 
#   Do the clustering. 

# Note 3: 
#   Plot the dendrogram. 

