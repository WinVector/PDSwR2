---
output: github_document
---



00463_example_A.1_of_section_A.2.R



```r
# example A.1 of section A.2 
# (example A.1 of section A.2)  : Starting with R and other tools : Starting with R 
# Title: Trying a few R commands 

1
```

```
## [1] 1
```

```r
## [1] 1
1/2
```

```
## [1] 0.5
```

```r
## [1] 0.5
'Joe'
```

```
## [1] "Joe"
```

```r
## [1] "Joe"
"Joe"
```

```
## [1] "Joe"
```

```r
## [1] "Joe"
"Joe"=='Joe'
```

```
## [1] TRUE
```

```r
## [1] TRUE
c()
```

```
## NULL
```

```r
## NULL
is.null(c())
```

```
## [1] TRUE
```

```r
## [1] TRUE
is.null(5)
```

```
## [1] FALSE
```

```r
## [1] FALSE
c(1)
```

```
## [1] 1
```

```r
## [1] 1
c(1,2)
```

```
## [1] 1 2
```

```r
## [1] 1 2
c("Apple",'Orange')
```

```
## [1] "Apple"  "Orange"
```

```r
## [1] "Apple"  "Orange"
length(c(1,2))
```

```
## [1] 2
```

```r
## [1] 2
vec <- c(1,2)
vec
```

```
## [1] 1 2
```

```r
## [1] 1 2
```




00464_informalexample_A.3_of_section_A.2.1.R



```r
# informalexample A.3 of section A.2.1 
# (informalexample A.3 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 

x <- 2
x < - 3
```

```
## [1] FALSE
```

```r
## [1] FALSE
print(x)
```

```
## [1] 2
```

```r
## [1] 2
```




00465_example_A.2_of_section_A.2.1.R



```r
# example A.2 of section A.2.1 
# (example A.2 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 
# Title: Binding values to function arguments 

divide <- function(numerator,denominator) { numerator/denominator }
divide(1,2)
```

```
## [1] 0.5
```

```r
## [1] 0.5
divide(2,1)
```

```
## [1] 2
```

```r
## [1] 2
divide(denominator=2,numerator=1)
```

```
## [1] 0.5
```

```r
## [1] 0.5
divide(denominator<-2,numerator<-1)  # yields 2, a wrong answer
```

```
## [1] 2
```

```r
## [1] 2
```




00466_example_A.3_of_section_A.2.1.R



```r
# example A.3 of section A.2.1 
# (example A.3 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 
# Title: Demonstrating side effects 

x<-1
good <- function() { x <- 5}
good()
print(x)
```

```
## [1] 1
```

```r
## [1] 1
bad <- function() { x <<- 5}
bad()
print(x)
```

```
## [1] 5
```

```r
## [1] 5
```




00467_example_A.4_of_section_A.2.1.R



```r
# example A.4 of section A.2.1 
# (example A.4 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 
# Title: R truth tables for Boolean operators 

c(T,T,F,F) == c(T,F,T,F)
```

```
## [1]  TRUE FALSE FALSE  TRUE
```

```r
## [1]  TRUE FALSE FALSE  TRUE
c(T,T,F,F) & c(T,F,T,F)
```

```
## [1]  TRUE FALSE FALSE FALSE
```

```r
## [1]  TRUE FALSE FALSE FALSE
c(T,T,F,F) | c(T,F,T,F)
```

```
## [1]  TRUE  TRUE  TRUE FALSE
```

```r
## [1]  TRUE  TRUE  TRUE FALSE
```




00468_informalexample_A.4_of_section_A.2.1.R



```r
# informalexample A.4 of section A.2.1 
# (informalexample A.4 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 

add <- function(a,b) { a + b}
add(1,2)
```

```
## [1] 3
```

```r
## [1] 3
```




00470_example_A.5_of_section_A.2.1.R



```r
# example A.5 of section A.2.1 
# (example A.5 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 
# Title: Call-by-value effect 

a <- c(1, 2)
b <- a

print(b)
```

```
## [1] 1 2
```

```r
a[[1]] <- 5 	# Note: 1 

print(a)
```

```
## [1] 5 2
```

```r
print(b) 	# Note: 2
```

```
## [1] 1 2
```

```r
# Note 1: 
#   "Alter a". Actually this is implemented by building an entirely new vector and reassigning a to refer to this new vector. 
#   The old value remains as-was, and any references continue to see the old unaltered value. 

# Note 2: 
#   Notice b's value is not changed. 
```




00471_informalexample_A.6_of_section_A.2.2.R



```r
# informalexample A.6 of section A.2.2 
# (informalexample A.6 of section A.2.2)  : Starting with R and other tools : Starting with R : Primary R data types 

vec <- c(2, 3)
vec[[2]] <- 5
print(vec)
```

