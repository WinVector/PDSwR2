# informalexample 5.71 of section 5.5.2 
# (informalexample 5.71 of section 5.5.2)  : Data engineering and data shaping : Reshaping transforms : Moving data from tall to wide form 

library("cdata")

ChickWeight_wide3 <- pivot_to_rowrecs(
  ChickWeight, 
  columnToTakeKeysFrom = "Time", 
  columnToTakeValuesFrom = "weight",
  rowKeyColumns = "Chick")

