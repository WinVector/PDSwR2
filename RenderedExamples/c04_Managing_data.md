---
output: github_document
---



00055_example_4.1_of_section_4.1.1.R



```r
# example 4.1 of section 4.1.1 
# (example 4.1 of section 4.1.1)  : Managing data : Cleaning data : Domain-specific data cleaning 
# Title: Treating the age and income variables 

library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
customer_data = readRDS("../Custdata/custdata.RDS")                      	# Note: 1 

customer_data <- customer_data %>%
   mutate(age = na_if(age, 0),                               	# Note: 2 
          income = ifelse(income < 0, NA, income))           	# Note: 3

# Note 1: 
#   Load the data. 

# Note 2: 
#   The function mutate() from the dplyr package adds columns to a data frame, or modifies existing columns. 
#   The function na_if(), also from dplyr, turns a specific problematic value (in this case, 0) to NA 

# Note 3: 
#   Convert negative incomes to NA 
```




00056_example_4.2_of_section_4.1.1.R



```r
# example 4.2 of section 4.1.1 
# (example 4.2 of section 4.1.1)  : Managing data : Cleaning data : Domain-specific data cleaning 
# Title: Treating the gas_usage variable 

customer_data <- customer_data %>%
  mutate(gas_with_rent = (gas_usage == 1),                    	# Note: 1 
         gas_with_electricity = (gas_usage == 2),
         no_gas_bill = (gas_usage == 3) ) %>%
  mutate(gas_usage = ifelse(gas_usage < 4, NA, gas_usage))    	# Note: 2

# Note 1: 
#   Create the three indicator variables. 

# Note 2: 
#   Convert the special codes in the gas_usage column to NA. 
```




00057_example_4.3_of_section_4.1.2.R



```r
# example 4.3 of section 4.1.2 
# (example 4.3 of section 4.1.2)  : Managing data : Cleaning data : Treating missing values (NAs) 
# Title: Count the missing values in each variable 

count_missing = function(df) {                     	# Note: 1 
  sapply(df, FUN=function(col) sum(is.na(col)) )
}

nacounts <- count_missing(customer_data)
hasNA = which(nacounts > 0)                         	# Note: 2 
nacounts[hasNA]
```

```
##          is_employed               income         housing_type 
##                25774                   45                 1720 
##          recent_move         num_vehicles                  age 
##                 1721                 1720                   77 
##            gas_usage        gas_with_rent gas_with_electricity 
##                35702                 1720                 1720 
##          no_gas_bill 
##                 1720
```

```r
##          is_employed               income         housing_type 
##                25774                   45                 1720 
##          recent_move         num_vehicles                  age 
##                 1721                 1720                   77 
##            gas_usage        gas_with_rent gas_with_electricity 
##                35702                 1720                 1720 
##          no_gas_bill 
##                 1720

# Note 1: 
#   Define a function that counts the number of NAs in each column of a data frame. 

# Note 2: 
#   Apply the function to customer_data, identify which columns have missing values, and print the columns and counts. 
```




00058_informalexample_4.1_of_section_4.1.3.R



```r
# informalexample 4.1 of section 4.1.3 
# (informalexample 4.1 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 

varlist <- setdiff(colnames(customer_data), c("custid", "health_ins"))
```




00059_example_4.4_of_section_4.1.3.R



```r
# example 4.4 of section 4.1.3 
# (example 4.4 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 
# Title: Creating and applying a treatment plan 

library(vtreat)
treatment_plan <- design_missingness_treatment(customer_data, varlist = varlist)
training_prepared <- prepare(treatment_plan, customer_data)
```




00060_example_4.5_of_section_4.1.3.R



```r
# example 4.5 of section 4.1.3 
# (example 4.5 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 
# Title: Comparing the treated data to the original 

colnames(customer_data)   
```

