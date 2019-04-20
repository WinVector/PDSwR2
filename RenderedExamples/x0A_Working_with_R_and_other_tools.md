
00465\_example\_A.1\_of\_section\_A.2.R

``` r
# example A.1 of section A.2 
# (example A.1 of section A.2)  : Working with R and other tools : Starting with R 
# Title: Trying a few R commands 

1
```

    ## [1] 1

``` r
## [1] 1
1/2
```

    ## [1] 0.5

``` r
## [1] 0.5
'Joe'
```

    ## [1] "Joe"

``` r
## [1] "Joe"
"Joe"
```

    ## [1] "Joe"

``` r
## [1] "Joe"
"Joe"=='Joe'
```

    ## [1] TRUE

``` r
## [1] TRUE
c()
```

    ## NULL

``` r
## NULL
is.null(c())
```

    ## [1] TRUE

``` r
## [1] TRUE
is.null(5)
```

    ## [1] FALSE

``` r
## [1] FALSE
c(1)
```

    ## [1] 1

``` r
## [1] 1
c(1,2)
```

    ## [1] 1 2

``` r
## [1] 1 2
c("Apple",'Orange')
```

    ## [1] "Apple"  "Orange"

``` r
## [1] "Apple"  "Orange"
length(c(1,2))
```

    ## [1] 2

``` r
## [1] 2
vec <- c(1,2)
vec
```

    ## [1] 1 2

``` r
## [1] 1 2
```

00466\_informalexample\_A.3\_of\_section\_A.2.1.R

``` r
# informalexample A.3 of section A.2.1 
# (informalexample A.3 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 

x <- 2
x < - 3
```

    ## [1] FALSE

``` r
## [1] FALSE
print(x)
```

    ## [1] 2

``` r
## [1] 2
```

00467\_example\_A.2\_of\_section\_A.2.1.R

``` r
# example A.2 of section A.2.1 
# (example A.2 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: Binding values to function arguments 

divide <- function(numerator,denominator) { numerator/denominator }
divide(1,2)
```

    ## [1] 0.5

``` r
## [1] 0.5
divide(2,1)
```

    ## [1] 2

``` r
## [1] 2
divide(denominator=2,numerator=1)
```

    ## [1] 0.5

``` r
## [1] 0.5
divide(denominator<-2,numerator<-1)  # yields 2, a wrong answer
```

    ## [1] 2

``` r
## [1] 2
```

00468\_example\_A.3\_of\_section\_A.2.1.R

``` r
# example A.3 of section A.2.1 
# (example A.3 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: Demonstrating side effects 

x<-1
good <- function() { x <- 5}
good()
print(x)
```

    ## [1] 1

``` r
## [1] 1
bad <- function() { x <<- 5}
bad()
print(x)
```

    ## [1] 5

``` r
## [1] 5
```

00469\_example\_A.4\_of\_section\_A.2.1.R

``` r
# example A.4 of section A.2.1 
# (example A.4 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: R truth tables for Boolean operators 

c(T,T,F,F) == c(T,F,T,F)
```

    ## [1]  TRUE FALSE FALSE  TRUE

``` r
## [1]  TRUE FALSE FALSE  TRUE
c(T,T,F,F) & c(T,F,T,F)
```

    ## [1]  TRUE FALSE FALSE FALSE

``` r
## [1]  TRUE FALSE FALSE FALSE
c(T,T,F,F) | c(T,F,T,F)
```

    ## [1]  TRUE  TRUE  TRUE FALSE

``` r
## [1]  TRUE  TRUE  TRUE FALSE
```

00470\_informalexample\_A.4\_of\_section\_A.2.1.R

``` r
# informalexample A.4 of section A.2.1 
# (informalexample A.4 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 

add <- function(a,b) { a + b}
add(1,2)
```

    ## [1] 3

``` r
## [1] 3
```

00471\_informalexample\_A.5\_of\_section\_A.2.1.R

``` r
# informalexample A.5 of section A.2.1 
# (informalexample A.5 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 

add(1,'fred')
```

    ## Error in a + b: non-numeric argument to binary operator

``` r
## Error in a + b : non-numeric argument to binary operator
```

00472\_example\_A.5\_of\_section\_A.2.1.R

