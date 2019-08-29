# informalexample A.8 of section A.3.1 
# (informalexample A.8 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

ops %.>% 
  to_sql(., db) %.>% 
  cat(.)

## SELECT * FROM (
##  SELECT * FROM (
##   SELECT
##    "user_name",
##    "product",
##    "discount",
##    "predicted_offer_affinity",
##    rank ( ) OVER (  PARTITION BY "user_name" ORDER BY "predicted_offer_affinity" DESC ) AS "simple_rank"
##   FROM (
##    SELECT
##     "user_name",
##     "product",
##     "discount",
##     "predicted_offer_affinity"
##    FROM
##     "offers"
##    ) tsql_17135820721167795865_0000000000
##  ) tsql_17135820721167795865_0000000001
##  WHERE "simple_rank" <= 2
## ) tsql_17135820721167795865_0000000002 ORDER BY "user_name", "simple_rank"

