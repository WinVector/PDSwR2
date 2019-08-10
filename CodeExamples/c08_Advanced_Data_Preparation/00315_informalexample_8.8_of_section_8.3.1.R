# informalexample 8.8 of section 8.3.1 
# (informalexample 8.8 of section 8.3.1)  : Advanced data preparation : Basic data preparation for classification : The variable score frame 

score_frame[score_frame$origName == "Var200", , drop = FALSE]

#           varName varMoves         rsq          sig needsSplit extraModelDegrees origName code
# 361   Var200_catP     TRUE 0.005729835 4.902546e-28       TRUE             13323   Var200 catP
# 362   Var200_catB     TRUE 0.001476298 2.516703e-08       TRUE             13323   Var200 catB
# 428 Var200_lev_NA     TRUE 0.005729838 4.902365e-28      FALSE                 0   Var200  lev

