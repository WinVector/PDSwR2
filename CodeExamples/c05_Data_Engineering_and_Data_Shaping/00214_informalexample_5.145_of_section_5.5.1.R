# informalexample 5.145 of section 5.5.1 
# (informalexample 5.145 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving values multiple columns to multiple rows 

# let's give an example of the kind of graph we have in mind, using just driver deaths
library("ggplot2")

ggplot(seatbelts, 
       aes(x=date, y=DriversKilled, color=law)) + 
  geom_point() + 
  geom_smooth(se=FALSE) + 
  ggtitle("UK car driver deaths by month")

