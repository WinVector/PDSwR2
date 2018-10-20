# informalexample 5.177 of section 5.5.2 
# (informalexample 5.177 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 

library("cdata")

ChickWeight_wide2 <- pivot_to_rowrecs(
  ChickWeight, 
  columnToTakeKeysFrom = "Time", 
  columnToTakeValuesFrom = "weight",
  rowKeyColumns = "Chick")

