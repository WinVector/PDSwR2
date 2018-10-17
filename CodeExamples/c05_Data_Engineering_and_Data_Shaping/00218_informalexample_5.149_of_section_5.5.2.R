# informalexample 5.149 of section 5.5.2 
# (informalexample 5.149 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from multiple rows to multiple columns. 

library(datasets)
ChickWeight <- data.frame(ChickWeight) # get rid of attributes
ChickWeight$Diet <- NULL # remove the diet label

summary(ChickWeight)

