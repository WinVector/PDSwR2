# example 9.25 of section 9.2.3 
# (example 9.25 of section 9.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Get the five most confident rules 

library(magrittr)                        	# Note: 1  

rules %>% 
  sort(., by = "confidence") %>%           	# Note: 2  
  head(., n = 5) %>%                       	# Note: 3  
  inspect(.)                             	# Note: 4

# Note 1: 
#   Attach magrittr to get pipe notation. 

# Note 2: 
#   Sort rules by confidence. 

# Note 3: 
#   Get the first 5 rules. 

# Note 4: 
#   Call inspect() to pretty-print the rules. 

