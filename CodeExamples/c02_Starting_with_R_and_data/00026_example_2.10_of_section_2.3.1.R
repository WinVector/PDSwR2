# example 2.10 of section 2.3.1 
# (example 2.10 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 
# Title: Re-mapping values and selecting rows from data 

target_emp_levs <- c(                                          	# Note: 1 
  "Employee of a private for-profit company or busine",
  "Employee of a private not-for-profit, tax-exempt, ",
  "Federal government employee",                    
  "Local government employee (city, county, etc.)",   
  "Self-employed in own incorporated business, profes",
  "Self-employed in own not incorporated business, pr",
  "State government employee")


complete <- complete.cases(dpus)                              	# Note: 2 

stdworker <- with(dpus,                                        	# Note: 3 
                  (PINCP>1000) & 
                    (ESR=="Civilian employed, at work") & 
                    (PINCP<=250000) & 
                    (PERNP>1000) & (PERNP<=250000) & 
                    (WKHP>=30) & 
                    (AGEP>=18) & (AGEP<=65) & 
                    (COW %in% target_emp_levs))
                    
dpus <- dpus[complete & stdworker, , drop = FALSE]              	# Note: 4 

no_advanced_degree <- is.na(dpus$SCHL) |                     	# Note: 5 
  (!(dpus$SCHL %in% c("Associate's degree",
                      "Bachelor's degree",
                      "Doctorate degree",
                      "Master's degree",
                      "Professional degree beyond a bachelor's degree")))
dpus$SCHL[no_advanced_degree] <- "No Advanced Degree"

dpus$SCHL <- relevel(factor(dpus$SCHL),                     	# Note: 6 
                     "No Advanced Degree")                
dpus$COW <- relevel(factor(dpus$COW), 
                    target_emp_levs[[1]])
dpus$ESR <- relevel(factor(dpus$ESR), 
                    "Civilian employed, at work")
dpus$SEX <- relevel(factor(dpus$SEX), 
                    "Male")
                    
saveRDS(dpus, "dpus_std_employee.RDS")                           	# Note: 7 
                    
summary(dpus)                                                  	# Note: 8

# Note 1: 
#   Define a vector of employment definitions we consider “standard.” 

# Note 2: 
#   Build a new logical vector indicating which rows have valid values in all of our columns of 
#   interest. In real applications, dealing with 
#   missing values is important and cannot always be 
#   handled by skipping incomplete rows. We will 
#   return to the issue of properly dealing with 
#   missing values when we discuss managing 
#   data. 

# Note 3: 
#   Build a new logical vector indicating which workers we consider typical full-time employees. 
#   Each of these column names are the ones we 
#   discussed earlier. The results of any analysis 
#   will be heavily influenced by this definition, so 
#   in a real task we would spend a lot of time 
#   researching the choices in this step. It literally 
#   controls who and what we are studying. Notice to 
#   keep things simple and homogeneous we restricted 
#   this study to civilians, which would be an 
#   unacceptable limitation in a complete work. 

# Note 4: 
#   Restrict only to rows or examples that meet or definition of typical worker. 

# Note 5: 
#   Re-code education, merging the less-than-bachelor’s-degree levels to the single level “No 
#   Advanced Degree”. 

# Note 6: 
#   Convert our string-valued columns to factors, picking the reference level with the re-level() 
#   function. 

# Note 7: 
#   Save this data to a file so we can use it in later examples. This file is also already 
#   available at the path 
#   PDSwR2/PUMS/dpus_std_employee.RDS 

# Note 8: 
#   Take a look at our data. One of the advantages of factors is summary() builds up useful counts 
#   for them. However, it was best to delay having 
#   string codes as factors until after we finished 
#   with re-mapping level codes. 

