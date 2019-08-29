# informalexample 5.9 of section 5.1.2 
# (informalexample 5.9 of section 5.1.2)  : Data engineering and data shaping : Data selection : Removing records with incomplete data 

clean_base_1 <- msleep[complete.cases(msleep), , drop = FALSE]

summary(clean_base_1)

##      name              genus               vore          
##  Length:20          Length:20          Length:20         
##  Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character  
##                                                          
##                                                          
##                                                          
##     order           conservation        sleep_total       sleep_rem    
##  Length:20          Length:20          Min.   : 2.900   Min.   :0.600  
##  Class :character   Class :character   1st Qu.: 8.925   1st Qu.:1.300  
##  Mode  :character   Mode  :character   Median :11.300   Median :2.350  
##                                        Mean   :11.225   Mean   :2.275  
##                                        3rd Qu.:13.925   3rd Qu.:3.125  
##                                        Max.   :19.700   Max.   :4.900  
##   sleep_cycle         awake          brainwt            bodywt        
##  Min.   :0.1167   Min.   : 4.30   Min.   :0.00014   Min.   :  0.0050  
##  1st Qu.:0.1792   1st Qu.:10.07   1st Qu.:0.00115   1st Qu.:  0.0945  
##  Median :0.2500   Median :12.70   Median :0.00590   Median :  0.7490  
##  Mean   :0.3458   Mean   :12.78   Mean   :0.07882   Mean   : 72.1177  
##  3rd Qu.:0.4167   3rd Qu.:15.07   3rd Qu.:0.03670   3rd Qu.:  6.1250  
##  Max.   :1.0000   Max.   :21.10   Max.   :0.65500   Max.   :600.0000

nrow(clean_base_1)

## [1] 20

clean_base_2 = na.omit(msleep)
nrow(clean_base_2)

## [1] 20

