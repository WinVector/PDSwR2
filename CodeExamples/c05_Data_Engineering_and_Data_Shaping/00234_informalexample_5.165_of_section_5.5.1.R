# informalexample 5.165 of section 5.5.1 
# (informalexample 5.165 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

library("data.table")

seatbelts_data.table <- as.data.table(seatbelts)

seatbelts_long <- 
  melt.data.table(seatbelts_data.table,
                  id.vars = NULL,
                  measure.vars = c("DriversKilled", "front", "rear"),
                  variable.name = "victim_type", 
                  value.name = "nvictims")

head(seatbelts_long)

