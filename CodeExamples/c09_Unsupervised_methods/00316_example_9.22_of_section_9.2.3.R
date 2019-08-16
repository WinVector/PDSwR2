# example 9.22 of section 9.2.3 
# (example 9.22 of section 9.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Finding the 10 most frequent books 

orderedBooks <- sort(bookCount, decreasing = TRUE)   	# Note: 1 
knitr::kable(orderedBooks[1:10])                   	# Note: 2 

# |                                                |    x|
# |:-----------------------------------------------|----:|
# |Wild Animus                                     | 2502|
# |The Lovely Bones: A Novel                       | 1295|
# |She's Come Undone                               |  934|
# |The Da Vinci Code                               |  905|
# |Harry Potter and the Sorcerer's Stone           |  832|
# |The Nanny Diaries: A Novel                      |  821|
# |A Painted House                                 |  819|
# |Bridget Jones's Diary                           |  772|
# |The Secret Life of Bees                         |  762|
# |Divine Secrets of the Ya-Ya Sisterhood: A Novel |  737|

orderedBooks[1] / nrow(bookbaskets)               	# Note: 3 

## Wild Animus
##  0.02716376

# Note 1: 
#   Sort the counts in decreasing order. 

# Note 2: 
#   Display the top 10 books in a nice format 

# Note 3: 
#   The most popular book in the dataset 
#   occurred in fewer than 3% of the baskets. 

