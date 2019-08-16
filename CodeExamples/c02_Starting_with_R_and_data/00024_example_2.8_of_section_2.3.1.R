# example 2.8 of section 2.3.1 
# (example 2.8 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 
# Title: Loading data into R from a relational database 

library("DBI")
library("dplyr")                                    	# Note: 1 
library("rquery")

dlist <- readRDS("PUMSsample.RDS")                   	# Note: 2 
db <- dbConnect(RSQLite::SQLite(), ":memory:")      	# Note: 3 
dbWriteTable(db, "dpus", as.data.frame(dlist$ss16pus)) 	# Note: 4 
dbWriteTable(db, "dhus", as.data.frame(dlist$ss16hus))
rm(list = "dlist")                                  	# Note: 5 

dbGetQuery(db, "SELECT * FROM dpus LIMIT 5")            	# Note: 6 

dpus <- tbl(db, "dpus")                         	# Note: 7 
dhus <- tbl(db, "dhus")

print(dpus)                                              	# Note: 8 
glimpse(dpus)

View(rsummary(db, "dpus"))                     	# Note: 9

# Note 1: 
#   Attach some packages we wish to use commands 
#   and functions from. 

# Note 2: 
#   Load the data from the compressed RDS disk 
#   format into R memory. Note: you will need to 
#   change the path PUMSsample to where you have saved 
#   the contents of PDSwR2/PUMS. 

# Note 3: 
#   Connect to a new RSQLite in-memory database. 
#   We are going to use RSQLite for our examples. In 
#   practice you would connect to a pre-existing 
#   database such as PostgreSQL or Spark with 
#   pre-existing tables. 

# Note 4: 
#   Copy the data from the in-memory structure 
#   dlist into the database. 

# Note 5: 
#   Remove our local copy of the data, as we are simulating having found the data in the database. 

# Note 6: 
#   Use the SQL query language for a quick look at up to 5 rows of our data. 

# Note 7: 
#   Build dplyr handles that refer to the remote database data. 

# Note 8: 
#   Use dplyr to examine and work with the remote data. 

# Note 9: 
#   Use the rquery package to get a summary of the remote data. 

