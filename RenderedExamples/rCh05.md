---
title: "rCh05"
author: "Win-Vector LLC"
output: github_document
---


```r
source('runDir.R')
source("config.R")
knitr::opts_chunk$set(fig.path = "figures/ch05/")
```



```r
runDir(paste0(code_dir, 'c05_Data_Engineering_and_Data_Shaping'),
       public_dir,
       last = 158)
```

```
[1] "############################### start  70 Sat Oct 20 09:33:04 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00070_informalexample_5.1_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.1 of section 5.1.1 
> # (informalexample 5.1 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> library("datasets")

> library("ggplot2")

> summary(iris)
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
       Species  
 setosa    :50  
 versicolor:50  
 virginica :50  
                
                
                
[1] "############################### end  70 Sat Oct 20 09:33:05 2018"
[1] "############################### start  72 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00072_informalexample_5.3_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.3 of section 5.1.1 
> # (informalexample 5.3 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
[1] "############################### end  72 Sat Oct 20 09:33:05 2018"
[1] "############################### start  74 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00074_informalexample_5.5_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.5 of section 5.1.1 
> # (informalexample 5.5 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> ggplot(iris, 
        aes(x = Petal.Length, y = Petal.Width, 
            shape = Species, color = Species)) + 
   geom_point(size =2 ) + 
   ggtitle("Petal dimensions by iris species: all measurements")
```

```
[1] "############################### end  74 Sat Oct 20 09:33:05 2018"
[1] "############################### start  75 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00075_informalexample_5.6_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.6 of section 5.1.1 
> # (informalexample 5.6 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> columns_we_want <- c("Petal.Length", "Petal.Width", "Species")

> rows_we_want <- iris$Petal.Length > 2

> # before
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
[1] "############################### end  75 Sat Oct 20 09:33:05 2018"
[1] "############################### start  77 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00077_informalexample_5.8_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.8 of section 5.1.1 
> # (informalexample 5.8 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> iris_base <- iris[rows_we_want, columns_we_want, drop = FALSE]

> # after
> head(iris_base)
   Petal.Length Petal.Width    Species
51          4.7         1.4 versicolor
52          4.5         1.5 versicolor
53          4.9         1.5 versicolor
54          4.0         1.3 versicolor
55          4.6         1.5 versicolor
56          4.5         1.3 versicolor
[1] "############################### end  77 Sat Oct 20 09:33:05 2018"
[1] "############################### start  79 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00079_informalexample_5.10_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.10 of section 5.1.1 
> # (informalexample 5.10 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> library("data.table")

> # convert to data.table class to 
> # get data.table semantics
> iris_data.table <- as.data.table(iris)

> columns_we_want <- c("Petal.Length", "Petal.Width", "Species")

> rows_we_want <- iris_data.table$Petal.Length > 2

> iris_data.table <- iris_data.table[rows_we_want , ..columns_we_want]

> head(iris_data.table)
   Petal.Length Petal.Width    Species
1:          4.7         1.4 versicolor
2:          4.5         1.5 versicolor
3:          4.9         1.5 versicolor
4:          4.0         1.3 versicolor
5:          4.6         1.5 versicolor
6:          4.5         1.3 versicolor
[1] "############################### end  79 Sat Oct 20 09:33:05 2018"
[1] "############################### start  81 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00081_informalexample_5.12_of_section_5.1.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.12 of section 5.1.1 
> # (informalexample 5.12 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 
> 
> library("dplyr")
```

```

Attaching package: 'dplyr'
```

```
The following objects are masked from 'package:data.table':

    between, first, last
```

```
The following objects are masked from 'package:stats':

    filter, lag
```

```
The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union
```

```

> iris_dplyr <- iris %>% 
   select(.,
          Petal.Length, Petal.Width, Species) %>%
   filter(.,
          Petal.Length > 2)

> head(iris_dplyr)
  Petal.Length Petal.Width    Species
1          4.7         1.4 versicolor
2          4.5         1.5 versicolor
3          4.9         1.5 versicolor
4          4.0         1.3 versicolor
5          4.6         1.5 versicolor
6          4.5         1.3 versicolor
[1] "############################### end  81 Sat Oct 20 09:33:05 2018"
[1] "############################### start  83 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00083_informalexample_5.14_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.14 of section 5.1.2 
> # (informalexample 5.14 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> library("ggplot2")

> data(msleep)

> str(msleep)
Classes 'tbl_df', 'tbl' and 'data.frame':	83 obs. of  11 variables:
 $ name        : chr  "Cheetah" "Owl monkey" "Mountain beaver" "Greater short-tailed shrew" ...
 $ genus       : chr  "Acinonyx" "Aotus" "Aplodontia" "Blarina" ...
 $ vore        : chr  "carni" "omni" "herbi" "omni" ...
 $ order       : chr  "Carnivora" "Primates" "Rodentia" "Soricomorpha" ...
 $ conservation: chr  "lc" NA "nt" "lc" ...
 $ sleep_total : num  12.1 17 14.4 14.9 4 14.4 8.7 7 10.1 3 ...
 $ sleep_rem   : num  NA 1.8 2.4 2.3 0.7 2.2 1.4 NA 2.9 NA ...
 $ sleep_cycle : num  NA NA NA 0.133 0.667 ...
 $ awake       : num  11.9 7 9.6 9.1 20 9.6 15.3 17 13.9 21 ...
 $ brainwt     : num  NA 0.0155 NA 0.00029 0.423 NA NA NA 0.07 0.0982 ...
 $ bodywt      : num  50 0.48 1.35 0.019 600 ...
[1] "############################### end  83 Sat Oct 20 09:33:05 2018"
[1] "############################### start  85 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00085_informalexample_5.16_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.16 of section 5.1.2 
> # (informalexample 5.16 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> summary(msleep)
     name              genus               vore          
 Length:83          Length:83          Length:83         
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
    order           conservation        sleep_total      sleep_rem    
 Length:83          Length:83          Min.   : 1.90   Min.   :0.100  
 Class :character   Class :character   1st Qu.: 7.85   1st Qu.:0.900  
 Mode  :character   Mode  :character   Median :10.10   Median :1.500  
                                       Mean   :10.43   Mean   :1.875  
                                       3rd Qu.:13.75   3rd Qu.:2.400  
                                       Max.   :19.90   Max.   :6.600  
                                                       NA's   :22     
  sleep_cycle         awake          brainwt            bodywt        
 Min.   :0.1167   Min.   : 4.10   Min.   :0.00014   Min.   :   0.005  
 1st Qu.:0.1833   1st Qu.:10.25   1st Qu.:0.00290   1st Qu.:   0.174  
 Median :0.3333   Median :13.90   Median :0.01240   Median :   1.670  
 Mean   :0.4396   Mean   :13.57   Mean   :0.28158   Mean   : 166.136  
 3rd Qu.:0.5792   3rd Qu.:16.15   3rd Qu.:0.12550   3rd Qu.:  41.750  
 Max.   :1.5000   Max.   :22.10   Max.   :5.71200   Max.   :6654.000  
 NA's   :51                       NA's   :27                          
[1] "############################### end  85 Sat Oct 20 09:33:05 2018"
[1] "############################### start  87 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00087_informalexample_5.18_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.18 of section 5.1.2 
> # (informalexample 5.18 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> clean_base_1 <- msleep[complete.cases(msleep), , drop = FALSE]

> summary(clean_base_1)
     name              genus               vore          
 Length:20          Length:20          Length:20         
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
    order           conservation        sleep_total       sleep_rem    
 Length:20          Length:20          Min.   : 2.900   Min.   :0.600  
 Class :character   Class :character   1st Qu.: 8.925   1st Qu.:1.300  
 Mode  :character   Mode  :character   Median :11.300   Median :2.350  
                                       Mean   :11.225   Mean   :2.275  
                                       3rd Qu.:13.925   3rd Qu.:3.125  
                                       Max.   :19.700   Max.   :4.900  
  sleep_cycle         awake          brainwt            bodywt        
 Min.   :0.1167   Min.   : 4.30   Min.   :0.00014   Min.   :  0.0050  
 1st Qu.:0.1792   1st Qu.:10.07   1st Qu.:0.00115   1st Qu.:  0.0945  
 Median :0.2500   Median :12.70   Median :0.00590   Median :  0.7490  
 Mean   :0.3458   Mean   :12.78   Mean   :0.07882   Mean   : 72.1177  
 3rd Qu.:0.4167   3rd Qu.:15.07   3rd Qu.:0.03670   3rd Qu.:  6.1250  
 Max.   :1.0000   Max.   :21.10   Max.   :0.65500   Max.   :600.0000  
[1] "############################### end  87 Sat Oct 20 09:33:05 2018"
[1] "############################### start  89 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00089_informalexample_5.20_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.20 of section 5.1.2 
> # (informalexample 5.20 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> nrow(clean_base_1)
[1] 20
[1] "############################### end  89 Sat Oct 20 09:33:05 2018"
[1] "############################### start  91 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00091_informalexample_5.22_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.22 of section 5.1.2 
> # (informalexample 5.22 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> clean_base_2 = na.omit(msleep)

> nrow(clean_base_2)
[1] 20
[1] "############################### end  91 Sat Oct 20 09:33:05 2018"
[1] "############################### start  93 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00093_informalexample_5.24_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.24 of section 5.1.2 
> # (informalexample 5.24 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> library("data.table")

> msleep_data.table <- as.data.table(msleep)

> clean_data.table = msleep_data.table[complete.cases(msleep_data.table), ]

> nrow(clean_data.table)
[1] 20
[1] "############################### end  93 Sat Oct 20 09:33:05 2018"
[1] "############################### start  95 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00095_informalexample_5.26_of_section_5.1.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.26 of section 5.1.2 
> # (informalexample 5.26 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 
> 
> library("dplyr")

> clean_dplyr <- msleep %>% 
   filter(., complete.cases(.))

> nrow(clean_dplyr)
[1] 20
[1] "############################### end  95 Sat Oct 20 09:33:05 2018"
[1] "############################### start  97 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00097_informalexample_5.28_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.28 of section 5.1.3 
> # (informalexample 5.28 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> data <- wrapr::build_frame(
    "x", "y" |
    1  , 1   |
    0  , 0   |
    1  , 0   |
    0  , 1   |
    0  , 0   |
    1  , 1   )
[1] "############################### end  97 Sat Oct 20 09:33:05 2018"
[1] "############################### start  98 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00098_informalexample_5.29_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.29 of section 5.1.3 
> # (informalexample 5.29 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> order_index <- with(data, order(x, y, decreasing = TRUE))

> data[order_index, , drop = FALSE]
  x y
1 1 1
6 1 1
3 1 0
4 0 1
2 0 0
5 0 0
[1] "############################### end  98 Sat Oct 20 09:33:05 2018"
[1] "############################### start  100 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00100_informalexample_5.31_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.31 of section 5.1.3 
> # (informalexample 5.31 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> library("data.table")

> DT_ordered <- as.data.table(data)

> # similar to base-R solution
> order_index <- with(DT_ordered, order(x, y, decreasing = TRUE))

> DT_ordered[order_index, ]
   x y
1: 1 1
2: 1 1
3: 1 0
4: 0 1
5: 0 0
6: 0 0
[1] "############################### end  100 Sat Oct 20 09:33:05 2018"
[1] "############################### start  102 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00102_informalexample_5.33_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.33 of section 5.1.3 
> # (informalexample 5.33 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> # in-place solution
> order_cols <- c("x", "y")

> setorderv(DT_ordered, order_cols, order = -1L)

> DT_ordered
   x y
1: 1 1
2: 1 1
3: 1 0
4: 0 1
5: 0 0
6: 0 0
[1] "############################### end  102 Sat Oct 20 09:33:05 2018"
[1] "############################### start  104 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00104_informalexample_5.35_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.35 of section 5.1.3 
> # (informalexample 5.35 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> library("wrapr")
```

