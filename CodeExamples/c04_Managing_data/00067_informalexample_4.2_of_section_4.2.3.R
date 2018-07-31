# informalexample 4.2 of section 4.2.3 
# (informalexample 4.2 of section 4.2.3)  : Managing data : Data transformations : Log transformations for skewed and wide distributions 

signedlog10 <- function(x) {
     ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x)))
}

