# informalexample 8.3 of section 8.3.1 
# (informalexample 8.3 of section 8.3.1)  : Advanced Data Preparation : Basic data preparation for classification : The variable score frame 

score_frame <-  treatment_plan$scoreFrame
subset(score_frame, origName %in% c("Var126", "Var189"))

##          varName varMoves          rsq          sig needsSplit
## 225       Var126     TRUE 0.0030859179 7.876602e-16      FALSE
## 226 Var126_isBAD     TRUE 0.0136377093 2.453679e-64      FALSE
## 341       Var189     TRUE 0.0118934515 2.427376e-56      FALSE
## 342 Var189_isBAD     TRUE 0.0001004614 1.460688e-01      FALSE
##     extraModelDegrees origName  code
## 225                 0   Var126 clean
## 226                 0   Var126 isBAD
## 341                 0   Var189 clean
## 342                 0   Var189 isBAD

