# informalexample 2.16 of section 2.3.1 
# (informalexample 2.16 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 

d <- cbind(                                                        	# Note: 1 
  data.frame(SCHL = as.character(dpus$SCHL),                       	# Note: 2 
             stringsAsFactors = FALSE),
  model.matrix(~SCHL, dpus)                                        	# Note: 3 
)
d$'(Intercept)' <- NULL                                        	# Note: 4 
str(d)                                                             	# Note: 5 

## 'data.frame':    41305 obs. of  6 variables:
##  $ SCHL                                              : chr  "Associate's degree" "Associate's degree" "Associate's degree" "No Advanced Degree" ...
##  $ SCHLAssociate's degree                            : num  1 1 1 0 0 1 0 0 0 0 ...
##  $ SCHLBachelor's degree                             : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ SCHLDoctorate degree                              : num  0 0 0 0 1 0 0 0 0 0 ...
##  $ SCHLMaster's degree                               : num  0 0 0 0 0 0 0 1 0 0 ...
##  $ SCHLProfessional degree beyond a bachelor's degree: num  0 0 0 0 0 0 0 0 0 0 ...

# Note 1: 
#   The cbind operator combines two data frames by columns, or each row is built by matching columns from rows in each data frame. 

# Note 2: 
#   Build a data.frame with the SCHL column re-coded as character strings instead of as a factor. 

# Note 3: 
#   Build a matrix with dummy variables generated from the SCHL factor column. 

# Note 4: 
#   Remove a column named "(Intercept)" from the data.frame, as it is a side-effect of model.matrix we are not interested in at this time. 

# Note 5: 
#   Show the structure that presents the original SCHL string form along with the indicators. 
#   str() presents the first few rows in transpose format (flipped so rows are now up and down and columns are across). 

