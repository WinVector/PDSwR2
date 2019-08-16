# informalexample 5.63 of section 5.5.1 
# (informalexample 5.63 of section 5.5.1)  : Data engineering and data shaping : Reshaping transforms : Moving data from wide to tall form 

# let's give an example of the kind of graph we have in mind, using just driver deaths
library("ggplot2")

ggplot(Seatbelts, 
       aes(x = date, y = DriversKilled, color = law, shape = law)) + 
  geom_point() + 
  geom_smooth(se=FALSE) + 
  ggtitle("UK car driver deaths by month")

