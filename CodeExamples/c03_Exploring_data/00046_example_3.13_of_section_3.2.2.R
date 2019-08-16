# example 3.13 of section 3.2.2 
# (example 3.13 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Creating a scatterplot of age and income 

set.seed(245566)                                                                   	# Note: 1 
customer_data_samp <- dplyr::sample_frac(customer_data2, size=0.1, replace=FALSE)   	# Note: 2 
                    
ggplot(customer_data_samp, aes(x=age, y=income)) +                                  	# Note: 3 
       geom_point() +
       ggtitle("Income as a function of age")

# Note 1: 
#   Make the random sampling reproducible by setting the random seed. 

# Note 2: 
#   For legibility, only plot a 10% sample of the data. We will show how to plot all the data in a following section. 

# Note 3: 
#   Create the scatterplot. 