```
## [1] 2 5
```

```r
## [1] 2 5
```




00472_example_A.6_of_section_A.2.2.R



```r
# example A.6 of section A.2.2 
# (example A.6 of section A.2.2)  : Starting with R and other tools : Starting with R : Primary R data types 
# Title: Examples of R indexing operators 

x <- list('a' = 6, b = 'fred')
names(x)
```

```
## [1] "a" "b"
```

```r
## [1] "a" "b"
x$a
```

```
## [1] 6
```

```r
## [1] 6
x$b
```

```
## [1] "fred"
```

```r
## [1] "fred"
x[['a']]
```

```
## [1] 6
```

```r
## $a
## [1] 6

x[c('a', 'a', 'b', 'b')]
```

```
## $a
## [1] 6
## 
## $a
## [1] 6
## 
## $b
## [1] "fred"
## 
## $b
## [1] "fred"
```

```r
## $a
## [1] 6
##
## $a
## [1] 6
##
## $b
## [1] "fred"
##
## $b
## [1] "fred"
```




00473_example_A.7_of_section_A.2.2.R



```r
# example A.7 of section A.2.2 
# (example A.7 of section A.2.2)  : Starting with R and other tools : Starting with R : Primary R data types 
# Title: R’s treatment of unexpected factor levels 

factor('red',levels=c('red','orange'))
```

```
## [1] red
## Levels: red orange
```

```r
## [1] red
## Levels: red orange
factor('apple',levels=c('red','orange'))
```

```
## [1] <NA>
## Levels: red orange
```

```r
## [1] <NA>
## Levels: red orange
```




00474_example_A.8_of_section_A.2.2.R



```r
# example A.8 of section A.2.2 
# (example A.8 of section A.2.2)  : Starting with R and other tools : Starting with R : Primary R data types 
# Title: Confirm lm() encodes new strings correctly. 

d <- data.frame(x=factor(c('a','b','c')),
                   y=c(1,2,3))
m <- lm(y~0+x,data=d) 	# Note: 1 
print(predict(m,
   newdata=data.frame(x='b'))[[1]]) 	# Note: 2 
```

```
## [1] 2
```

```r
# [1] 2
print(predict(m,
   newdata=data.frame(x=factor('b',levels=c('b'))))[[1]]) 	# Note: 3 
```

```
## [1] 2
```

```r
# [1] 2

# Note 1: 
#   Build a data frame and linear model mapping 
#   a,b,c to 1,2,3. 

# Note 2: 
#   Show that model gets correct prediction for 
#   b as a string. 

# Note 3: 
#   Show that model gets correct prediction for 
#   b as a factor, encoded with a different number of 
#   levels. This shows that lm() is correctly treating 
#   factors as strings. 
```




00475_informalexample_A.7_of_section_A.3.1.R



```r
# informalexample A.7 of section A.3.1 
# (informalexample A.7 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

library("rquery")

raw_connection <- DBI::dbConnect(MonetDBLite::MonetDBLite()) 	# Note: 1 
```

```
## Error in loadNamespace(name): there is no package called 'MonetDBLite'
```

```r
dbopts <- rq_connection_tests(raw_connection) 	# Note: 2 
```

```
## Error in rq_connection_tests(raw_connection): object 'raw_connection' not found
```

```r
db <- rquery_db_info(
  connection = raw_connection,
  is_dbi = TRUE,
  connection_options = dbopts)
```

```
## Error in "rquery_db_info" %in% class(connection): object 'raw_connection' not found
```

```r
data_handle <- rq_copy_to( 	# Note: 3 
  db, 
  'offers',
  wrapr::build_frame(
   "user_name"  , "product"                       , "discount", "predicted_offer_affinity" |
     "John"     , "Pandemic Board Game"           , 0.1       , 0.8596                     |
     "Nina"     , "Pandemic Board Game"           , 0.2       , 0.1336                     |
     "John"     , "Dell XPS Laptop"               , 0.1       , 0.2402                     |
     "Nina"     , "Dell XPS Laptop"               , 0.05      , 0.3179                     |
     "John"     , "Čapek's Tales from Two Pockets", 0.05      , 0.2439                     |
     "Nina"     , "Čapek's Tales from Two Pockets", 0.05      , 0.06909                    |
     "John"     , "Pelikan M200 Fountain Pen"     , 0.2       , 0.6706                     |
     "Nina"     , "Pelikan M200 Fountain Pen"     , 0.1       , 0.616                      ),
  temporary = TRUE, 
  overwrite = TRUE)
```

```
## Error in rq_copy_to(db, "offers", wrapr::build_frame("user_name", "product", : object 'db' not found
```

```r
# Note 1: 
#   Use DBI to connect to a database. In this case it creates a new in-memory MonetDBLite. 

# Note 2: 
#   Build an rquery wrapper of the connection. 

# Note 3: 
#   Copy some example data into the database. 
```




