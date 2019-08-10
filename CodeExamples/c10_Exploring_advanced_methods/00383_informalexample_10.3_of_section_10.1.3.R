# informalexample 10.3 of section 10.1.3 
# (informalexample 10.3 of section 10.1.3)  : Exploring advanced methods : Tree-based methods : Using random forests to further improve prediction 

testf <- rbind(testperf_tree, testperf_bag, testperf_rf)
pandoc.table(testf, justify = perf_justify)
## 
## 
## model                   accuracy       f1   dev.norm
## --------------------- ---------- -------- ----------
## tree, test                0.8712   0.8280     0.7531
## bagging, test             0.9105   0.8791     0.5834
## random forest, test       0.9498   0.9341     0.3011