```

Attaching package: 'wrapr'
```

```
The following object is masked from 'package:dplyr':

    coalesce
```

```
The following object is masked from 'package:data.table':

    :=
```

```

> order_cols <- c("x", "y")

> order_index <- orderv(data[order_cols], decreasing = TRUE)

> data[order_index, , drop = FALSE]
  x y
1 1 1
6 1 1
3 1 0
4 0 1
2 0 0
5 0 0
[1] "############################### end  104 Sat Oct 20 09:33:05 2018"
[1] "############################### start  106 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00106_informalexample_5.37_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.37 of section 5.1.3 
> # (informalexample 5.37 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> library("dplyr")

> data %>%
   arrange(., desc(x), desc(y))
  x y
1 1 1
2 1 1
3 1 0
4 0 1
5 0 0
6 0 0
[1] "############################### end  106 Sat Oct 20 09:33:05 2018"
[1] "############################### start  108 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00108_informalexample_5.39_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.39 of section 5.1.3 
> # (informalexample 5.39 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> # first sort the data
> order_index <- with(data, order(x, y, decreasing = TRUE))

> odata <- data[order_index, , drop = FALSE]

> # now split into groups
> data_list <- split(odata, -odata$x)

> # apply the cumsum to each group
> data_list <- lapply(
   data_list,
   function(di) {
     di$running_y_sum <- cumsum(di$y)
     di
   })

> # put the results back to together
> odata <- do.call(rbind, data_list)

> rownames(odata) <- NULL

> print(odata)
  x y running_y_sum
1 1 1             1
2 1 1             2
3 1 0             2
4 0 1             1
5 0 0             1
6 0 0             1
[1] "############################### end  108 Sat Oct 20 09:33:05 2018"
[1] "############################### start  110 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00110_informalexample_5.41_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.41 of section 5.1.3 
> # (informalexample 5.41 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> library("data.table")

> DT_ordered <- as.data.table(data)

> DT_ordered[order(-x, -y), running_y_sum := cumsum(y), by = "x"]
   x y running_y_sum
1: 1 1             1
2: 0 0             1
3: 1 0             2
4: 0 1             1
5: 0 0             1
6: 1 1             2

> print(DT_ordered[])
   x y running_y_sum
1: 1 1             1
2: 0 0             1
3: 1 0             2
4: 0 1             1
5: 0 0             1
6: 1 1             2
[1] "############################### end  110 Sat Oct 20 09:33:05 2018"
[1] "############################### start  112 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00112_informalexample_5.43_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.43 of section 5.1.3 
> # (informalexample 5.43 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> order_cols <- c("x", "y")

> setorderv(DT_ordered, order_cols, order = -1L)

> DT_ordered
   x y running_y_sum
1: 1 1             1
2: 1 1             2
3: 1 0             2
4: 0 1             1
5: 0 0             1
6: 0 0             1
[1] "############################### end  112 Sat Oct 20 09:33:05 2018"
[1] "############################### start  114 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00114_informalexample_5.45_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.45 of section 5.1.3 
> # (informalexample 5.45 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> DT_ordered <- as.data.table(data)

> DT_ordered <- 
   DT_ordered[order(-x, -y) ][ 
     , running_y_sum := cumsum(y), by = "x" ][
     ]

> DT_ordered
   x y running_y_sum
1: 1 1             1
2: 1 1             2
3: 1 0             2
4: 0 1             1
5: 0 0             1
6: 0 0             1
[1] "############################### end  114 Sat Oct 20 09:33:05 2018"
[1] "############################### start  116 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00116_informalexample_5.47_of_section_5.1.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.47 of section 5.1.3 
> # (informalexample 5.47 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 
> 
> library("dplyr")

> data %>%
   arrange(., desc(x), desc(y)) %>%
   group_by(., x) %>%
   mutate(., running_y_sum = cumsum(y)) %>%
   ungroup(.)
# A tibble: 6 x 3
      x     y running_y_sum
  <dbl> <dbl>         <dbl>
1     1     1             1
2     1     1             2
3     1     0             2
4     0     1             1
5     0     0             1
6     0     0             1
[1] "############################### end  116 Sat Oct 20 09:33:05 2018"
[1] "############################### start  118 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00118_informalexample_5.49_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.49 of section 5.2.1 
> # (informalexample 5.49 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("datasets")

> library("ggplot2")

> summary(airquality)
     Ozone           Solar.R           Wind             Temp      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
 Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
 NA's   :37       NA's   :7                                       
     Month            Day      
 Min.   :5.000   Min.   : 1.0  
 1st Qu.:6.000   1st Qu.: 8.0  
 Median :7.000   Median :16.0  
 Mean   :6.993   Mean   :15.8  
 3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :9.000   Max.   :31.0  
                               
[1] "############################### end  118 Sat Oct 20 09:33:05 2018"
[1] "############################### start  120 Sat Oct 20 09:33:05 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00120_informalexample_5.51_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.51 of section 5.2.1 
> # (informalexample 5.51 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("lubridate")
```

