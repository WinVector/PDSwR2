# example 4.13 of section 4.3.3 
# (example 4.13 of section 4.3.3)  : Managing data : Sampling for modeling and validation : Record grouping 
# Title: Ensuring test/train split doesn’t split inside a household 

household_data <- readRDS("hhdata.RDS")            	# Note: 1 
hh <- unique(household_data$household_id)              	# Note: 2 

set.seed(243674)
households <- data.frame(household_id = hh,            	# Note: 3 
                         gp = runif(length(hh)),
                         stringsAsFactors=FALSE)

household_data <- dplyr::left_join(household_data,     	# Note: 4 
                            households,
                            by = "household_id")

# Note 1: 
#   If you have downloaded the PDSwR2 code example directory, then the household dataset is in the 
#   directory PDSwR2/Custdata. Here we assume that this is your working directory. 

# Note 2: 
#   Get the unique household IDs. 

# Note 3: 
#   Generate a unique sampling group ID per 
#   household, and put in a column named gp. 

# Note 4: 
#   Join the household IDs back into the original 
#   data. 

