# informalexample 5.118 of section 5.5.1 
# (informalexample 5.118 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

ggplot(seatbelts_long1, 
       aes(x = date, y = nvictims, color = law, shape = law)) + 
  geom_point() + 
  geom_smooth(se=FALSE) + 
  facet_wrap(~victim_type, ncol=1, scale="free_y") +  
  ggtitle("UK auto fatalities by month and seating position")