00476_informalexample_A.8_of_section_A.3.1.R



```r
# informalexample A.8 of section A.3.1 
# (informalexample A.8 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

data_handle %.>% 	# Note: 1 
  extend(.,
         simple_rank = rank(), 	# Note: 2 
         partitionby = "user_name",  	# Note: 3 
         orderby = "predicted_offer_affinity", 	# Note: 4 
         reverse = "predicted_offer_affinity") %.>%
  execute(db, .) %.>% 	# Note: 5 
  knitr::kable(.) 	# Note: 6 
```

```
## Error in eval(pipe_left_arg, envir = pipe_environment, enclos = pipe_environment): object 'data_handle' not found
```

```r
# |user_name |product                        | discount| predicted_offer_affinity| simple_rank|
# |:---------|:------------------------------|--------:|------------------------:|-----------:|
# |Nina      |Pelikan M200 Fountain Pen      |     0.10|                  0.61600|           1|
# |Nina      |Dell XPS Laptop                |     0.05|                  0.31790|           2|
# |Nina      |Pandemic Board Game            |     0.20|                  0.13360|           3|
# |Nina      |Čapek's Tales from Two Pockets |     0.05|                  0.06909|           4|
# |John      |Pandemic Board Game            |     0.10|                  0.85960|           1|
# |John      |Pelikan M200 Fountain Pen      |     0.20|                  0.67060|           2|
# |John      |Čapek's Tales from Two Pockets |     0.05|                  0.24390|           3|
# |John      |Dell XPS Laptop                |     0.10|                  0.24020|           4|

# Note 1: 
#   Pipe our data into the execute() method. Notice we are using the "wrapr dot pipe." 

# Note 2: 
#   We are going to calculate rank() or the order of the data rows. 

# Note 3: 
#   The ranking will be re-calculated for each user (our window partition). 

# Note 4: 
#   The window ordering that controls the rank is to be from predicted_offer_affinity, reversed (largest first). 

# Note 5: 
#   Translate the operation plan into SQL, send it to the database for execution, and bring the results back to R. 

# Note 6: 
#   Pretty print the results. 
```




00477_informalexample_A.9_of_section_A.3.1.R



```r
# informalexample A.9 of section A.3.1 
# (informalexample A.9 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

ops <- data_handle %.>% 	# Note: 1 
  extend(.,  	# Note: 2 
         simple_rank = rank(),
         partitionby = "user_name",
         orderby = "predicted_offer_affinity",
         reverse = "predicted_offer_affinity") %.>%
  select_rows(.,  	# Note: 3 
              simple_rank <= 2) %.>%
   orderby(., c("user_name", "simple_rank")) 	# Note: 4 
```

```
## Error in eval(pipe_left_arg, envir = pipe_environment, enclos = pipe_environment): object 'data_handle' not found
```

```r
result_table <- materialize(db, ops) 	# Note: 5 
```

```
## Error in "relop" %in% class(optree): object 'ops' not found
```

```r
DBI::dbReadTable(db$connection, result_table$table_name) %.>% 	# Note: 6 
  knitr::kable(.)
```

```
## Error in DBI::dbReadTable(db$connection, result_table$table_name): object 'db' not found
```

```r
# |user_name |product                   | discount| predicted_offer_affinity| simple_rank|
# |:---------|:-------------------------|--------:|------------------------:|-----------:|
# |John      |Pandemic Board Game       |     0.10|                   0.8596|           1|
# |John      |Pelikan M200 Fountain Pen |     0.20|                   0.6706|           2|
# |Nina      |Pelikan M200 Fountain Pen |     0.10|                   0.6160|           1|
# |Nina      |Dell XPS Laptop           |     0.05|                   0.3179|           2|

# Note 1: 
#   define our sequence of operations 

# Note 2: 
#   mark each row with its simple per-user rank 

# Note 3: 
#   select the two rows with highest rank for each user 

# Note 4: 
#   order the rows by user and product rank 

# Note 5: 
#   run the result in the database, instantiating a new result table 

# Note 6: 
#   copy the result back to R and pretty print it. 
```




00478_informalexample_A.10_of_section_A.3.1.R



```r
# informalexample A.10 of section A.3.1 
# (informalexample A.10 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

ops %.>% 
  to_sql(., db) %.>% 
  cat(.)
```

```
## Error in eval(pipe_left_arg, envir = pipe_environment, enclos = pipe_environment): object 'ops' not found
```

```r
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
##    ) tsql_64899813415293475989_0000000000
##  ) tsql_64899813415293475989_0000000001
##  WHERE "simple_rank" <= 2
## ) tsql_64899813415293475989_0000000002 ORDER BY "user_name", "simple_rank"
```


