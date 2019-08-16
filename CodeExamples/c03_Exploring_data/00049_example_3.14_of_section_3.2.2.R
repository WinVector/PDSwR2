# example 3.14 of section 3.2.2 
# (example 3.14 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Producing a hexbin plot 

library(WVPlots)                                                             	# Note: 1 
                        
HexBinPlot(customer_data2, "age", "income", "Income as a function of age") +  	# Note: 2 
  geom_smooth(color="black", se=FALSE)                                        	# Note: 3

# Note 1: 
#   Load the WVPlots library 

# Note 2: 
#   Plot the hexbin of income as a function of age 

# Note 3: 
#   Add the smoothing line in black; suppress 
#   standard error ribbon (se=FALSE). 

