# informalexample 5.147 of section 5.5.1 
# (informalexample 5.147 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving values multiple columns to multiple rows 

library("cdata")

seatbelts_long2 <- unpivot_to_blocks(
  seatbelts, 
  nameForNewKeyColumn = "victim_type", 
  nameForNewValueColumn = "nvictims", 
  columnsToTakeFrom = c("DriversKilled", "front", "rear"))