``` r
# example A.5 of section A.2.1 
# (example A.5 of section A.2.1)  : Working with R and other tools : Starting with R : Primary features of R 
# Title: Call-by-value effect 

vec <- c(1,2)
fun <- function(v) { v[[2]]<-5; print(v)}
fun(vec)
```

    ## [1] 1 5

``` r
## [1] 1 5
print(vec)
```

    ## [1] 1 2

``` r
## [1] 1 2
```

00473\_informalexample\_A.6\_of\_section\_A.2.2.R

``` r
# informalexample A.6 of section A.2.2 
# (informalexample A.6 of section A.2.2)  : Working with R and other tools : Starting with R : Primary R data types 

vec <- c(2,3)
vec[[2]] <- 5
print(vec)
```

    ## [1] 2 5

``` r
## [1] 2 5
```

00474\_example\_A.6\_of\_section\_A.2.2.R

``` r
# example A.6 of section A.2.2 
# (example A.6 of section A.2.2)  : Working with R and other tools : Starting with R : Primary R data types 
# Title: Examples of R indexing operators 

x <- list('a'=6,b='fred')
names(x)
```

    ## [1] "a" "b"

``` r
## [1] "a" "b"
x$a
```

    ## [1] 6

``` r
## [1] 6
x$b
```

    ## [1] "fred"

``` r
## [1] "fred"
x[['a']]
```

    ## [1] 6

``` r
## $a
## [1] 6

x[c('a','a','b','b')]
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

``` r
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

00475\_example\_A.7\_of\_section\_A.2.2.R

``` r
# example A.7 of section A.2.2 
# (example A.7 of section A.2.2)  : Working with R and other tools : Starting with R : Primary R data types 
# Title: R’s treatment of unexpected factor levels 

factor('red',levels=c('red','orange'))
```

    ## [1] red
    ## Levels: red orange

``` r
## [1] red
## Levels: red orange
factor('apple',levels=c('red','orange'))
```

    ## [1] <NA>
    ## Levels: red orange

``` r
## [1] <NA>
## Levels: red orange
```

00476\_example\_A.8\_of\_section\_A.2.2.R

``` r
# example A.8 of section A.2.2 
# (example A.8 of section A.2.2)  : Working with R and other tools : Starting with R : Primary R data types 
# Title: Confirm lm() encodes new strings correctly. 

d <- data.frame(x=factor(c('a','b','c')),
                   y=c(1,2,3))
m <- lm(y~0+x,data=d)   # Note: 1 
print(predict(m,
   newdata=data.frame(x='b'))[[1]])     # Note: 2 
```

    ## [1] 2

``` r
# [1] 2
print(predict(m,
   newdata=data.frame(x=factor('b',levels=c('b'))))[[1]])   # Note: 3 
```

    ## [1] 2

``` r
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

00477\_example\_A.9\_of\_section\_A.2.3.R

``` r
# example A.9 of section A.2.3 
# (example A.9 of section A.2.3)  : Working with R and other tools : Starting with R : Loading data from HTTPS sources 
# Title: Loading UCI car data directly from GitHub using HTTPS 

require(RCurl)  # Note: 1 
```

    ## Loading required package: RCurl

    ## Warning: package 'RCurl' was built under R version 3.5.2

    ## Loading required package: bitops

``` r
urlBase <- 
  'https://raw.githubusercontent.com/WinVector/PDSwR2/master/'  # Note: 2 
mkCon <- function(nm) {     # Note: 3 
   textConnection(getURL(paste(urlBase,nm,sep='/')))
}
cars <- read.table(mkCon('../UCICar/car.data.csv'),     # Note: 4 
    sep=',',header=T,comment.char='')

# Note 1: 
#   Bring in the RCurl library for more connection 
#   methods. 

# Note 2: 
#   Form a valid HTTPS base URL for raw access to 
#   the GitHub repository. 

# Note 3: 
#   Define a function that wraps a URL path 
#   fragment into a usable HTTPS connection. 

# Note 4: 
#   Load the car data from GitHub over 
#   HTTPS. 
```

00478\_informalexample\_A.7\_of\_section\_A.3.1.R

``` r
# informalexample A.7 of section A.3.1 
# (informalexample A.7 of section A.3.1)  : Working with R and other tools : Using databases with R : TODO: new db section 

options(gsubfn.engine = "R")
```
