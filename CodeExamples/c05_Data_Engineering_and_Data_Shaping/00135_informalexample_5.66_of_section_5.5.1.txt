# informalexample 5.66 of section 5.5.1 
# (informalexample 5.66 of section 5.5.1)  : Data engineering and data shaping : Reshaping transforms : Moving data from wide to tall form 

library("tidyr")

seatbelts_long1 <- gather(
  Seatbelts, 
  key = victim_type, 
  value = nvictims, 
  DriversKilled, front, rear)

head(seatbelts_long1)

##         date     law   victim_type nvictims
## 1 1982-01-01 pre-law DriversKilled      115
## 2 1982-02-01 pre-law DriversKilled      104
## 3 1982-03-01 pre-law DriversKilled      131
## 4 1982-04-01 pre-law DriversKilled      108
## 5 1982-05-01 pre-law DriversKilled      103
## 6 1982-06-01 pre-law DriversKilled      115

ggplot(seatbelts_long1, 
       aes(x = date, y = nvictims, color = law, shape = law)) + 
  geom_point() + 
  geom_smooth(se=FALSE) + 
  facet_wrap(~victim_type, ncol=1, scale="free_y") +  
  ggtitle("UK auto fatalities by month and seating position")

