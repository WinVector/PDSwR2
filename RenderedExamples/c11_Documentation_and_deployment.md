---
output: github_document
---



00365_informalexample_11.1_of_section_11.2.1.R



```r
# informalexample 11.1 of section 11.2.1 
# (informalexample 11.1 of section 11.2.1)  : Documentation and deployment : Using R markdown to produce milestone documentation : What is R markdown? 

rmarkdown::render("../Buzz/Buzz_score_example.Rmd", rmarkdown::html_document())
```

```
## 
## 
## processing file: Buzz_score_example.Rmd
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |...........                                                      |  17%
##   ordinary text without R code
## 
##   |                                                                         |......................                                           |  33%
## label: unnamed-chunk-1 (with options) 
## List of 1
##  $ include: logi FALSE
## 
##   |                                                                         |................................                                 |  50%
##   ordinary text without R code
## 
##   |                                                                         |...........................................                      |  67%
## label: unnamed-chunk-2
##   |                                                                         |......................................................           |  83%
##   ordinary text without R code
## 
##   |                                                                         |.................................................................| 100%
## label: unnamed-chunk-3
```

```
## output file: Buzz_score_example.knit.md
```

```
## /Users/johnmount/anaconda3/bin/pandoc +RTS -K512m -RTS Buzz_score_example.utf8.md --to html4 --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash+smart --output Buzz_score_example.html --email-obfuscation none --self-contained --standalone --section-divs --template /Library/Frameworks/R.framework/Versions/3.6/Resources/library/rmarkdown/rmd/h/default.html --no-highlight --variable highlightjs=1 --variable 'theme:bootstrap' --include-in-header /var/folders/7q/h_jp2vj131g5799gfnpzhdp80000gn/T//Rtmp4pFWA9/rmarkdown-str139a06349b128.html --mathjax --variable 'mathjax-url:https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
```

```
## 
## Output created: Buzz_score_example.html
```




00369_example_11.5_of_section_11.3.1.R



```r
# example 11.5 of section 11.3.1 
# (example 11.5 of section 11.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
# Title: Example code comment 

#' Return the pseudo logarithm, base 10.
#'
#' Return the pseudo logarithm (base 10) of x, which is close to
#' sign(x)*log10(abs(x)) for x such that abs(x) is large
#' and doesn't "blow up" near zero.  Useful
#' for transforming wide-range variables that may be negative
#' (like profit/loss).
#'
#' See: \url{http://www.win-vector.com/blog/2012/03/modeling-trick-the-signed-pseudo-logarithm/}
#'
#' NB: This transform has the undesirable property of making most
#' signed distributions appear bi-modal around the origin, no matter
#' what the underlying distribution really looks like.
#' The argument x is assumed be numeric and can be a vector.
#'
#' @param x numeric vector
#' @return pseudo logarithm, base 10 of x
#'
#' @examples
#'
#' pseudoLog10(c(-5, 0, 5))
#' # should be: [1] -0.7153834  0.0000000  0.7153834
#'
#' @export
#'
pseudoLog10 <- function(x) {
  asinh(x / 2) / log(10)
}
```