```

Attaching package: 'lubridate'
```

```
The following objects are masked from 'package:data.table':

    hour, isoweek, mday, minute, month, quarter, second, wday,
    week, yday, year
```

```
The following object is masked from 'package:base':

    date
```

![plot of chunk ch5ex1](figures/ch05/ch5ex1-1.pdf)

```

> library("dplyr")

> # create a function to make the date string.
> datestr = function(day, month, year) {
   paste(day, month, year, sep="-")
 }
[1] "############################### end  120 Sat Oct 20 09:33:06 2018"
[1] "############################### start  121 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00121_informalexample_5.52_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.52 of section 5.2.1 
> # (informalexample 5.52 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> # build a copy of the data
> airquality_with_date <- airquality

> # add the date column
> airquality_with_date$date <- with(airquality_with_date,
                                   dmy(datestr(Day, Month, 1973)))

> # limit down to columns of interest
> airquality_with_date <- airquality_with_date[,
                                              c("Ozone", "date"),
                                              drop = FALSE]

> # show the results
> head(airquality_with_date)
  Ozone       date
1    41 1973-05-01
2    36 1973-05-02
3    12 1973-05-03
4    18 1973-05-04
5    NA 1973-05-05
6    28 1973-05-06
[1] "############################### end  121 Sat Oct 20 09:33:06 2018"
[1] "############################### start  123 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00123_informalexample_5.54_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.54 of section 5.2.1 
> # (informalexample 5.54 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> # plot the data
> ggplot(airquality_with_date, aes(x=date, y=Ozone)) + 
   geom_point() + 
   geom_line() + 
   xlab("Date") +
   ggtitle("New York ozone readings, May 1 - Sept 30, 1973")
```

```
Warning: Removed 37 rows containing missing values (geom_point).
```

```
[1] "############################### end  123 Sat Oct 20 09:33:06 2018"
[1] "############################### start  124 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00124_informalexample_5.55_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.55 of section 5.2.1 
> # (informalexample 5.55 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("data.table")

> DT_airquality <- 
   # convert to data.table class
   as.data.table(airquality)[ 
     # add a new date column
     , date := dmy(datestr(Day, Month, 1973)) ][
       # limit down to columns of interest
       , c("Ozone", "date")]

> head(DT_airquality)
   Ozone       date
1:    41 1973-05-01
2:    36 1973-05-02
3:    12 1973-05-03
4:    18 1973-05-04
5:    NA 1973-05-05
6:    28 1973-05-06
[1] "############################### end  124 Sat Oct 20 09:33:06 2018"
[1] "############################### start  126 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00126_informalexample_5.57_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.57 of section 5.2.1 
> # (informalexample 5.57 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("dplyr")

> airquality_with_date2 <- airquality %>%
   mutate(., date = dmy(datestr(Day, Month, 1973))) %>%
   select(., Ozone, date)

> head(airquality_with_date2)
  Ozone       date
1    41 1973-05-01
2    36 1973-05-02
3    12 1973-05-03
4    18 1973-05-04
5    NA 1973-05-05
6    28 1973-05-06
[1] "############################### end  126 Sat Oct 20 09:33:06 2018"
[1] "############################### start  128 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00128_informalexample_5.59_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.59 of section 5.2.1 
> # (informalexample 5.59 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("zoo")
```

```

Attaching package: 'zoo'
```

```
The following objects are masked from 'package:base':

    as.Date, as.Date.numeric
```

![plot of chunk ch5ex1](figures/ch05/ch5ex1-2.pdf)

```

> airquality_corrected <- airquality_with_date

> airquality_corrected$OzoneCorrected <-
   na.locf(airquality_corrected$Ozone, na.rm = FALSE)

> summary(airquality_corrected)
     Ozone             date            OzoneCorrected  
 Min.   :  1.00   Min.   :1973-05-01   Min.   :  1.00  
 1st Qu.: 18.00   1st Qu.:1973-06-08   1st Qu.: 16.00  
 Median : 31.50   Median :1973-07-16   Median : 30.00  
 Mean   : 42.13   Mean   :1973-07-16   Mean   : 39.78  
 3rd Qu.: 63.25   3rd Qu.:1973-08-23   3rd Qu.: 52.00  
 Max.   :168.00   Max.   :1973-09-30   Max.   :168.00  
 NA's   :37                                            
[1] "############################### end  128 Sat Oct 20 09:33:06 2018"
[1] "############################### start  130 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00130_informalexample_5.61_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.61 of section 5.2.1 
> # (informalexample 5.61 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> ggplot(airquality_corrected, aes(x=date, y=Ozone)) + 
   geom_point(aes(y=Ozone)) + 
   geom_line(aes(y=OzoneCorrected)) + 
   ggtitle("New York ozone readings, May 1 - Sept 30, 1973",
           subtitle = "(corrected)") +
   xlab("Date")
```

```
Warning: Removed 37 rows containing missing values (geom_point).
```

![plot of chunk ch5ex1](figures/ch05/ch5ex1-3.pdf)

