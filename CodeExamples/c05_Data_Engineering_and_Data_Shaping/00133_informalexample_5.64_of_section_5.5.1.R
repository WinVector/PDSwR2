# informalexample 5.64 of section 5.5.1 
# (informalexample 5.64 of section 5.5.1)  : Data engineering and data shaping : Reshaping transforms : Moving data from wide to tall form 

library("data.table")

seatbelts_long2 <- 
  melt.data.table(as.data.table(Seatbelts),
                  id.vars = NULL,
                  measure.vars = c("DriversKilled", "front", "rear"),
                  variable.name = "victim_type", 
                  value.name = "nvictims")

