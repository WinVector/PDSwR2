# informalexample 5.25 of section 5.2.1 
# (informalexample 5.25 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("zoo")

airquality_corrected <- airquality_with_date
airquality_corrected$OzoneCorrected <-
  na.locf(airquality_corrected$Ozone, na.rm = FALSE)

summary(airquality_corrected)

##      Ozone             date            OzoneCorrected  
##  Min.   :  1.00   Min.   :1973-05-01   Min.   :  1.00  
##  1st Qu.: 18.00   1st Qu.:1973-06-08   1st Qu.: 16.00  
##  Median : 31.50   Median :1973-07-16   Median : 30.00  
##  Mean   : 42.13   Mean   :1973-07-16   Mean   : 39.78  
##  3rd Qu.: 63.25   3rd Qu.:1973-08-23   3rd Qu.: 52.00  
##  Max.   :168.00   Max.   :1973-09-30   Max.   :168.00  
##  NA's   :37

ggplot(airquality_corrected, aes(x = date, y = Ozone)) + 
  geom_point(aes(y=Ozone)) + 
  geom_line(aes(y=OzoneCorrected)) + 
  ggtitle("New York ozone readings, May 1 - Sept 30, 1973",
          subtitle = "(corrected)") +
  xlab("Date")

