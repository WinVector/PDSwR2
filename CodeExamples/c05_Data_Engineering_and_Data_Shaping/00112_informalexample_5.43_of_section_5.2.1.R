# informalexample 5.43 of section 5.2.1 
# (informalexample 5.43 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

ggplot(airquality_corrected, aes(x = date, y = Ozone)) + 
  geom_point(aes(y=Ozone)) + 
  geom_line(aes(y=OzoneCorrected)) + 
  ggtitle("New York ozone readings, May 1 - Sept 30, 1973",
          subtitle = "(corrected)") +
  xlab("Date")

