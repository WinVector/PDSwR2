# example 9.2 of section 9.1.2 
# (example 9.2 of section 9.1.2)  : Unsupervised methods : Cluster analysis : Preparing the data 
# Title: Rescaling the dataset 

vars_to_use <- colnames(protein)[-1]              	# Note: 1 
pmatrix <- scale(protein[, vars_to_use])    
pcenter <- attr(pmatrix, "scaled:center")         	# Note: 2 
pscale <- attr(pmatrix, "scaled:scale")

rm_scales <- function(scaled_matrix) {            	# Note: 3 
  attr(scaled_matrix, "scaled:center") <- NULL
  attr(scaled_matrix, "scaled:scale") <- NULL
  scaled_matrix
}

pmatrix <- rm_scales(pmatrix)                     	# Note: 4

# Note 1: 
#   Use all the columns except the first 
#   (Country). 

# Note 2: 
#   Store the scaling attributes. 

# Note 3: 
#   Convenience function to remove scale attributes from a scaled matrix. 

# Note 4: 
#   Null the scale attributes out for safety. 

