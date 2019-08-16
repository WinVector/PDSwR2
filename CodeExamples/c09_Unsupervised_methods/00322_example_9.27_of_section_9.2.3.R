# example 9.27 of section 9.2.3 
# (example 9.27 of section 9.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Inspecting rules 

brules %>% 
  sort(., by = "confidence") %>%   
  lhs(.) %>%                                     	# Note: 1  
  head(., n = 5) %>%         
  inspect(.)                                               
##   items
## 1 {Divine Secrets of the Ya-Ya Sisterhood: A Novel,
##    Lucky : A Memoir}
## 2 {Lucky : A Memoir,
##    The Notebook}
## 3 {Lucky : A Memoir,
##    Wild Animus}
## 4 {Midwives: A Novel,
##    Wicked: The Life and Times of the Wicked Witch of the West}
## 5 {Lucky : A Memoir,
##    Summer Sisters}

# Note 1: 
#   Get the left hand side of the sorted rules. 