```
[1] "############################### end  130 Sat Oct 20 09:33:06 2018"
[1] "############################### start  131 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00131_informalexample_5.62_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.62 of section 5.2.1 
> # (informalexample 5.62 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("data.table")

> library("zoo")

> DT_airquality[, OzoneCorrected := na.locf(Ozone, na.rm=FALSE)]
     Ozone       date OzoneCorrected
  1:    41 1973-05-01             41
  2:    36 1973-05-02             36
  3:    12 1973-05-03             12
  4:    18 1973-05-04             18
  5:    NA 1973-05-05             18
 ---                                
149:    30 1973-09-26             30
150:    NA 1973-09-27             30
151:    14 1973-09-28             14
152:    18 1973-09-29             18
153:    20 1973-09-30             20

> summary(DT_airquality)
     Ozone             date            OzoneCorrected  
 Min.   :  1.00   Min.   :1973-05-01   Min.   :  1.00  
 1st Qu.: 18.00   1st Qu.:1973-06-08   1st Qu.: 16.00  
 Median : 31.50   Median :1973-07-16   Median : 30.00  
 Mean   : 42.13   Mean   :1973-07-16   Mean   : 39.78  
 3rd Qu.: 63.25   3rd Qu.:1973-08-23   3rd Qu.: 52.00  
 Max.   :168.00   Max.   :1973-09-30   Max.   :168.00  
 NA's   :37                                            
[1] "############################### end  131 Sat Oct 20 09:33:06 2018"
[1] "############################### start  133 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00133_informalexample_5.64_of_section_5.2.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.64 of section 5.2.1 
> # (informalexample 5.64 of section 5.2.1)  : Data Engineering and Data Shaping : Basic Data Transforms : Add new columns 
> 
> library("dplyr")

> library("zoo")

> airquality_with_date %>% 
   mutate(.,
          OzoneCorrected = na.locf(Ozone, na.rm = FALSE)) %>% 
   summary(.)
     Ozone             date            OzoneCorrected  
 Min.   :  1.00   Min.   :1973-05-01   Min.   :  1.00  
 1st Qu.: 18.00   1st Qu.:1973-06-08   1st Qu.: 16.00  
 Median : 31.50   Median :1973-07-16   Median : 30.00  
 Mean   : 42.13   Mean   :1973-07-16   Mean   : 39.78  
 3rd Qu.: 63.25   3rd Qu.:1973-08-23   3rd Qu.: 52.00  
 Max.   :168.00   Max.   :1973-09-30   Max.   :168.00  
 NA's   :37                                            
[1] "############################### end  133 Sat Oct 20 09:33:06 2018"
[1] "############################### start  135 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00135_informalexample_5.66_of_section_5.2.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.66 of section 5.2.2 
> # (informalexample 5.66 of section 5.2.2)  : Data Engineering and Data Shaping : Basic Data Transforms : Other simple operations 
> 
> d <- data.frame(x = 1:2, y = 3:4)

> print(d)
  x y
1 1 3
2 2 4

> #>   x y
> #> 1 1 3
> #> 2 2 4
> 
> colnames(d) <- c("BIGX", "BIGY")

> print(d)
  BIGX BIGY
1    1    3
2    2    4

> #>   BIGX BIGY
> #> 1    1    3
> #> 2    2    4
> 
> d$BIGX <- NULL

> print(d)
  BIGY
1    3
2    4

> #>   BIGY
> #> 1    3
> #> 2    4
> 
[1] "############################### end  135 Sat Oct 20 09:33:06 2018"
[1] "############################### start  136 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00136_informalexample_5.67_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.67 of section 5.2.3 
> # (informalexample 5.67 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> d <- data.frame(x = 1:2, y = 3:4, zero = 5:6)

> print(d$x)
[1] 1 2
[1] "############################### end  136 Sat Oct 20 09:33:06 2018"
[1] "############################### start  138 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00138_informalexample_5.69_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.69 of section 5.2.3 
> # (informalexample 5.69 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> d$q
NULL
[1] "############################### end  138 Sat Oct 20 09:33:06 2018"
[1] "############################### start  140 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00140_informalexample_5.71_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.71 of section 5.2.3 
> # (informalexample 5.71 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> d$z
[1] 5 6
[1] "############################### end  140 Sat Oct 20 09:33:06 2018"
[1] "############################### start  142 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00142_informalexample_5.73_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.73 of section 5.2.3 
> # (informalexample 5.73 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> # this value may come to us from somewhere else
> # or be very long and something we don't want
> # to type over and over again.
> columns_to_print <- c("x", "y") 

> for(ci in columns_to_print) {
   print(ci)
   print(d[[ci]])
 }
[1] "x"
[1] 1 2
[1] "y"
[1] 3 4
[1] "############################### end  142 Sat Oct 20 09:33:06 2018"
[1] "############################### start  144 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00144_informalexample_5.75_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.75 of section 5.2.3 
> # (informalexample 5.75 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> data <- wrapr::build_frame(
    "x", "y" |
    1  , 1   |
    0  , 0   |
    1  , 0   |
    0  , 1   |
    0  , 0   |
    1  , 1   )

> order_cols <- c("x", "y")

> ordering <- wrapr::orderv(data[, order_cols, drop = FALSE])

> data[ordering, , drop = FALSE]
  x y
2 0 0
5 0 0
4 0 1
3 1 0
1 1 1
6 1 1
[1] "############################### end  144 Sat Oct 20 09:33:06 2018"
[1] "############################### start  146 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00146_informalexample_5.77_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.77 of section 5.2.3 
> # (informalexample 5.77 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> library("data.table")

> d <- data.table(x = 1:2, y = 3:4, z= 5:6)

> NEW_COL_NAME = "q"

> ARG1_NAME = as.name("x")

> ARG2_NAME = as.name("y")

> d[ , c(NEW_COL_NAME) := eval(ARG1_NAME) + eval(ARG2_NAME)]
   x y z q
1: 1 3 5 4
2: 2 4 6 6

> print(d)
   x y z q
1: 1 3 5 4
2: 2 4 6 6
[1] "############################### end  146 Sat Oct 20 09:33:06 2018"
[1] "############################### start  148 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00148_informalexample_5.79_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.79 of section 5.2.3 
> # (informalexample 5.79 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> library("dplyr")

> d <- data.frame(x = 1:2, y = 3:4)

> x <- "y"

> d %>% select(., x)
  x
1 1
2 2
[1] "############################### end  148 Sat Oct 20 09:33:06 2018"
[1] "############################### start  150 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00150_informalexample_5.81_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.81 of section 5.2.3 
> # (informalexample 5.81 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> library("dplyr")

> d <- data.frame(x = 1:2, y = 3:4)

> COLUMN_WE_WANT <- "y"

> d %>% select(., !!COLUMN_WE_WANT)
  y
1 3
2 4
[1] "############################### end  150 Sat Oct 20 09:33:06 2018"
[1] "############################### start  152 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00152_informalexample_5.83_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.83 of section 5.2.3 
> # (informalexample 5.83 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> library("dplyr")

> d <- data.frame(x = 1:2, y = 3:4, z= 5:6)

> NEW_COL_NAME = "q"

> ARG1_NAME = as.name("x")

> ARG2_NAME = as.name("y")

> d %>%
   mutate(., !!NEW_COL_NAME := !!ARG1_NAME + !!ARG2_NAME)
  x y z q
1 1 3 5 4
2 2 4 6 6
[1] "############################### end  152 Sat Oct 20 09:33:06 2018"
[1] "############################### start  154 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00154_informalexample_5.85_of_section_5.2.3.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.85 of section 5.2.3 
> # (informalexample 5.85 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 
> 
> library("dplyr")

> d <- data.frame(x = 1:2, y = 3:4, z= 5:6)

> aliases = c(NEW_COL_NAME = "q",
             ARG1_NAME    = "x",
             ARG2_NAME    = "y")

> wrapr::let(
   aliases,
   
   d %>%
     mutate(., NEW_COL_NAME = ARG1_NAME + ARG2_NAME)
   
 )
  x y z q
1 1 3 5 4
2 2 4 6 6
[1] "############################### end  154 Sat Oct 20 09:33:06 2018"
[1] "############################### start  156 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00156_informalexample_5.87_of_section_5.3.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.87 of section 5.3.1 
> # (informalexample 5.87 of section 5.3.1)  : Data Engineering and Data Shaping : Aggregating Transforms : Scenario 
> 
> data <- wrapr::build_frame(
    "time", "sensor1", "sensor2", "sensor3" |
    1L    , NA       , -0.07528 , -0.07528  |
    2L    , NA       , -0.164   , NA        |
    3L    , NA       , -0.8119  , -0.8119   |
    4L    , NA       , NA       , -0.461    |
    5L    , NA       , NA       , NA        )
[1] "############################### end  156 Sat Oct 20 09:33:06 2018"
[1] "############################### start  157 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00157_informalexample_5.88_of_section_5.3.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.88 of section 5.3.1 
> # (informalexample 5.88 of section 5.3.1)  : Data Engineering and Data Shaping : Aggregating Transforms : Scenario 
> 
> library("wrapr")

> data$reading <- data$sensor1 %?% data$sensor2 %?% data$sensor3 %?% 0.0

> print(data)
  time sensor1  sensor2  sensor3  reading
1    1      NA -0.07528 -0.07528 -0.07528
2    2      NA -0.16400       NA -0.16400
3    3      NA -0.81190 -0.81190 -0.81190
4    4      NA       NA -0.46100 -0.46100
5    5      NA       NA       NA  0.00000
[1] "############################### end  157 Sat Oct 20 09:33:06 2018"
```


```r
runDir(paste0(code_dir, 'c05_Data_Engineering_and_Data_Shaping'),
       public_dir,
       first = 160)
```

