# informalexample 5.54 of section 5.2.1 
# (informalexample 5.54 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 

# plot the data
ggplot(airquality_with_date, aes(x=date, y=Ozone)) + 
  geom_point() + 
  geom_line() + 
  xlab("Date") +
  ggtitle("New York ozone readings, May 1 - Sept 30, 1973")

