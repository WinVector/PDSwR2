# informalexample A.7 of section A.3.1 
# (informalexample A.7 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

ops <- data_handle %.>%                      	# Note: 1 
  extend(.,                                    	# Note: 2 
         simple_rank = rank(),
         partitionby = "user_name",
         orderby = "predicted_offer_affinity",
         reverse = "predicted_offer_affinity") %.>%
  select_rows(.,                               	# Note: 3 
              simple_rank <= 2) %.>%
   orderby(., c("user_name", "simple_rank"))      	# Note: 4 

result_table <- materialize(db, ops)                      	# Note: 5 

DBI::dbReadTable(db$connection, result_table$table_name) %.>%     	# Note: 6 
  knitr::kable(.)

# |user_name |product                   | discount| predicted_offer_affinity| simple_rank|
# |:---------|:-------------------------|--------:|------------------------:|-----------:|
# |John      |Pandemic Board Game       |     0.10|                   0.8596|           1|
# |John      |Pelikan M200 Fountain Pen |     0.20|                   0.6706|           2|
# |Nina      |Pelikan M200 Fountain Pen |     0.10|                   0.6160|           1|
# |Nina      |Dell XPS Laptop           |     0.05|                   0.3179|           2|

# Note 1: 
#   Define our sequence of operations 

# Note 2: 
#   Mark each row with its simple per-user rank 

# Note 3: 
#   Select the two rows with highest rank for each 
#   user 

# Note 4: 
#   Order the rows by user and product rank 

# Note 5: 
#   Run the result in the database, instantiating a new 
#   result table 

# Note 6: 
#   Copy the result back to R and pretty print it. 

