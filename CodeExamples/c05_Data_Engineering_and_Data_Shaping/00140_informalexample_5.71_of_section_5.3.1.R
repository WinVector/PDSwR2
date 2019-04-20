# informalexample 5.71 of section 5.3.1 
# (informalexample 5.71 of section 5.3.1)  : Data Engineering and Data Shaping : Aggregating Transforms : Scenario 

packageVersion("dplyr")
## [1] ‘0.7.7’
dplyr::coalesce(
   as.numeric(data$sensor1), 	# Note: 1 
   data$sensor2)

# Note 1: 
#   Work around issue that all-NA columns are often typed as logical, and dplyr will not convert the column type. 

