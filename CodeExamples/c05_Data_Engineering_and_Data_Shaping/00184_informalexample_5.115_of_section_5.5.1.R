# informalexample 5.115 of section 5.5.1 
# (informalexample 5.115 of section 5.5.1)  : Data engineering and data shaping : Reshaping transforms : Moving data from wide to tall form 

library("tidyr")

seatbelts_long1 <- gather(
  Seatbelts, 
  key = victim_type, 
  value = nvictims, 
  DriversKilled, front, rear)

head(seatbelts_long1)