```
##  [1] "custid"               "sex"                  "is_employed"         
##  [4] "income"               "marital_status"       "health_ins"          
##  [7] "housing_type"         "recent_move"          "num_vehicles"        
## [10] "age"                  "state_of_res"         "gas_usage"           
## [13] "gas_with_rent"        "gas_with_electricity" "no_gas_bill"
```

```r
##  [1] "custid"               "sex"                  "is_employed"         
##  [4] "income"               "marital_status"       "health_ins"          
##  [7] "housing_type"         "recent_move"          "num_vehicles"        
## [10] "age"                  "state_of_res"         "gas_usage"           
## [13] "gas_with_rent"        "gas_with_electricity" "no_gas_bill"    
                                        
colnames(training_prepared)                                               	# Note: 1 
```

```
##  [1] "custid"                     "health_ins"                
##  [3] "sex"                        "is_employed"               
##  [5] "is_employed_isBAD"          "income"                    
##  [7] "income_isBAD"               "marital_status"            
##  [9] "housing_type"               "recent_move"               
## [11] "recent_move_isBAD"          "num_vehicles"              
## [13] "num_vehicles_isBAD"         "age"                       
## [15] "age_isBAD"                  "state_of_res"              
## [17] "gas_usage"                  "gas_usage_isBAD"           
## [19] "gas_with_rent"              "gas_with_rent_isBAD"       
## [21] "gas_with_electricity"       "gas_with_electricity_isBAD"
## [23] "no_gas_bill"                "no_gas_bill_isBAD"
```

```r
##  [1] "custid"                     "sex"                       
##  [3] "is_employed"                "income"                    
##  [5] "marital_status"             "health_ins"                
##  [7] "housing_type"               "recent_move"               
##  [9] "num_vehicles"               "age"                       
## [11] "state_of_res"               "gas_usage"                 
## [13] "gas_with_rent"              "gas_with_electricity"      
## [15] "no_gas_bill"                "is_employed_isBAD"         
## [17] "income_isBAD"               "recent_move_isBAD"         
## [19] "num_vehicles_isBAD"         "age_isBAD"                 
## [21] "gas_usage_isBAD"            "gas_with_rent_isBAD"       
## [23] "gas_with_electricity_isBAD" "no_gas_bill_isBAD"                                    
                                        
nacounts <- sapply(training_prepared, FUN=function(col) sum(is.na(col)) )  	# Note: 2 
sum(nacounts)
```

```
## [1] 0
```

```r
## [1] 0

# Note 1: 
#   The prepared data has additional columns that are not in the  
#   original data, most importantly those with the _isBAD designation. 

# Note 2: 
#   The prepared data has no missing values. 
```




00061_example_4.6_of_section_4.1.3.R



```r
# example 4.6 of section 4.1.3 
# (example 4.6 of section 4.1.3)  : Managing data : Cleaning data : The vtreat package for automatically treating missing variables 
# Title: Examining the data treatment 

htmissing <- which(is.na(customer_data$housing_type))                                  	# Note: 1 
                                        
columns_to_look_at <- c("custid", "is_employed", "num_vehicles",
                           "housing_type", "health_ins")
                                        
customer_data[htmissing, columns_to_look_at] %>% head()                                 	# Note: 2 
```

```
##           custid is_employed num_vehicles housing_type health_ins
## 55  000082691_01        TRUE           NA         <NA>      FALSE
## 65  000116191_01        TRUE           NA         <NA>       TRUE
## 162 000269295_01          NA           NA         <NA>      FALSE
## 207 000349708_01          NA           NA         <NA>      FALSE
## 219 000362630_01          NA           NA         <NA>       TRUE
## 294 000443953_01          NA           NA         <NA>       TRUE
```

