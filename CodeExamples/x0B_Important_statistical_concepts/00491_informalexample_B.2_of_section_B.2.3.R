# informalexample B.2 of section B.2.3 
# (informalexample B.2 of section B.2.3)  : Important statistical concepts : Statistical theory : Power of tests 

library(pwr)
pwr.p.test(h = ES.h(p1 = 0.045, p2 = 0.04), 
           sig.level = 0.05, 
           power = 0.8, 
           alternative = "greater")

#     proportion power calculation for binomial distribution (arcsine transformation) 
#
#              h = 0.02479642
#              n = 10055.18
#      sig.level = 0.05
#          power = 0.8
#    alternative = greater

