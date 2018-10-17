# informalexample 5.157 of section 5.5.2 
# (informalexample 5.157 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from multiple rows to multiple columns. 

# calculate the survival rate of chicks by time step
numDead <- vapply(ChickWeight_wide[,-1], 
                 FUN=function(x) sum(is.na(x)),
                 numeric(1))
fracSurvived = 1 - (numDead)/nrow(ChickWeight_wide)

plot(x=names(fracSurvived), y=fracSurvived,
     xlab="time", ylab="fraction of chicks surviving",
     main="Chick survival")

