# informalexample 8.2 of section 8.3.1 
# (informalexample 8.2 of section 8.3.1)  : Advanced Data Preparation : Basic data preparation for classification : The variable score frame 

score_frame <-  treatment_plan$scoreFrame                         
head(score_frame)

#      varName varMoves          rsq          sig needsSplit extraModelDegrees origName  code
# 1       Var1     TRUE 2.133307e-07 9.465959e-01      FALSE                 0     Var1 clean
# 2 Var1_isBAD     TRUE 1.475868e-05 5.774386e-01      FALSE                 0     Var1 isBAD
# 3       Var2     TRUE 1.683525e-06 8.507461e-01      FALSE                 0     Var2 clean
# 4 Var2_isBAD     TRUE 7.304694e-04 8.872254e-05      FALSE                 0     Var2 isBAD
# 5       Var3     TRUE 3.941796e-06 7.734039e-01      FALSE                 0     Var3 clean
# 6 Var3_isBAD     TRUE 7.273726e-04 9.183458e-05      FALSE                 0     Var3 isBAD

