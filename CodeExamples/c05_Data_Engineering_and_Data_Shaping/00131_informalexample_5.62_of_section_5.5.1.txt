# informalexample 5.62 of section 5.5.1 
# (informalexample 5.62 of section 5.5.1)  : Data engineering and data shaping : Reshaping transforms : Moving data from wide to tall form 

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

##           date DriversKilled front rear     law
## 157 1982-01-01           115   595  238 pre-law
## 158 1982-02-01           104   673  285 pre-law
## 159 1982-03-01           131   660  324 pre-law
## 160 1982-04-01           108   676  346 pre-law
## 161 1982-05-01           103   755  410 pre-law
## 162 1982-06-01           115   815  411 pre-law