```
[1] "############################### start  161 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00161_informalexample_5.92_of_section_5.3.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.92 of section 5.3.2 
> # (informalexample 5.92 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 
> 
> library("datasets")

> library("ggplot2")

> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
[1] "############################### end  161 Sat Oct 20 09:33:06 2018"
[1] "############################### start  163 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00163_informalexample_5.94_of_section_5.3.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.94 of section 5.3.2 
> # (informalexample 5.94 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 
> 
> library("data.table")

> iris_data.table <- as.data.table(iris)

> iris_data.table <- iris_data.table[, 
                                    .(Petal.Length = mean(Petal.Length),
                                      Petal.Width = mean(Petal.Width)), 
                                    by = .(Species)]

> iris_data.table
      Species Petal.Length Petal.Width
1:     setosa        1.462       0.246
2: versicolor        4.260       1.326
3:  virginica        5.552       2.026
[1] "############################### end  163 Sat Oct 20 09:33:06 2018"
[1] "############################### start  165 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00165_informalexample_5.96_of_section_5.3.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.96 of section 5.3.2 
> # (informalexample 5.96 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 
> 
> ggplot(mapping = aes(x=Petal.Length, y=Petal.Width, 
                      shape=Species, color=Species)) + 
   geom_point(data = iris, # raw data
              alpha = 0.5) + 
   geom_point(data = iris_data.table, # per-group summaries
              size = 5) +
   ggtitle("Average Petal dimensions by iris species\n(with raw data for reference)")
```

```
[1] "############################### end  165 Sat Oct 20 09:33:06 2018"
[1] "############################### start  166 Sat Oct 20 09:33:06 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00166_informalexample_5.97_of_section_5.3.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.97 of section 5.3.2 
> # (informalexample 5.97 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 
> 
> library("dplyr")

> iris %>% group_by(., Species) %>% 
   summarize(.,
             Petal.Length = mean(Petal.Length),
             Petal.Width = mean(Petal.Width)) %>%
   ungroup(.) -> iris.summary

> iris.summary
# A tibble: 3 x 3
  Species    Petal.Length Petal.Width
  <fct>             <dbl>       <dbl>
1 setosa             1.46       0.246
2 versicolor         4.26       1.33 
3 virginica          5.55       2.03 
[1] "############################### end  166 Sat Oct 20 09:33:07 2018"
[1] "############################### start  168 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00168_informalexample_5.99_of_section_5.3.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.99 of section 5.3.2 
> # (informalexample 5.99 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 
> 
> library("data.table")

> iris_data.table <- as.data.table(iris)

> iris_data.table[ , 
                  `:=`(mean_Petal.Length = mean(Petal.Length),
                       mean_Petal.Width = mean(Petal.Width)), 
                  by = "Species"]
     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
  1:          5.1         3.5          1.4         0.2    setosa
  2:          4.9         3.0          1.4         0.2    setosa
  3:          4.7         3.2          1.3         0.2    setosa
  4:          4.6         3.1          1.5         0.2    setosa
  5:          5.0         3.6          1.4         0.2    setosa
 ---                                                            
146:          6.7         3.0          5.2         2.3 virginica
147:          6.3         2.5          5.0         1.9 virginica
148:          6.5         3.0          5.2         2.0 virginica
149:          6.2         3.4          5.4         2.3 virginica
150:          5.9         3.0          5.1         1.8 virginica
     mean_Petal.Length mean_Petal.Width
  1:             1.462            0.246
  2:             1.462            0.246
  3:             1.462            0.246
  4:             1.462            0.246
  5:             1.462            0.246
 ---                                   
146:             5.552            2.026
147:             5.552            2.026
148:             5.552            2.026
149:             5.552            2.026
150:             5.552            2.026

> # print(iris_data.table)
> 
[1] "############################### end  168 Sat Oct 20 09:33:07 2018"
[1] "############################### start  169 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00169_informalexample_5.100_of_section_5.3.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.100 of section 5.3.2 
> # (informalexample 5.100 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 
> 
> library("dplyr")

> iris_dplyr <- iris %>% 
   group_by(., Species) %>% 
   mutate(.,
          mean_Petal.Length = mean(Petal.Length),
          mean_Petal.Width = mean(Petal.Width)) %>%
   ungroup(.)

> # print(iris_dplyr)
> 
[1] "############################### end  169 Sat Oct 20 09:33:07 2018"
[1] "############################### start  170 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00170_informalexample_5.101_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.101 of section 5.4.1 
> # (informalexample 5.101 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> productTable <- wrapr::build_frame(
    "productID", "price" |
    "p1"       , 9.99    |
    "p2"       , 16.29   |
    "p3"       , 19.99   |
    "p4"       , 5.49    |
    "p5"       , 24.49   )

> salesTable <- wrapr::build_frame(
    "productID", "sold_store", "sold_online" |
    "p1"       , 6           , 64            |
    "p2"       , 31          , 1             |
    "p3"       , 30          , 23            |
    "p4"       , 31          , 67            |
    "p5"       , 43          , 51            )

> productTable2 <- wrapr::build_frame(
    "productID", "price" |
    "n1"       , 25.49   |
    "n2"       , 33.99   |
    "n3"       , 17.99   )

> # often data as factor columns,
> # convert a column to factor to demonstrate 
> # workint with such columns
> productTable$productID <- factor(productTable$productID)

> productTable2$productID <- factor(productTable2$productID)
[1] "############################### end  170 Sat Oct 20 09:33:07 2018"
[1] "############################### start  171 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00171_informalexample_5.102_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.102 of section 5.4.1 
> # (informalexample 5.102 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> rbind_base = rbind(productTable, 
                    productTable2)
[1] "############################### end  171 Sat Oct 20 09:33:07 2018"
[1] "############################### start  172 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00172_informalexample_5.103_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.103 of section 5.4.1 
> # (informalexample 5.103 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> str(rbind_base)
'data.frame':	8 obs. of  2 variables:
 $ productID: Factor w/ 8 levels "p1","p2","p3",..: 1 2 3 4 5 6 7 8
 $ price    : num  9.99 16.29 19.99 5.49 24.49 ...
[1] "############################### end  172 Sat Oct 20 09:33:07 2018"
[1] "############################### start  174 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00174_informalexample_5.105_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.105 of section 5.4.1 
> # (informalexample 5.105 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> library("data.table")

> rbindlist(list(productTable, 
                productTable2))
   productID price
1:        p1  9.99
2:        p2 16.29
3:        p3 19.99
4:        p4  5.49
5:        p5 24.49
6:        n1 25.49
7:        n2 33.99
8:        n3 17.99
[1] "############################### end  174 Sat Oct 20 09:33:07 2018"
[1] "############################### start  176 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00176_informalexample_5.107_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.107 of section 5.4.1 
> # (informalexample 5.107 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> library("dplyr")

> # pass in a list of data frames. This works with more than two data frames, as well
> bind_rows(list(productTable, 
                productTable2))
```

```
Warning in bind_rows_(x, .id): Unequal factor levels: coercing to character
```

```
Warning in bind_rows_(x, .id): binding character and factor vector,
coercing into character vector

Warning in bind_rows_(x, .id): binding character and factor vector,
coercing into character vector
```

