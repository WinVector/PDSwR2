# example 8.1 of section 8.2.1 
# (example 8.1 of section 8.2.1)  : Advanced data preparation : KDD and KDD Cup 2009 : Getting started with KDD Cup 2009 data 
# Title: Preparing the KDD data for analysis 

d <- read.table('orange_small_train.data.gz',             	# Note: 1 
   header = TRUE,
   sep = '\t',
   na.strings = c('NA', ''))                                  	# Note: 2 
                                                
churn <- read.table('orange_small_train_churn.labels.txt',
   header = FALSE, sep = '\t')                             	# Note: 3 
d$churn <- churn$V1                                     	# Note: 4 

set.seed(729375)                                         	# Note: 5 
rgroup <- base::sample(c('train', 'calibrate', 'test'), 	# Note: 6 
   nrow(d), 
   prob = c(0.8, 0.1, 0.1),
   replace = TRUE)
dTrain <- d[rgroup == 'train', , drop = FALSE]
dCal <- d[rgroup == 'calibrate', , drop = FALSE]
dTrainAll <- d[rgroup %in% c('train', 'calibrate'), , drop = FALSE]
dTest <- d[rgroup == 'test', , drop = FALSE]
                                                
outcome <- 'churn' 
vars <- setdiff(colnames(dTrainAll), outcome)

rm(list=c('d', 'churn', 'rgroup'))                         	# Note: 7

# Note 1: 
#   Read the file of independent variables. All 
#   data from 
#   https://github.com/WinVector/PDSwR2/tree/master/KDD2009. 

# Note 2: 
#   Treat both NA and the empty string as missing 
#   data. 

# Note 3: 
#   Read known churn outcomes. 

# Note 4: 
#   Add churn as a new column. 

# Note 5: 
#   By setting the seed to the pseudo-random 
#   number generator, we make our work reproducible: 
#   someone redoing it will see the exact same 
#   results. 

# Note 6: 
#   Split data into train, calibration, and test sets. 
#   Explicitly specify the base::sample() function to avoid 
#   name collision with dplyr::sample(), if the dplyr package is loaded. 

# Note 7: 
#   Remove unneeded objects from workspace. 