```r
##           custid is_employed num_vehicles housing_type health_ins
## 55  000082691_01        TRUE           NA         <NA>      FALSE
## 65  000116191_01        TRUE           NA         <NA>       TRUE
## 162 000269295_01          NA           NA         <NA>      FALSE
## 207 000349708_01          NA           NA         <NA>      FALSE
## 219 000362630_01          NA           NA         <NA>       TRUE
## 294 000443953_01          NA           NA         <NA>       TRUE
                                        
columns_to_look_at = c("custid", "is_employed", "is_employed_isBAD",
                       "num_vehicles","num_vehicles_isBAD",
                       "housing_type", "health_ins")
                                        
training_prepared[htmissing, columns_to_look_at] %>%  head()                         	# Note: 3 
```

```
##           custid is_employed is_employed_isBAD num_vehicles
## 55  000082691_01   1.0000000                 0       2.0655
## 65  000116191_01   1.0000000                 0       2.0655
## 162 000269295_01   0.9504928                 1       2.0655
## 207 000349708_01   0.9504928                 1       2.0655
## 219 000362630_01   0.9504928                 1       2.0655
## 294 000443953_01   0.9504928                 1       2.0655
##     num_vehicles_isBAD housing_type health_ins
## 55                   1    _invalid_      FALSE
## 65                   1    _invalid_       TRUE
## 162                  1    _invalid_      FALSE
## 207                  1    _invalid_      FALSE
## 219                  1    _invalid_       TRUE
## 294                  1    _invalid_       TRUE
```

```r
##           custid is_employed is_employed_isBAD num_vehicles
## 55  000082691_01   1.0000000                 0       2.0655
## 65  000116191_01   1.0000000                 0       2.0655
## 162 000269295_01   0.9504928                 1       2.0655
## 207 000349708_01   0.9504928                 1       2.0655
## 219 000362630_01   0.9504928                 1       2.0655
## 294 000443953_01   0.9504928                 1       2.0655
##     num_vehicles_isBAD housing_type health_ins
## 55                   1    _invalid_      FALSE
## 65                   1    _invalid_       TRUE
## 162                  1    _invalid_      FALSE
## 207                  1    _invalid_      FALSE
## 219                  1    _invalid_       TRUE
## 294                  1    _invalid_       TRUE
                                        
customer_data %>%
    summarize(mean_vehicles = mean(num_vehicles, na.rm = TRUE),
    mean_employed = mean(as.numeric(is_employed), na.rm = TRUE))                       	# Note: 4 
```

```
##   mean_vehicles mean_employed
## 1        2.0655     0.9504928
```

```r
##   mean_vehicles mean_employed
## 1        2.0655     0.9504928

# Note 1: 
#   Find the rows where housing_type was missing 

# Note 2: 
#   Look at a few columns from those rows in the original data 

# Note 3: 
#   Look at those rows and columns in the treated data (along with the isBADS) 

# Note 4: 
#   Verify the expected number of 
#   vehicles and the expected unemployment rate in the 
#   dataset 
```




00062_example_4.7_of_section_4.2.R



```r
# example 4.7 of section 4.2 
# (example 4.7 of section 4.2)  : Managing data : Data transformations 
# Title: Normalizing income by state 

library(dplyr)
median_income_table <- readRDS("../Custdata/median_income.RDS")                      	# Note: 1 
head(median_income_table)  
```

```
##   state_of_res median_income
## 1      Alabama         21100
## 2       Alaska         32050
## 3      Arizona         26000
## 4     Arkansas         22900
## 5   California         25000
## 6     Colorado         32000
```

```r
##   state_of_res median_income
## 1      Alabama         21100
## 2       Alaska         32050
## 3      Arizona         26000
## 4     Arkansas         22900
## 5   California         25000
## 6     Colorado         32000

training_prepared <-  training_prepared %>%
  left_join(., median_income_table, by="state_of_res") %>%             	# Note: 2 
  mutate(income_normalized = income/median_income) 

head(training_prepared[, c("income", "median_income", "income_normalized")]) 	# Note: 3 
```

