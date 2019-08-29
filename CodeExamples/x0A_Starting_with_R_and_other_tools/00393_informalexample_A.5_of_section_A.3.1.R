# informalexample A.5 of section A.3.1 
# (informalexample A.5 of section A.3.1)  : Starting with R and other tools : Using databases with R : Running database queries using a query generator 

library("rquery")

raw_connection <- DBI::dbConnect(RPostgres::Postgres(),
                                 host = 'localhost',
                                 port = 5432,
                                 user = 'johnmount',
                                 password = '')            	# Note: 1 
        
dbopts <- rq_connection_tests(raw_connection)                  	# Note: 2 
db <- rquery_db_info(
  connection = raw_connection,
  is_dbi = TRUE,
  connection_options = dbopts)

data_handle <- rq_copy_to(                                      	# Note: 3 
  db, 
  'offers',
  wrapr::build_frame(
   "user_name"  , "product"                       , "discount", "predicted_offer_affinity" |
     "John"     , "Pandemic Board Game"           , 0.1       , 0.8596                     |
     "Nina"     , "Pandemic Board Game"           , 0.2       , 0.1336                     |
     "John"     , "Dell XPS Laptop"               , 0.1       , 0.2402                     |
     "Nina"     , "Dell XPS Laptop"               , 0.05      , 0.3179                     |
     "John"     , "Capek's Tales from Two Pockets", 0.05      , 0.2439                     |
     "Nina"     , "Capek's Tales from Two Pockets", 0.05      , 0.06909                    |
     "John"     , "Pelikan M200 Fountain Pen"     , 0.2       , 0.6706                     |
     "Nina"     , "Pelikan M200 Fountain Pen"     , 0.1       , 0.616                      ),
  temporary = TRUE, 
  overwrite = TRUE)

# Note 1: 
#   Use DBI to connect to a database. In this case it creates a new in-memory SQLite. 

# Note 2: 
#   Build an rquery wrapper of the connection. 

# Note 3: 
#   Copy some example data into the database. 

