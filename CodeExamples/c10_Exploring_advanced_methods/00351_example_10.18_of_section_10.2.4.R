# example 10.18 of section 10.2.4 
# (example 10.18 of section 10.2.4)  : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone relationships : Using GAM on actual data 
# Title: Plotting GAM results 

terms <- predict(gammodel, type = "terms")             	# Note: 1 
terms <- cbind(DBWT = train$DBWT, terms)                   	# Note: 2 


tframe <- as.data.frame(scale(terms, scale = FALSE))         	# Note: 3 
colnames(tframe) <- gsub('[()]', '', colnames(tframe))      	# Note: 4 

vars = c("PWGT", "WTGAIN", "MAGER", "UPREVIS")
pframe <- cbind(tframe, train[, vars])                        	# Note: 5 
                    
ggplot(pframe, aes(PWGT)) +                                  	# Note: 6 
  geom_point(aes(y = sPWGT)) + 
  geom_smooth(aes(y = DBWT), se = FALSE)
  
# [...]                                                     	# Note: 7

# Note 1: 
#   Get the matrix of s() 
#   functions. 

# Note 2: 
#   Bind in birth weight (DBWT). 

# Note 3: 
#   Shift all the columns to be zero mean (to make comparisons easy);  
#   convert to data frame 

# Note 4: 
#   Make the column names reference-friendly 
#   (“s(PWGT)” is converted to “sPWGT”, etc.). 

# Note 5: 
#   Bind in the input variables. 

# Note 6: 
#   Compare the spline s(PWGT) to the smoothed curve of DBWT (baby’s weight) 
#   as a function of mother’s weight (PWGT). 

# Note 7: 
#   Repeat for remaining variables (omitted for 
#   brevity). 

