RCurl client example
================

In another R run the following:

    library("plumber")
    r <- plumb("plumber.R")
    r$run(port=8000)

Then that server can service queries such as the following:

``` r
library("RCurl")
```

    ## Warning: package 'RCurl' was built under R version 3.5.2

    ## Loading required package: bitops

``` r
library("jsonlite")


post_query <- function(method, args) {
  hdr <- c("Content-Type" = "application/x-www-form-urlencoded")
  resp <- postForm(
    paste0("http://localhost:8000/", method),
    .opts=list(httpheader = hdr, 
               postfields = toJSON(args)))
  fromJSON(resp)
}

data <- read.csv("buzz_sample.csv", 
                 stringsAsFactors = FALSE, 
                 strip.white = TRUE)

scores <- post_query("score_data", 
                     list(d = data))
knitr::kable(head(scores))
```

|       |       |
|------:|------:|
|  0.998|  0.002|
|  0.350|  0.650|
|  1.000|  0.000|
|  1.000|  0.000|
|  0.748|  0.252|
|  0.008|  0.992|

``` r
tab <- table(pred = scores[, 2]>0.5, truth = data$buzz)
knitr::kable(tab)
```

|       |    0|    1|
|-------|----:|----:|
| FALSE |   77|    3|
| TRUE  |    4|   16|

``` r
i = 27

post_query("score_row_i", 
           list(i = i))
```

    ##       [,1]  [,2]
    ## [1,] 0.634 0.366

``` r
post_query("show_row_i_col", 
           list(i = i, 
                col = "num.displays_01"))
```

    ## [1] 1781

``` r
post_query("score_row_i_modified", 
           list(i = i, 
                col = "num.displays_01", 
                newval = 0))
```

    ##       [,1]  [,2]
    ## [1,] 0.646 0.354
