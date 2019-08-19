# informalexample A.6 of section A.3.1 
# (informalexample A.6 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

data_handle %.>%                                        	# Note: 1 
  extend(.,
         simple_rank = rank(),                            	# Note: 2 
         partitionby = "user_name",                   	# Note: 3 
         orderby = "predicted_offer_affinity",        	# Note: 4 
         reverse = "predicted_offer_affinity") %.>%
  execute(db, .) %.>%                                   	# Note: 5 
  knitr::kable(.)                                         	# Note: 6 

# |user_name |product                        | discount| predicted_offer_affinity| simple_rank|
# |:---------|:------------------------------|--------:|------------------------:|-----------:|
# |Nina      |Pelikan M200 Fountain Pen      |     0.10|                  0.61600|           1|
# |Nina      |Dell XPS Laptop                |     0.05|                  0.31790|           2|
# |Nina      |Pandemic Board Game            |     0.20|                  0.13360|           3|
# |Nina      |Capek's Tales from Two Pockets |     0.05|                  0.06909|           4|
# |John      |Pandemic Board Game            |     0.10|                  0.85960|           1|
# |John      |Pelikan M200 Fountain Pen      |     0.20|                  0.67060|           2|
# |John      |Capek's Tales from Two Pockets |     0.05|                  0.24390|           3|
# |John      |Dell XPS Laptop                |     0.10|                  0.24020|           4|

# Note 1: 
#   Pipe our data into the 
#   execute() method. Notice we are using the “wrapr dot 
#   pipe.” 

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

