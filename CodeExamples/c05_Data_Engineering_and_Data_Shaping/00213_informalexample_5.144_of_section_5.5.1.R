# informalexample 5.144 of section 5.5.1 
# (informalexample 5.144 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving values multiple columns to multiple rows 

library("datasets")
library("xts")
seatbelts <- as.data.frame(Seatbelts)
seatbelts$date <- index(as.xts(Seatbelts))
seatbelts <- seatbelts[ (seatbelts$date >= as.yearmon("Jan 1982")) &
                          (seatbelts$date <= as.yearmon("Dec 1983")),
                           , drop = FALSE]
seatbelts$date <- as.Date(seatbelts$date)
seatbelts$law <- ifelse(seatbelts$law==1, "new law", "pre-law")
seatbelts <- seatbelts[, c("date", "DriversKilled", "front", "rear", "law")]

