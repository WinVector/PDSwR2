# informalexample 10.2 of section 10.1.3 
# (informalexample 10.2 of section 10.1.3)  : Exploring advanced methods : Tree-based methods : Using random forests to further improve prediction 

trainf <- rbind(trainperf_tree, trainperf_bag, trainperf_rf)
pandoc.table(trainf, justify = perf_justify)                    
## 
## 
## model                    accuracy       f1   dev.norm
## ---------------------- ---------- -------- ----------
## tree, training             0.8996   0.8691     0.6304
## bagging, training          0.9160   0.8906     0.5106
## random forest, train       0.9884   0.9852     0.1440

