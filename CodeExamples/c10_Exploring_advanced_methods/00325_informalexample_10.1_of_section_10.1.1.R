# informalexample 10.1 of section 10.1.1 
# (informalexample 10.1 of section 10.1.1)  : Exploring advanced methods : Tree-based methods : A basic decision tree 

library(pander)                                                 	# Note: 1 
                        
panderOptions("plain.ascii", TRUE)                    	# Note: 2 
panderOptions("keep.trailing.zeros", TRUE)
panderOptions("table.style", "simple")
perf_justify <- "lrrr"
                            
perftable <- rbind(trainperf_tree, testperf_tree)
pandoc.table(perftable, justify = perf_justify)   

## 
## 
## model              accuracy       f1   dev.norm
## ---------------- ---------- -------- ----------
## tree, training       0.8996   0.8691     0.6304
## tree, test           0.8712   0.8280     0.7531

# Note 1: 
#   A package to make nicely formatted ascii tables. 

# Note 2: 
#   Set some options globally so we don't have to keep setting them in every call. 

