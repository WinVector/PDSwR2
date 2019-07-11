# informalexample 5.111 of section 5.5.1 
# (informalexample 5.111 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

library("datasets")
library("xts")

# move the date index into a column
dates <- index(as.xts(time(Seatbelts)))
Seatbelts <- data.frame(Seatbelts) 
Seatbelts$date <- dates
  
# restrict down to 1982 and 1983
Seatbelts <- Seatbelts[ (Seatbelts$date >= as.yearmon("Jan 1982")) &
                          (Seatbelts$date <= as.yearmon("Dec 1983")),
                           , drop = FALSE]
Seatbelts$date <- as.Date(Seatbelts$date)
# mark if the seatbelt law was in effect
Seatbelts$law <- ifelse(Seatbelts$law==1, "new law", "pre-law")
# limit down to the columns we want
Seatbelts <- Seatbelts[, c("date", "DriversKilled", "front", "rear", "law")]

head(Seatbelts)

