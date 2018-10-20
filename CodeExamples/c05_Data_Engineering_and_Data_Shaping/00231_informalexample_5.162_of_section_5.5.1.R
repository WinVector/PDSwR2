# informalexample 5.162 of section 5.5.1 
# (informalexample 5.162 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 

library("datasets")
library("xts")
# remove attributes
seatbelts <- data.frame(Seatbelts) 
# move the date index into a column
seatbelts$date <- index(as.xts(Seatbelts))
# restrict down to 1982 and 1983
seatbelts <- seatbelts[ (seatbelts$date >= as.yearmon("Jan 1982")) &
                          (seatbelts$date <= as.yearmon("Dec 1983")),
                           , drop = FALSE]
seatbelts$date <- as.Date(seatbelts$date)
# mark if the seatbelt law was in effect
seatbelts$law <- ifelse(seatbelts$law==1, "new law", "pre-law")
# limit down to the columns we want
seatbelts <- seatbelts[, c("date", "DriversKilled", "front", "rear", "law")]

head(seatbelts)

