# informalexample 5.169 of section 5.5.1 
# (informalexample 5.169 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

library("tidyr")

seatbelts_long3 <- gather(
  seatbelts, 
  key = victim_type, 
  value = nvictims, 
  DriversKilled, front, rear)

