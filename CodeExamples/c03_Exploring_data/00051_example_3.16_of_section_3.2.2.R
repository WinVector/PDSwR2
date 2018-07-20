# example 3.16 of section 3.2.2 
# (example 3.16 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Plotting a bar chart with and without facets 

cdata <- subset(customer_data, !is.na(housing_type))            	# Note: 1 

ggplot(cdata, aes(x=housing_type, fill=marital_status)) + 	# Note: 2 
  geom_bar(position = "dodge") + 
  scale_fill_brewer(palette = "Dark2") + 
  coord_flip()                                            	# Note: 3 

ggplot(cdata, aes(x=marital_status)) +                    	# Note: 4 
  geom_bar(fill="darkgray") + 
  facet_wrap(~housing_type, scale="free_x") +             	# Note: 5 
  coord_flip()                                            	# Note: 6

# Note 1: 
#   Restrict to the data where housing_type is known. 

# Note 2: 
#   Side-by-side bar chart. 

# Note 3: 
#   Use coord_flip() to rotate the graph so that marital_status is legible. 

# Note 4: 
#   The faceted bar chart. 

# Note 5: 
#   Facet the graph by housing.type. The scales="free_x" argument specifies that each facet has 
#   an independently scaled x-axis; the default is that all facets have 
#   the same scales on both axes. The argument "free_y" would free the 
#   y-axis scaling, and the argument "free" frees both axes. 

# Note 6: 
#   Use coord_flip() to rotate the graph. 

