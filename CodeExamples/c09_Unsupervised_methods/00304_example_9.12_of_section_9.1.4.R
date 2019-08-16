# example 9.12 of section 9.1.4 
# (example 9.12 of section 9.1.4)  : Unsupervised methods : Cluster analysis : The k-means algorithm 
# Title: Plotting cluster criteria 

clustering_ch <- kmeansruns(pmatrix, krange = 1:10, criterion = "ch")       	# Note: 1                                                 
clustering_ch$bestk                                                             	# Note: 2 
## [1] 2

clustering_asw <- kmeansruns(pmatrix, krange = 1:10, criterion = "asw")     	# Note: 3 
clustering_asw$bestk
## [1] 3

clustering_asw$crit                                                  	# Note: 4 
## [1] 0.0000000 0.3271084 0.3351694 0.2617868 0.2639450 0.2734815 0.2471165 
## [8] 0.2429985 0.2412922 0.2388293

clustering_ch$crit                                                  	# Note: 5 
##  [1]  0.000000 14.094814 11.417985 10.418801 10.011797  9.964967  9.861682
##  [8]  9.412089  9.166676  9.075569

cluster_meas$ch_crit                                                        	# Note: 6 
##  [1]       NaN 12.215107 10.359587  9.690891 10.011797  9.964967  9.506978
##  [8]  9.092065  8.822406  8.695065

 
summary(clustering_ch)                                              	# Note: 7 

##              Length Class  Mode   
## cluster      25     -none- numeric
## centers      18     -none- numeric
## totss         1     -none- numeric
## withinss      2     -none- numeric
## tot.withinss  1     -none- numeric
## betweenss     1     -none- numeric
## size          2     -none- numeric
## iter          1     -none- numeric
## ifault        1     -none- numeric
## crit         10     -none- numeric
## bestk         1     -none- numeric

# Note 1: 
#   Run kmeansruns() from 1–10 clusters, and the 
#   CH criterion. By default, kmeansruns() uses 100 
#   random starts and 100 maximum iterations per 
#   run. 

# Note 2: 
#   The CH criterion picks two clusters. 

# Note 3: 
#   Run kmeansruns() from 1–10 clusters, and the 
#   average silhouette width criterion. Average 
#   silhouette width picks 3 clusters. 

# Note 4: 
#   Look at the values of the asw criterion as a function of k. 

# Note 5: 
#   Look at the values of the CH criterion as a function of k. 

# Note 6: 
#   Compare these to the CH values for the 
#   hclust() clustering. They’re not quite the same, 
#   because the two algorithms didn’t pick the same 
#   clusters. 

# Note 7: 
#   kmeansruns() also returns the output of 
#   kmeans for k = bestk. 

