# informalexample 5.158 of section 5.5.2 
# (informalexample 5.158 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from multiple rows to multiple columns. 

library("cdata")

ChickWeight_wide2 <- pivot_to_rowrecs(
  ChickWeight, 
  columnToTakeKeysFrom = "Time", 
  columnToTakeValuesFrom = "weight",
  rowKeyColumns = "Chick")

