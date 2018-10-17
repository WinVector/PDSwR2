# informalexample 2.18 of section 2.3.1 
# (informalexample 2.18 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 

library("dplyr")

dpus %>%
  group_by(., SCHL, SEX)  %>%
  summarize(.,
            count = n(),
            mean_income = mean(PINCP)) %>%
  ungroup(.) %>%
  arrange(., SCHL, SEX)

## # A tibble: 12 x 4
##    SCHL                                           SEX    count mean_income
##    <fct>                                          <fct>  <int>       <dbl>
##  1 No Advanced Degree                             Male   13178      44304.
##  2 No Advanced Degree                             Female  9350      33117.
##  3 Associate's degree                             Male    1796      56972.
##  4 Associate's degree                             Female  2088      42002.
##  5 Bachelor's degree                              Male    4927      76112.
##  6 Bachelor's degree                              Female  4519      57260.
##  7 Doctorate degree                               Male     361     104943.
##  8 Doctorate degree                               Female   269      89337.
##  9 Master's degree                                Male    1792      94663.
## 10 Master's degree                                Female  2225      69105.
## 11 Professional degree beyond a bachelor's degree Male     421     111047.
## 12 Professional degree beyond a bachelor's degree Female   379      92072.

