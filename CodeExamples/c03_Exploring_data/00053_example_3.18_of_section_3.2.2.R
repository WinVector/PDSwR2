# example 3.18 of section 3.2.2 
# (example 3.18 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 
# Title: Comparing population densities across categories with ShadowHist() 

ShadowHist(customer_data3, "age", "marital_status", 
"Age distribution for never married vs. widowed populations",
           binwidth=5)                                    	# Note: 1

# Note 1: 
#   Set the bin widths of the histogram to 5. 