```
  productID price
1        p1  9.99
2        p2 16.29
3        p3 19.99
4        p4  5.49
5        p5 24.49
6        n1 25.49
7        n2 33.99
8        n3 17.99
[1] "############################### end  176 Sat Oct 20 09:33:07 2018"
[1] "############################### start  178 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00178_informalexample_5.109_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.109 of section 5.4.1 
> # (informalexample 5.109 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> # add an extra column telling us which table
> # each row comes from
> productTable_marked <- productTable

> productTable_marked$table <- "productTable"

> productTable2_marked <- productTable2

> productTable2_marked$table <- "productTable2"

> # combine the tables
> rbind_base <- rbind(productTable_marked, 
                     productTable2_marked)

> rbind_base
  productID price         table
1        p1  9.99  productTable
2        p2 16.29  productTable
3        p3 19.99  productTable
4        p4  5.49  productTable
5        p5 24.49  productTable
6        n1 25.49 productTable2
7        n2 33.99 productTable2
8        n3 17.99 productTable2
[1] "############################### end  178 Sat Oct 20 09:33:07 2018"
[1] "############################### start  180 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00180_informalexample_5.111_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.111 of section 5.4.1 
> # (informalexample 5.111 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> # split them apart
> tables <- split(rbind_base, rbind_base$table)

> tables
$productTable
  productID price        table
1        p1  9.99 productTable
2        p2 16.29 productTable
3        p3 19.99 productTable
4        p4  5.49 productTable
5        p5 24.49 productTable

$productTable2
  productID price         table
6        n1 25.49 productTable2
7        n2 33.99 productTable2
8        n3 17.99 productTable2

[1] "############################### end  180 Sat Oct 20 09:33:07 2018"
[1] "############################### start  182 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00182_informalexample_5.113_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.113 of section 5.4.1 
> # (informalexample 5.113 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> library("data.table")

> # convert to data.table
> dt <- as.data.table(rbind_base)

> # arbitrary user defined function
> f <- function(.BY, .SD) {
   max(.SD$price)
 }

> # apply the function to each group
> # and collect results
> dt[ , max_price := f(.BY, .SD), by = table]
   productID price         table max_price
1:        p1  9.99  productTable     24.49
2:        p2 16.29  productTable     24.49
3:        p3 19.99  productTable     24.49
4:        p4  5.49  productTable     24.49
5:        p5 24.49  productTable     24.49
6:        n1 25.49 productTable2     33.99
7:        n2 33.99 productTable2     33.99
8:        n3 17.99 productTable2     33.99

> print(dt)
   productID price         table max_price
1:        p1  9.99  productTable     24.49
2:        p2 16.29  productTable     24.49
3:        p3 19.99  productTable     24.49
4:        p4  5.49  productTable     24.49
5:        p5 24.49  productTable     24.49
6:        n1 25.49 productTable2     33.99
7:        n2 33.99 productTable2     33.99
8:        n3 17.99 productTable2     33.99
[1] "############################### end  182 Sat Oct 20 09:33:07 2018"
[1] "############################### start  184 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00184_informalexample_5.115_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.115 of section 5.4.1 
> # (informalexample 5.115 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> library("data.table")

> dt <- as.data.table(rbind_base)

> grouping_column <- "table"

> dt[ , max_price := max(price), by = eval(grouping_column)]
   productID price         table max_price
1:        p1  9.99  productTable     24.49
2:        p2 16.29  productTable     24.49
3:        p3 19.99  productTable     24.49
4:        p4  5.49  productTable     24.49
5:        p5 24.49  productTable     24.49
6:        n1 25.49 productTable2     33.99
7:        n2 33.99 productTable2     33.99
8:        n3 17.99 productTable2     33.99

> print(dt)
   productID price         table max_price
1:        p1  9.99  productTable     24.49
2:        p2 16.29  productTable     24.49
3:        p3 19.99  productTable     24.49
4:        p4  5.49  productTable     24.49
5:        p5 24.49  productTable     24.49
6:        n1 25.49 productTable2     33.99
7:        n2 33.99 productTable2     33.99
8:        n3 17.99 productTable2     33.99
[1] "############################### end  184 Sat Oct 20 09:33:07 2018"
[1] "############################### start  186 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00186_informalexample_5.117_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.117 of section 5.4.1 
> # (informalexample 5.117 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> rbind_base %>%
   group_by(., table) %>%
   mutate(., max_price = max(price)) %>%
   ungroup(.)
# A tibble: 8 x 4
  productID price table         max_price
  <fct>     <dbl> <chr>             <dbl>
1 p1         9.99 productTable       24.5
2 p2        16.3  productTable       24.5
3 p3        20.0  productTable       24.5
4 p4         5.49 productTable       24.5
5 p5        24.5  productTable       24.5
6 n1        25.5  productTable2      34.0
7 n2        34.0  productTable2      34.0
8 n3        18.0  productTable2      34.0
[1] "############################### end  186 Sat Oct 20 09:33:07 2018"
[1] "############################### start  188 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00188_informalexample_5.119_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.119 of section 5.4.1 
> # (informalexample 5.119 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> cbind(productTable, salesTable[,-1])
  productID price sold_store sold_online
1        p1  9.99          6          64
2        p2 16.29         31           1
3        p3 19.99         30          23
4        p4  5.49         31          67
5        p5 24.49         43          51
[1] "############################### end  188 Sat Oct 20 09:33:07 2018"
[1] "############################### start  190 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00190_informalexample_5.121_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.121 of section 5.4.1 
> # (informalexample 5.121 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> library("data.table")

> cbind(as.data.table(productTable), 
       as.data.table(salesTable[,-1]))
   productID price sold_store sold_online
1:        p1  9.99          6          64
2:        p2 16.29         31           1
3:        p3 19.99         30          23
4:        p4  5.49         31          67
5:        p5 24.49         43          51
[1] "############################### end  190 Sat Oct 20 09:33:07 2018"
[1] "############################### start  192 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00192_informalexample_5.123_of_section_5.4.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.123 of section 5.4.1 
> # (informalexample 5.123 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 
> 
> library("dplyr")

> # list of data frames calling convention
> dplyr::bind_cols(list(productTable, salesTable[,-1]))
  productID price sold_store sold_online
1        p1  9.99          6          64
2        p2 16.29         31           1
3        p3 19.99         30          23
4        p4  5.49         31          67
5        p5 24.49         43          51
[1] "############################### end  192 Sat Oct 20 09:33:07 2018"
[1] "############################### start  194 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00194_informalexample_5.125_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.125 of section 5.4.2 
> # (informalexample 5.125 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> productTable <- wrapr::build_frame(
    "productID", "price" |
    "p1"       , 9.99    |
    "p3"       , 19.99   |
    "p4"       , 5.49    |
    "p5"       , 24.49   )

> salesTable <- wrapr::build_frame(
    "productID", "unitsSold" |
    "p1"       , 10          |
    "p2"       , 43          |
    "p3"       , 55          |
    "p4"       , 8           )
[1] "############################### end  194 Sat Oct 20 09:33:07 2018"
[1] "############################### start  195 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00195_informalexample_5.126_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.126 of section 5.4.2 
> # (informalexample 5.126 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> merge(productTable, salesTable, by = "productID", all.x = TRUE)
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
4        p5 24.49        NA
[1] "############################### end  195 Sat Oct 20 09:33:07 2018"
[1] "############################### start  197 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00197_informalexample_5.128_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.128 of section 5.4.2 
> # (informalexample 5.128 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("data.table")

> productTable_data.table <- as.data.table(productTable)

> salesTable_data.table <- as.data.table(salesTable)

> # index notation for join
> # idea is rows are produced for each row inside the []
> salesTable_data.table[productTable_data.table, on = "productID"]
   productID unitsSold price
1:        p1        10  9.99
2:        p3        55 19.99
3:        p4         8  5.49
4:        p5        NA 24.49
[1] "############################### end  197 Sat Oct 20 09:33:07 2018"
[1] "############################### start  199 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00199_informalexample_5.130_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.130 of section 5.4.2 
> # (informalexample 5.130 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> # data.table also overrides merge()
> merge(productTable, salesTable, by = "productID", all.x = TRUE)
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
4        p5 24.49        NA
[1] "############################### end  199 Sat Oct 20 09:33:07 2018"
[1] "############################### start  201 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00201_informalexample_5.132_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.132 of section 5.4.2 
> # (informalexample 5.132 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("data.table")

> joint_table <- productTable

> joint_table$unitsSold <- salesTable$unitsSold[match(joint_table$productID, 
                                                     salesTable$productID)]

> print(joint_table)
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
4        p5 24.49        NA
[1] "############################### end  201 Sat Oct 20 09:33:07 2018"
[1] "############################### start  203 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00203_informalexample_5.134_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.134 of section 5.4.2 
> # (informalexample 5.134 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("dplyr")

> left_join(productTable, salesTable, by="productID")
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
4        p5 24.49        NA
[1] "############################### end  203 Sat Oct 20 09:33:07 2018"
[1] "############################### start  205 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00205_informalexample_5.136_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.136 of section 5.4.2 
> # (informalexample 5.136 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> merge(productTable, salesTable, by = "productID")
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
[1] "############################### end  205 Sat Oct 20 09:33:07 2018"
[1] "############################### start  207 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00207_informalexample_5.138_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.138 of section 5.4.2 
> # (informalexample 5.138 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("data.table")

> productTable_data.table <- as.data.table(productTable)

> salesTable_data.table <- as.data.table(salesTable)

> merge(productTable, salesTable, by="productID")
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
[1] "############################### end  207 Sat Oct 20 09:33:07 2018"
[1] "############################### start  209 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00209_informalexample_5.140_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.140 of section 5.4.2 
> # (informalexample 5.140 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("dplyr")

> inner_join(productTable, salesTable, by="productID")
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
[1] "############################### end  209 Sat Oct 20 09:33:07 2018"
[1] "############################### start  211 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00211_informalexample_5.142_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.142 of section 5.4.2 
> # (informalexample 5.142 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> # note that merge orders the result by key column by default
> # use sort=FALSE to skip the sorting
> merge(productTable, salesTable, by = "productID", all=TRUE)
  productID price unitsSold
1        p1  9.99        10
2        p2    NA        43
3        p3 19.99        55
4        p4  5.49         8
5        p5 24.49        NA
[1] "############################### end  211 Sat Oct 20 09:33:07 2018"
[1] "############################### start  213 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00213_informalexample_5.144_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.144 of section 5.4.2 
> # (informalexample 5.144 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("data.table")

> productTable_data.table <- as.data.table(productTable)

> salesTable_data.table <- as.data.table(salesTable)

> merge(productTable_data.table, salesTable_data.table, 
       by="productID", all = TRUE)
   productID price unitsSold
1:        p1  9.99        10
2:        p2    NA        43
3:        p3 19.99        55
4:        p4  5.49         8
5:        p5 24.49        NA
[1] "############################### end  213 Sat Oct 20 09:33:07 2018"
[1] "############################### start  215 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00215_informalexample_5.146_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.146 of section 5.4.2 
> # (informalexample 5.146 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("dplyr")

> full_join(productTable, salesTable, by="productID")
  productID price unitsSold
1        p1  9.99        10
2        p3 19.99        55
3        p4  5.49         8
4        p5 24.49        NA
5        p2    NA        43
[1] "############################### end  215 Sat Oct 20 09:33:07 2018"
[1] "############################### start  217 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00217_informalexample_5.148_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.148 of section 5.4.2 
> # (informalexample 5.148 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> merge(productTable, salesTable, by = "productID", all.y=TRUE)
  productID price unitsSold
1        p1  9.99        10
2        p2    NA        43
3        p3 19.99        55
4        p4  5.49         8
[1] "############################### end  217 Sat Oct 20 09:33:07 2018"
[1] "############################### start  219 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00219_informalexample_5.150_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.150 of section 5.4.2 
> # (informalexample 5.150 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("data.table")

> productTable_data.table <- as.data.table(productTable)

> salesTable_data.table <- as.data.table(salesTable)

> merge(productTable_data.table, salesTable_data.table, 
       by="productID", all.y = TRUE)
   productID price unitsSold
1:        p1  9.99        10
2:        p2    NA        43
3:        p3 19.99        55
4:        p4  5.49         8
[1] "############################### end  219 Sat Oct 20 09:33:07 2018"
[1] "############################### start  221 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00221_informalexample_5.152_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.152 of section 5.4.2 
> # (informalexample 5.152 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> productTable_data.table[salesTable_data.table, 
                         on = "productID"]
   productID price unitsSold
1:        p1  9.99        10
2:        p2    NA        43
3:        p3 19.99        55
4:        p4  5.49         8
[1] "############################### end  221 Sat Oct 20 09:33:07 2018"
[1] "############################### start  223 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00223_informalexample_5.154_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.154 of section 5.4.2 
> # (informalexample 5.154 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("dplyr")

> right_join(productTable, salesTable, by="productID")
  productID price unitsSold
1        p1  9.99        10
2        p2    NA        43
3        p3 19.99        55
4        p4  5.49         8
[1] "############################### end  223 Sat Oct 20 09:33:07 2018"
[1] "############################### start  225 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00225_informalexample_5.156_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.156 of section 5.4.2 
> # (informalexample 5.156 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> library("data.table")

> quotes <- data.table(bid = c(5, 5, 7, 8),
                      ask = c(6, 6, 8, 10),
                      bid_quantity = c(100, 100, 100, 100),
                      ask_quantity = c(100, 100, 100, 100),
                      when = c(1, 2, 5, 7))

> print(quotes)
   bid ask bid_quantity ask_quantity when
1:   5   6          100          100    1
2:   5   6          100          100    2
3:   7   8          100          100    5
4:   8  10          100          100    7
[1] "############################### end  225 Sat Oct 20 09:33:07 2018"
[1] "############################### start  227 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00227_informalexample_5.158_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.158 of section 5.4.2 
> # (informalexample 5.158 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> trades <- data.table(price = c(5.5, 9),
                      quantity = c(100, 200),
                      when = c(3, 9))

> print(trades)
   price quantity when
1:   5.5      100    3
2:   9.0      200    9
[1] "############################### end  227 Sat Oct 20 09:33:07 2018"
[1] "############################### start  229 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00229_informalexample_5.160_of_section_5.4.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.160 of section 5.4.2 
> # (informalexample 5.160 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 
> 
> quotes[, quote_time := when]
   bid ask bid_quantity ask_quantity when quote_time
1:   5   6          100          100    1          1
2:   5   6          100          100    2          2
3:   7   8          100          100    5          5
4:   8  10          100          100    7          7

> quotes[trades, on = "when", roll = TRUE]
   bid ask bid_quantity ask_quantity when quote_time price quantity
1:   5   6          100          100    3          2   5.5      100
2:   8  10          100          100    9          7   9.0      200
[1] "############################### end  229 Sat Oct 20 09:33:07 2018"
[1] "############################### start  231 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00231_informalexample_5.162_of_section_5.5.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.162 of section 5.5.1 
> # (informalexample 5.162 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 
> 
> library("datasets")

> library("xts")
```