```
##   income median_income income_normalized
## 1  22000         21100         1.0426540
## 2  23200         21100         1.0995261
## 3  21000         21100         0.9952607
## 4  37770         21100         1.7900474
## 5  39000         21100         1.8483412
## 6  11100         21100         0.5260664
```

```r
##   income median_income income_normalized
## 1  22000         21100         1.0426540
## 2  23200         21100         1.0995261
## 3  21000         21100         0.9952607
## 4  37770         21100         1.7900474
## 5  39000         21100         1.8483412
## 6  11100         21100         0.5260664

summary(training_prepared$income_normalized)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.0000  0.4049  1.0000  1.5685  1.9627 46.5556
```

```r
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.0000  0.4049  1.0000  1.5685  1.9627 46.5556

# Note 1: 
#   If you have downloaded the PDSwR2 code example directory, then ../Custdata/median_income.RDS is in the 
#   directory ../../PDSwR2/Custdata. Here we assume that this is your working directory. 

# Note 2: 
#   Join median_income_table into the customer data, so 
#   you can normalize each person’s income by the median 
#   income of their state. 

# Note 3: 
#   Compare the values of income and income_normalized. 
```




00063_example_4.8_of_section_4.2.1.R



```r
# example 4.8 of section 4.2.1 
# (example 4.8 of section 4.2.1)  : Managing data : Data transformations : Normalization 
# Title: Normalizing by mean age 

summary(training_prepared$age)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   21.00   34.00   48.00   49.22   62.00  120.00
```

```r
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   21.00   34.00   48.00   49.22   62.00  120.00

mean_age <- mean(training_prepared$age)
age_normalized <- training_prepared$age/mean_age
summary(age_normalized)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.4267  0.6908  0.9753  1.0000  1.2597  2.4382
```

```r
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.4267  0.6908  0.9753  1.0000  1.2597  2.4382
```




00064_example_4.9_of_section_4.2.2.R



```r
# example 4.9 of section 4.2.2 
# (example 4.9 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Centering and scaling age 

(mean_age <- mean(training_prepared$age))                 	# Note: 1 
```

```
## [1] 49.21647
```

```r
## [1] 49.21647

(sd_age <- sd(training_prepared$age))                     	# Note: 2 
```

```
## [1] 18.0124
```

```r
## [1] 18.0124

print(mean_age + c(-sd_age, sd_age))                      	# Note: 3 
```

```
## [1] 31.20407 67.22886
```

```r
## [1] 31.20407 67.22886

training_prepared$scaled_age <- (training_prepared$age - mean_age) / sd_age 	# Note: 4 

training_prepared %>% 
  filter(abs(age - mean_age) < sd_age) %>%
  select(age, scaled_age) %>%
  head()
```

```
##   age scaled_age
## 1  67  0.9872942
## 2  54  0.2655690
## 3  61  0.6541903
## 4  64  0.8207422
## 5  57  0.4321210
## 6  55  0.3210864
```

```r
##   age scaled_age                                      	# Note: 5 
## 1  67  0.9872942
## 2  54  0.2655690
## 3  61  0.6541903
## 4  64  0.8207422
## 5  57  0.4321210
## 6  55  0.3210864

training_prepared %>% 
  filter(abs(age - mean_age) > sd_age) %>%
  select(age, scaled_age) %>%
  head()
```

```
##   age scaled_age
## 1  24  -1.399951
## 2  82   1.820054
## 3  31  -1.011329
## 4  93   2.430745
## 5  76   1.486950
## 6  26  -1.288916
```

```r
##   age scaled_age                                       	# Note: 6 
## 1  24  -1.399951
## 2  82   1.820054
## 3  31  -1.011329
## 4  93   2.430745
## 5  76   1.486950
## 6  26  -1.288916

# Note 1: 
#   Take the mean. 

# Note 2: 
#   Take the standard deviation. 

# Note 3: 
#   The “typical” age range for this population is 
#   from about 31 to 67. 

# Note 4: 
#   Use the mean value as the origin (or 
#   reference point) and rescale the distance from the 
#   mean by the standard deviation. 

# Note 5: 
#   Customers in the typical age range have a scaled_age with magnitude less than 1. 

# Note 6: 
#   Customers outside the typical age range have a scaled_age with magnitude greater than 1. 
```




