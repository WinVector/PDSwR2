# example 11.17 of section 11.4.2 
# (example 11.17 of section 11.4.2)  : Documentation and deployment : Deploying models : Deploying models by export 
# Title: Exporting the random forest model 

library("randomForest")  	# Note: 1 

lst <- readRDS("../Buzz/thRS500.RDS") 	# Note: 2 
varslist <- lst$varslist
fmodel <- lst$fmodel
buzztest <- lst$buzztest
rm(list = "lst")

extractTrees <- function(rfModel) { 	# Note: 3 
   ei <- function(i) {
      ti <- getTree(rfModel,k=i,labelVar=T)
      ti$nodeid <- 1:dim(ti)[[1]]
      ti$treeid <- i
      ti
   }
   nTrees <- rfModel$ntree
   do.call('rbind',sapply(1:nTrees,ei,simplify=F))
}

write.table(extractTrees(fmodel), 		# Note: 4 
   file='rfmodel.tsv',
   row.names=F,
   sep='\t',
   quote=F)

# Note 1: 
#   Load the random forest library (loading the 
#   workspace doesn’t load the library). 

# Note 2: 
#   Load the saved buzz data (includes the 
#   random forest model). 

# Note 3: 
#   Define a function that joins the tree tables 
#   from the random forest getTree() method into one 
#   large table of trees. 

# Note 4: 
#   Write the table of trees as a tab-separated 
#   values table (easy for other software to 
#   read). 

