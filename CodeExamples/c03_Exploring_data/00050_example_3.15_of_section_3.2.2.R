# example 3.15 of section 3.2.2 
# (example 3.15 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Specifying different styles of bar chart 

ggplot(customer_data, aes(x=marital_status, fill=health_ins)) + 
                        geom_bar()                                             	# Note: 1 
                        
ggplot(customer_data, aes(x=marital_status, fill=health_ins)) + 
                     geom_bar(position = "dodge")                               	# Note: 2 
                      
ShadowPlot(customer_data, "marital_status", "health_ins",
                         title = "Health insurance status by marital status")   	# Note: 3 

ggplot(customer_data, aes(x=marital_status, fill=health_ins)) + 
                     geom_bar(position = "fill")                                	# Note: 4

# Note 1: 
#   Stacked bar chart, the 
#   default 

# Note 2: 
#   Side-by-side bar chart 

# Note 3: 
#   Use the ShadowPlot command from the WVPlots package for the shadow plot 

# Note 4: 
#   Filled bar chart 