00065_example_4.10_of_section_4.2.2.R



```r
# example 4.10 of section 4.2.2 
# (example 4.10 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Centering and scaling multiple numeric variables 

dataf <- training_prepared[, c("age", "income", "num_vehicles", "gas_usage")]
summary(dataf)
```

```
##       age             income         num_vehicles     gas_usage     
##  Min.   : 21.00   Min.   :      0   Min.   :0.000   Min.   :  4.00  
##  1st Qu.: 34.00   1st Qu.:  10700   1st Qu.:1.000   1st Qu.: 50.00  
##  Median : 48.00   Median :  26300   Median :2.000   Median : 76.01  
##  Mean   : 49.22   Mean   :  41792   Mean   :2.066   Mean   : 76.01  
##  3rd Qu.: 62.00   3rd Qu.:  51700   3rd Qu.:3.000   3rd Qu.: 76.01  
##  Max.   :120.00   Max.   :1257000   Max.   :6.000   Max.   :570.00
```

```r
##       age             income         num_vehicles     gas_usage     
##  Min.   : 21.00   Min.   :      0   Min.   :0.000   Min.   :  4.00  
##  1st Qu.: 34.00   1st Qu.:  10700   1st Qu.:1.000   1st Qu.: 50.00  
##  Median : 48.00   Median :  26300   Median :2.000   Median : 76.01  
##  Mean   : 49.22   Mean   :  41792   Mean   :2.066   Mean   : 76.01  
##  3rd Qu.: 62.00   3rd Qu.:  51700   3rd Qu.:3.000   3rd Qu.: 76.01  
##  Max.   :120.00   Max.   :1257000   Max.   :6.000   Max.   :570.00

dataf_scaled <- scale(dataf, center=TRUE, scale=TRUE)               	# Note: 1 
                                        
summary(dataf_scaled)
```

```
##       age               income         num_vehicles        gas_usage      
##  Min.   :-1.56650   Min.   :-0.7193   Min.   :-1.78631   Min.   :-1.4198  
##  1st Qu.:-0.84478   1st Qu.:-0.5351   1st Qu.:-0.92148   1st Qu.:-0.5128  
##  Median :-0.06753   Median :-0.2666   Median :-0.05665   Median : 0.0000  
##  Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000  
##  3rd Qu.: 0.70971   3rd Qu.: 0.1705   3rd Qu.: 0.80819   3rd Qu.: 0.0000  
##  Max.   : 3.92971   Max.   :20.9149   Max.   : 3.40268   Max.   : 9.7400
```

```r
##       age               income         num_vehicles        gas_usage      
##  Min.   :-1.56650   Min.   :-0.7193   Min.   :-1.78631   Min.   :-1.4198  
##  1st Qu.:-0.84478   1st Qu.:-0.5351   1st Qu.:-0.92148   1st Qu.:-0.5128  
##  Median :-0.06753   Median :-0.2666   Median :-0.05665   Median : 0.0000  
##  Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000  
##  3rd Qu.: 0.70971   3rd Qu.: 0.1705   3rd Qu.: 0.80819   3rd Qu.: 0.0000  
##  Max.   : 3.92971   Max.   :20.9149   Max.   : 3.40268   Max.   : 9.7400

(means <- attr(dataf_scaled, 'scaled:center'))                  	# Note: 2 
```

```
##          age       income num_vehicles    gas_usage 
##     49.21647  41792.51062      2.06550     76.00745
```

```r
##          age       income num_vehicles    gas_usage 
##     49.21647  41792.51062      2.06550     76.00745

(sds <- attr(dataf_scaled, 'scaled:scale'))
```

