# informalexample 8.4 of section 8.3.1 
# (informalexample 8.4 of section 8.3.1)  : Advanced Data Preparation : Basic data preparation for classification : The variable score frame 

subset(score_frame, origName == "Var218")

##               varName varMoves         rsq          sig needsSplit
## 389       Var218_catP     TRUE 0.011014574 2.602574e-52       TRUE
## 390       Var218_catB     TRUE 0.012245152 5.924945e-58       TRUE
## 488 Var218_lev_x_cJvF     TRUE 0.005295590 4.902238e-26      FALSE
## 489 Var218_lev_x_UYBR     TRUE 0.001970131 1.218959e-10      FALSE
##     extraModelDegrees origName code
## 389                 2   Var218 catP
## 390                 2   Var218 catB
## 488                 0   Var218  lev
## 489                 0   Var218  lev

