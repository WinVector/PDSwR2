# informalexample 10.4 of section 10.1.3 
# (informalexample 10.4 of section 10.1.3)  : Exploring advanced methods : Tree-based methods : Using random forests to further improve prediction 

difff <- data.frame(model = c("tree", "bagging", "random forest"),
                  accuracy = trainf$accuracy - testf$accuracy,
                  f1 = trainf$f1 - testf$f1,
                  dev.norm = trainf$dev.norm - testf$dev.norm)

pandoc.table(difff, justify=perf_justify)

## 
## 
## model             accuracy        f1   dev.norm
## --------------- ---------- --------- ----------
## tree              0.028411   0.04111   -0.12275
## bagging           0.005523   0.01158   -0.07284
## random forest     0.038633   0.05110   -0.15711

