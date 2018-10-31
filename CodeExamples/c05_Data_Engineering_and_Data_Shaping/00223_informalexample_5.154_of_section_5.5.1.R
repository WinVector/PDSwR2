# informalexample 5.154 of section 5.5.1 
# (informalexample 5.154 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

library("cdata")

seatbelts_long3 <- unpivot_to_blocks(
  seatbelts, 
  nameForNewKeyColumn = "victim_type", 
  nameForNewValueColumn = "nvictims", 
  columnsToTakeFrom = c("DriversKilled", "front", "rear"))

