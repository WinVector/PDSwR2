# informalexample 5.65 of section 5.5.1 
# (informalexample 5.65 of section 5.5.1)  : Data engineering and data shaping : Reshaping transforms : Moving data from wide to tall form 

library("cdata")

seatbelts_long3 <- unpivot_to_blocks(
  Seatbelts, 
  nameForNewKeyColumn = "victim_type", 
  nameForNewValueColumn = "nvictims", 
  columnsToTakeFrom = c("DriversKilled", "front", "rear"))

