# example 9.18 of section 9.2.3 
# (example 9.18 of section 9.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Reading in the book data 

library(arules)                                                	# Note: 1 
bookbaskets <- read.transactions("bookdata.tsv.gz", 
                                     format = "single",        	# Note: 2 
                                     header = TRUE,           	# Note: 3 
                                     sep = "\t",                    	# Note: 4 
                                     cols = c("userid", "title"),    	# Note: 5 
                                     rm.duplicates = TRUE)       	# Note: 6

# Note 1: 
#   Load the arules package. 

# Note 2: 
#   Specify the file and the file format. 

# Note 3: 
#   Specify that the input file has a header. 

# Note 4: 
#   Specify the column separator (a tab). 

# Note 5: 
#   Specify the column of transaction IDs and of 
#   item IDs, respectively. 

# Note 6: 
#   Tell the function to look for and remove 
#   duplicate entries (for example, multiple entries 
#   for “The Hobbit” by the same user). 

