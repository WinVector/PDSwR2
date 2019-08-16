# informalexample 8.24 of section 8.6.4 
# (informalexample 8.24 of section 8.6.4)  : Advanced data preparation : Mastering the vtreat package : Impact coding 

plan4 <- vtreat::designTreatmentsC(d, 
                                   varlist = c("x1", "x2", "x3"),
                                   outcomename = "y",
                                   outcometarget = 20,
                                   codeRestriction = "catB",
                                   verbose = FALSE)
vtreat::prepare(plan4, d)
#     x2_catB  y
# 1 -8.517343 10
# 2  9.903538 20
# 3 -8.517343 30

