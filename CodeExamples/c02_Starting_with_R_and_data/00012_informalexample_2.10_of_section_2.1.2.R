# informalexample 2.10 of section 2.1.2 
# (informalexample 2.10 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

library("dplyr")

result <- data %>%
  arrange(., sort_key) %>%
  mutate(., ordered_sum_revenue = cumsum(revenue)) %>%
  mutate(., fraction_revenue_seen = ordered_sum_revenue/sum(revenue))

