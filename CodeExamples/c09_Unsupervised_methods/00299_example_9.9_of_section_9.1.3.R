# example 9.9 of section 9.1.3 
# (example 9.9 of section 9.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Plot BSS and WSS as a function of k 

total_ss <- function(dmatrix) {                              	# Note: 1 
  grandmean <- colMeans(dmatrix)
  sum(apply(dmatrix, 1, FUN = function(row) { sqr_edist(row, grandmean) }))
}

tss <- total_ss(pmatrix)
cluster_meas$bss <- with(cluster_meas, tss - wss)

library(cdata)                                                 	# Note: 2 
cmlong <- unpivot_to_blocks(cluster_meas,                       	# Note: 3 
                           nameForNewKeyColumn = "measure",
                           nameForNewValueColumn = "value",
                           columnsToTakeFrom = c("wss", "bss"))

ggplot(cmlong, aes(x = nclusters, y = value)) +  
  geom_point() + geom_line() + 
  facet_wrap(~measure, ncol = 1, scale = "free_y") +
  scale_x_continuous(breaks = 1:10)

# Note 1: 
#   Calculate total sum of squares TSS. 

# Note 2: 
#   Load the cdata package to reshape the data. 

# Note 3: 
#   Reshape cluster_meas so that WSS and BSS are in the same column. 

