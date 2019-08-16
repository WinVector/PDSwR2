# example 10.22 of section 10.3.1 
# (example 10.22 of section 10.3.1)  : Exploring advanced methods : Solving “inseparable” problems using support vector machines : Using a SVM to solve a problem 
# Title: Setting up the spirals data as an example classification problem 

library('kernlab')
data(spirals)                                  		# Note: 1 
sc <- specc(spirals, centers = 2)            		# Note: 2 
s <- data.frame(x = spirals[, 1], y = spirals[, 2],  	# Note: 3 
   class = as.factor(sc)) 	

library('ggplot2') 
ggplot(data = s) +                                  	# Note: 4 
  geom_text(aes(x = x, y = y,
                label = class, color = class)) +
  scale_color_manual(values = c("#d95f02", "#1b9e77")) +
  coord_fixed() + 
  theme_bw() + 
  theme(legend.position  = 'none') +
  ggtitle("example task: separate the 1s from the 2s")

# Note 1: 
#   Load the kernlab kernel and support vector machine package and then ask that the included 
#   example “spirals” be made available. 

# Note 2: 
#   Use kernlab’s spectral clustering routine 
#   to identify the two different spirals in the example dataset. 

# Note 3: 
#   Combine the spiral coordinates and the 
#   spiral label into a data frame. 

# Note 4: 
#   Plot the spirals with class labels. 

