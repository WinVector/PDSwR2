# example 2.9 of section 2.3.1 
# (example 2.9 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 
# Title: Loading data from a database 

dpus <- dbReadTable(db, "dpus")                                  	# Note: 1 

dpus <- dpus[, c("AGEP", "COW", "ESR",  "PERNP", 
                 "PINCP","SCHL", "SEX", "WKHP")]   	# Note: 2 
                 
for(ci in c("AGEP", "PERNP", "PINCP", "WKHP")) {   	# Note: 3 
  dpus[[ci]] <- as.numeric(dpus[[ci]])
}

dpus$COW <- strtrim(dpus$COW, 50)                                  	# Note: 4 

str(dpus)                                                       	# Note: 5

# Note 1: 
#   Copy data from the database into R memory. This assumes we are continuing from the previous 
#   example, so the packages we have attached are 
#   still available and the database handle 
#   db is still valid. 

# Note 2: 
#   Select a subset of columns we want to work with. Restricting columns is not required, but 
#   improves legibility of later printing. 

# Note 3: 
#   All of the columns in this copy of PUMS data are stored as character type to preserve features such as leading zeros 
#   from the original data. Here we are converting columns we wish to treat as numeric to the numeric type. Non-numeric values, often missing entries, 
#   get coded with the symbol NA which stands for not available. 

# Note 4: 
#   The PUMS level names are very long (which is one of the reasons these columns are distributed 
#   as integers), so for this dataset that has level 
#   names instead of level codes we are shortening the 
#   employment codes to no more than 50 
#   characters. 

# Note 5: 
#   Look at the first few rows of data in a column orientation. 