```

Attaching package: 'xts'
```

```
The following objects are masked from 'package:dplyr':

    first, last
```

```
The following objects are masked from 'package:data.table':

    first, last
```

![plot of chunk ch5ex2](figures/ch05/ch5ex2-1.pdf)

```

> # remove attributes
> seatbelts <- data.frame(Seatbelts) 

> # move the date index into a column
> seatbelts$date <- index(as.xts(Seatbelts))

> # restrict down to 1982 and 1983
> seatbelts <- seatbelts[ (seatbelts$date >= as.yearmon("Jan 1982")) &
                           (seatbelts$date <= as.yearmon("Dec 1983")),
                            , drop = FALSE]

> seatbelts$date <- as.Date(seatbelts$date)

> # mark if the seatbelt law was in effect
> seatbelts$law <- ifelse(seatbelts$law==1, "new law", "pre-law")

> # limit down to the columns we want
> seatbelts <- seatbelts[, c("date", "DriversKilled", "front", "rear", "law")]

> head(seatbelts)
          date DriversKilled front rear     law
157 1982-01-01           115   595  238 pre-law
158 1982-02-01           104   673  285 pre-law
159 1982-03-01           131   660  324 pre-law
160 1982-04-01           108   676  346 pre-law
161 1982-05-01           103   755  410 pre-law
162 1982-06-01           115   815  411 pre-law
[1] "############################### end  231 Sat Oct 20 09:33:07 2018"
[1] "############################### start  233 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00233_informalexample_5.164_of_section_5.5.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.164 of section 5.5.1 
> # (informalexample 5.164 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 
> 
> # let's give an example of the kind of graph we have in mind, using just driver deaths
> library("ggplot2")

> ggplot(seatbelts, 
        aes(x=date, y=DriversKilled, color=law)) + 
   geom_point() + 
   geom_smooth(se=FALSE) + 
   ggtitle("UK car driver deaths by month")
```

```
`geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![plot of chunk ch5ex2](figures/ch05/ch5ex2-2.pdf)

