# informalexample 5.115 of section 5.5.1 
# (informalexample 5.115 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

library("cdata")

seatbelts_long3 <- unpivot_to_blocks(
  Seatbelts, 
  nameForNewKeyColumn = "victim_type", 
  nameForNewValueColumn = "nvictims", 
  columnsToTakeFrom = c("DriversKilled", "front", "rear"))