```
##          age       income num_vehicles    gas_usage 
##    18.012397 58102.481410     1.156294    50.717778
```

```r
##          age       income num_vehicles    gas_usage 
##    18.012397 58102.481410     1.156294    50.717778

# Note 1: 
#   Center the data by its mean and scale it by its standard deviation 

# Note 2: 
#   Get the means and standard deviations of the original data, which are stored as 
#   attributes of dataf_scaled 
```




00066_example_4.11_of_section_4.2.2.R



```r
# example 4.11 of section 4.2.2 
# (example 4.11 of section 4.2.2)  : Managing data : Data transformations : Centering and scaling 
# Title: Treating new data before feeding it to a model 

newdata <- customer_data                                       	# Note: 1 
                                                
library(vtreat)                                                	# Note: 2 
newdata_treated <- prepare(treatment_plan, newdata)
                                                
new_dataf <- newdata_treated[, c("age", "income", "num_vehicles", "gas_usage")]       	# Note: 3  
dataf_scaled <- scale(new_dataf, center=means, scale=sds)

# Note 1: 
#   Simulate having a new customer dataset. 

# Note 2: 
#   Clean it using the treatment plan from the original dataset. 

# Note 3: 
#   Scale age, income, num_vehicles, and gas_usage using the means 
#   and standard deviations from the original data set. 
```




00067_informalexample_4.2_of_section_4.2.3.R



```r
# informalexample 4.2 of section 4.2.3 
# (informalexample 4.2 of section 4.2.3)  : Managing data : Data transformations : Log transformations for skewed and wide distributions 

signedlog10 <- function(x) {
     ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x)))
}
```




00068_example_4.12_of_section_4.3.2.R



```r
# example 4.12 of section 4.3.2 
# (example 4.12 of section 4.3.2)  : Managing data : Sampling for modeling and validation : Creating a sample group column 
# Title: Splitting into test and training using a random group mark 

set.seed(25643)                                                     	# Note: 1 
customer_data$gp <- runif(nrow(customer_data))                        	# Note: 2 
customer_test <- subset(customer_data, gp <= 0.1)                  	# Note: 3 
customer_train <- subset(customer_data, gp > 0.1)                  	# Note: 4 

dim(customer_test)
```

```
## [1] 7463   16
```

```r
## [1] 7463   16

dim(customer_train)
```

```
## [1] 65799    16
```

```r
## [1] 65799    16

# Note 1: 
#   Set the random seed so this example is reproducible. 

# Note 2: 
#   Create the grouping column. 

# Note 3: 
#   Here we generate a test set of about 10% of 
#   the data. 

# Note 4: 
#   Here we generate a training set using the 
#   remaining data. 
```




00069_example_4.13_of_section_4.3.3.R



```r
# example 4.13 of section 4.3.3 
# (example 4.13 of section 4.3.3)  : Managing data : Sampling for modeling and validation : Record grouping 
# Title: Ensuring test/train split doesn’t split inside a household 

household_data <- readRDS("../Custdata/hhdata.RDS")            	# Note: 1 
hh <- unique(household_data$household_id)              	# Note: 2 

set.seed(243674)
households <- data.frame(household_id = hh,            	# Note: 3 
                         gp = runif(length(hh)),
                         stringsAsFactors=FALSE)

household_data <- dplyr::left_join(household_data,     	# Note: 4 
                            households,
                            by = "household_id")

# Note 1: 
#   If you have downloaded the PDSwR2 code example directory, then the household dataset is in the 
#   directory ../../PDSwR2/Custdata. Here we assume that this is your working directory. 

# Note 2: 
#   Get the unique household IDs. 

# Note 3: 
#   Generate a unique sampling group ID per 
#   household, and put in a column named gp. 

# Note 4: 
#   Join the household IDs back into the original 
#   data. 
```


