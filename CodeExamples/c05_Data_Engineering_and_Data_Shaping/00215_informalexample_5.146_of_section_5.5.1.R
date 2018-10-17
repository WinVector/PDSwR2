# informalexample 5.146 of section 5.5.1 
# (informalexample 5.146 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving values multiple columns to multiple rows 

library("data.table")

seatbelts_data.table <- as.data.table(seatbelts)

seatbelts_long <- 
  melt.data.table(seatbelts_data.table,
                  id.vars = NULL,
                  measure.vars = c("DriversKilled", "front", "rear"),
                  variable.name = "victim_type", 
                  value.name = "nvictims")

ggplot(seatbelts_long, 
       aes(x=date, y=nvictims, color=law)) + 
  geom_point() + 
  geom_smooth(se=FALSE) + 
  facet_wrap(~victim_type, ncol=1, scale="free_y") +  
  ggtitle("UK auto fatalities by month")

