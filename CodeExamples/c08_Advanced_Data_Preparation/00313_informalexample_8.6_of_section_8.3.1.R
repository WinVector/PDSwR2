# informalexample 8.6 of section 8.3.1 
# (informalexample 8.6 of section 8.3.1)  : Advanced data preparation : Basic data preparation for classification : The variable score frame 

comparison <- data.frame(original218 = dTrain$Var218,
                         impact218 = dTrain_treated$Var218_catB) 

head(comparison)
 ##   original218  impact218
## 1        cJvF -0.2180735
## 2        <NA>  1.5155125
## 3        UYBR  0.1221393
## 4        UYBR  0.1221393
## 5        UYBR  0.1221393
## 6        UYBR  0.1221393

