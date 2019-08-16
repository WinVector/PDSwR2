# example 9.5 of section 9.1.3 
# (example 9.5 of section 9.1.3)  : Unsupervised methods : Cluster analysis : Hierarchical clustering with hclust 
# Title: Projecting the clusters on the first two principal components 

library(ggplot2)
princ <- prcomp(pmatrix)                                       	# Note: 1 
nComp <- 2
project <- predict(princ, pmatrix)[, 1:nComp]                  	# Note: 2 
project_plus <- cbind(as.data.frame(project),                  	# Note: 3 
                     cluster = as.factor(groups),
                     country = protein$Country)

ggplot(project_plus, aes(x = PC1, y = PC2)) +                  	# Note: 4 
  geom_point(data = as.data.frame(project), color = "darkgrey") + 
  geom_point() +
  geom_text(aes(label = country),
            hjust = 0, vjust = 1) + 
  facet_wrap(~ cluster, ncol = 3, labeller = label_both)

# Note 1: 
#   Calculate the principal components of the 
#   data. 

# Note 2: 
#   The predict() function will rotate the data 
#   into the coordinates described by the principal 
#   components. The first two columns of the rotated data 
#   are the projection of the data on the first two principal  
#   components. 

# Note 3: 
#   Create a data frame with the transformed 
#   data, along with the cluster label and country 
#   label of each point. 

# Note 4: 
#   Plot it. Put each cluster in a separate facet for legibility. 

