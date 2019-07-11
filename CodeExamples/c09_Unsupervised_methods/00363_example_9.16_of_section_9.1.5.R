# example 9.16 of section 9.1.5 
# (example 9.16 of section 9.1.5)  : Unsupervised methods : Cluster analysis : Assigning new points to clusters 
# Title: Unscale the centers 

unscaled = scale(tclusters$centers, center = FALSE, scale = 1 / tscale) 
rm_scales(scale(unscaled, center = -tcenter, scale = FALSE))          

##         [,1]      [,2]       [,3]
## 1  9.8234797 -3.005977  4.7662651
## 2 -4.9749654 -4.862436 -5.0577002
## 3  0.8926698  1.185734  0.8336977

