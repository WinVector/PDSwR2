# informalexample 5.154 of section 5.5.2 
# (informalexample 5.154 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from multiple rows to multiple columns. 

# pad with zeros
padz <- function(x, n=max(nchar(x))) gsub(" ", "0", formatC(x, width=n)) 

# append "Chick" to the chick ids
ChickWeight$Chick <- paste0("Chick", padz(as.character(ChickWeight$Chick)))

head(ChickWeight)

