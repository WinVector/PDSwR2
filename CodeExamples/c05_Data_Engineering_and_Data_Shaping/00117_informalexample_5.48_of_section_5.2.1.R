# informalexample 5.48 of section 5.2.1 
# (informalexample 5.48 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Context 

ggplot(airquality_with_date, aes(x=date, y=Ozone)) + 
  geom_point() + 
  geom_line() + 
  ggtitle("New York ozone readings, May 1 - Sept 30, 1973")

