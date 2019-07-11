# informalexample 5.73 of section 5.4.1 
# (informalexample 5.73 of section 5.4.1)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Combining two or more ordered data.frames quickly 

rbind_base %>%
  group_by(., table) %>%
  mutate(., max_price = max(price)) %>%
  ungroup(.)