```
[1] "############################### end  233 Sat Oct 20 09:33:07 2018"
[1] "############################### start  234 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00234_informalexample_5.165_of_section_5.5.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.165 of section 5.5.1 
> # (informalexample 5.165 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 
> 
> library("data.table")

> seatbelts_data.table <- as.data.table(seatbelts)

> seatbelts_long <- 
   melt.data.table(seatbelts_data.table,
                   id.vars = NULL,
                   measure.vars = c("DriversKilled", "front", "rear"),
                   variable.name = "victim_type", 
                   value.name = "nvictims")

> head(seatbelts_long)
         date     law   victim_type nvictims
1: 1982-01-01 pre-law DriversKilled      115
2: 1982-02-01 pre-law DriversKilled      104
3: 1982-03-01 pre-law DriversKilled      131
4: 1982-04-01 pre-law DriversKilled      108
5: 1982-05-01 pre-law DriversKilled      103
6: 1982-06-01 pre-law DriversKilled      115
[1] "############################### end  234 Sat Oct 20 09:33:07 2018"
[1] "############################### start  236 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00236_informalexample_5.167_of_section_5.5.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.167 of section 5.5.1 
> # (informalexample 5.167 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 
> 
> ggplot(seatbelts_long, 
        aes(x=date, y=nvictims, color=law)) + 
   geom_point() + 
   geom_smooth(se=FALSE) + 
   facet_wrap(~victim_type, ncol=1, scale="free_y") +  
   ggtitle("UK auto fatalities by month and seating position")
```

```
`geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![plot of chunk ch5ex2](figures/ch05/ch5ex2-3.pdf)

```
[1] "############################### end  236 Sat Oct 20 09:33:07 2018"
[1] "############################### start  237 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00237_informalexample_5.168_of_section_5.5.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.168 of section 5.5.1 
> # (informalexample 5.168 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 
> 
> library("cdata")

> seatbelts_long2 <- unpivot_to_blocks(
   seatbelts, 
   nameForNewKeyColumn = "victim_type", 
   nameForNewValueColumn = "nvictims", 
   columnsToTakeFrom = c("DriversKilled", "front", "rear"))
[1] "############################### end  237 Sat Oct 20 09:33:07 2018"
[1] "############################### start  238 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00238_informalexample_5.169_of_section_5.5.1.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.169 of section 5.5.1 
> # (informalexample 5.169 of section 5.5.1)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from wide to tall form 
> 
> library("tidyr")

> seatbelts_long3 <- gather(
   seatbelts, 
   key = victim_type, 
   value = nvictims, 
   DriversKilled, front, rear)
[1] "############################### end  238 Sat Oct 20 09:33:07 2018"
[1] "############################### start  239 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00239_informalexample_5.170_of_section_5.5.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.170 of section 5.5.2 
> # (informalexample 5.170 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 
> 
> library("datasets")

> library("data.table")

> library("ggplot2")

> ChickWeight <- data.frame(ChickWeight) # get rid of attributes

> ChickWeight$Diet <- NULL # remove the diet label

> # pad names with zeros
> padz <- function(x, n=max(nchar(x))) gsub(" ", "0", formatC(x, width=n)) 

> # append "Chick" to the chick ids
> ChickWeight$Chick <- paste0("Chick", padz(as.character(ChickWeight$Chick)))

> head(ChickWeight)
  weight Time   Chick
1     42    0 Chick01
2     51    2 Chick01
3     59    4 Chick01
4     64    6 Chick01
5     76    8 Chick01
6     93   10 Chick01
[1] "############################### end  239 Sat Oct 20 09:33:07 2018"
[1] "############################### start  241 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00241_informalexample_5.172_of_section_5.5.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.172 of section 5.5.2 
> # (informalexample 5.172 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 
> 
> # aggregate count and mean weight by time
> ChickSummary <- as.data.table(ChickWeight)

> ChickSummary <- ChickSummary[, 
              .(count = .N, 
                weight = mean(weight),
                q1_weight = quantile(weight, probs = 0.25),
                q2_weight = quantile(weight, probs = 0.75)), 
              by = Time]

> head(ChickSummary)
   Time count    weight q1_weight q2_weight
1:    0    50  41.06000        41        42
2:    2    50  49.22000        48        51
3:    4    49  59.95918        57        63
4:    6    49  74.30612        68        80
5:    8    49  91.24490        83       102
6:   10    49 107.83673        93       124
[1] "############################### end  241 Sat Oct 20 09:33:07 2018"
[1] "############################### start  243 Sat Oct 20 09:33:07 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00243_informalexample_5.174_of_section_5.5.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.174 of section 5.5.2 
> # (informalexample 5.174 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 
> 
> # unpivot into tall form for plotting
> ChickSummary <- cdata::unpivot_to_blocks(
   ChickSummary,
   nameForNewKeyColumn = "measurement",
   nameForNewValueColumn = "value",
   columnsToTakeFrom = c("count", "weight"))

> # make sure we have the exac set of columns needed for plotting
> ChickSummary$q1_weight[ChickSummary$measurement=="count"] <- NA

> ChickSummary$q2_weight[ChickSummary$measurement=="count"] <- NA

> CW <- ChickWeight

> CW$measurement <- "weight"

> # plot                                      
> ggplot(ChickSummary, aes(x=Time, y=value, color=measurement)) + 
   geom_line(data = CW, aes(x=Time, y=weight, group=Chick),
             color="LightGray") +
   geom_line(size=2) + 
   geom_ribbon(aes(ymin = q1_weight, ymax = q2_weight), 
               alpha = 0.3, colour = NA) +
   facet_wrap(~measurement, ncol=1, scales = "free_y") +
   theme(legend.position = "none") +
   ylab(NULL) +
   ggtitle("Chick Weight and Count Measurements by Time",
           subtitle = "25% through 75% quartiles of weight shown shaded around mean")
```

![plot of chunk ch5ex2](figures/ch05/ch5ex2-4.pdf)

```
[1] "############################### end  243 Sat Oct 20 09:33:08 2018"
[1] "############################### start  244 Sat Oct 20 09:33:08 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00244_informalexample_5.175_of_section_5.5.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.175 of section 5.5.2 
> # (informalexample 5.175 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 
> 
> library("data.table")

> ChickWeight_wide <- dcast.data.table(
   as.data.table(ChickWeight), 
   Chick ~ Time,
   value.var = "weight")

> head(ChickWeight_wide)
     Chick  0  2  4  6  8  10  12  14  16  18  20  21
1: Chick01 42 51 59 64 76  93 106 125 149 171 199 205
2: Chick02 40 49 58 72 84 103 122 138 162 187 209 215
3: Chick03 43 39 55 67 84  99 115 138 163 187 198 202
4: Chick04 42 49 56 67 74  87 102 108 136 154 160 157
5: Chick05 41 42 48 60 79 106 141 164 197 199 220 223
6: Chick06 41 49 59 74 97 124 141 148 155 160 160 157
[1] "############################### end  244 Sat Oct 20 09:33:08 2018"
[1] "############################### start  246 Sat Oct 20 09:33:08 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00246_informalexample_5.177_of_section_5.5.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.177 of section 5.5.2 
> # (informalexample 5.177 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 
> 
> library("cdata")

> ChickWeight_wide2 <- pivot_to_rowrecs(
   ChickWeight, 
   columnToTakeKeysFrom = "Time", 
   columnToTakeValuesFrom = "weight",
   rowKeyColumns = "Chick")
[1] "############################### end  246 Sat Oct 20 09:33:08 2018"
[1] "############################### start  247 Sat Oct 20 09:33:08 2018"
[1] "#####  running  /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2work/generated/code/CodeExamples/c05_Data_Engineering_and_Data_Shaping/00247_informalexample_5.178_of_section_5.5.2.R"
[1] "#####   in directory /Users/johnmount/Documents/work/PracticalDataScienceWithR2nd/PDSwR2"

> # informalexample 5.178 of section 5.5.2 
> # (informalexample 5.178 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 
> 
> library("tidyr")

> ChickWeight_wide3 <- spread(ChickWeight, 
                             key = Time, 
                             value = weight)
[1] "############################### end  247 Sat Oct 20 09:33:08 2018"
```

