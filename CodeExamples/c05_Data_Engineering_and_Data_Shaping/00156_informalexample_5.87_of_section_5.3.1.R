# informalexample 5.87 of section 5.3.1 
# (informalexample 5.87 of section 5.3.1)  : Data Engineering and Data Shaping : Aggregating Transforms : Scenario 

data <- wrapr::build_frame(
   "time", "sensor1", "sensor2", "sensor3" |
   1L    , NA       , -0.07528 , -0.07528  |
   2L    , NA       , -0.164   , NA        |
   3L    , NA       , -0.8119  , -0.8119   |
   4L    , NA       , NA       , -0.461    |
   5L    , NA       , NA       , NA        )

