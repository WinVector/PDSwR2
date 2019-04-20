
00443\_informalexample\_11.1\_of\_section\_11.2.1.R

``` r
# informalexample 11.1 of section 11.2.1 
# (informalexample 11.1 of section 11.2.1)  : Documentation and deployment : Using R markdown to produce milestone documentation : What is R markdown? 

rmarkdown::render("../Buzz/Buzz_score_example.Rmd", rmarkdown::html_document())
```

    ## 
    ## 
    ## processing file: Buzz_score_example.Rmd

    ## 
      |                                                                       
      |                                                                 |   0%
      |                                                                       
      |...........                                                      |  17%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |......................                                           |  33%
    ## label: unnamed-chunk-1 (with options) 
    ## List of 1
    ##  $ include: logi FALSE
    ## 
    ## 
      |                                                                       
      |................................                                 |  50%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |...........................................                      |  67%
    ## label: unnamed-chunk-2
    ## 
      |                                                                       
      |......................................................           |  83%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                       
      |.................................................................| 100%
    ## label: unnamed-chunk-3

    ## output file: Buzz_score_example.knit.md

    ## /Applications/RStudio.app/Contents/MacOS/pandoc/pandoc +RTS -K512m -RTS Buzz_score_example.utf8.md --to html4 --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output Buzz_score_example.html --smart --email-obfuscation none --self-contained --standalone --section-divs --template /Library/Frameworks/R.framework/Versions/3.5/Resources/library/rmarkdown/rmd/h/default.html --no-highlight --variable highlightjs=1 --variable 'theme:bootstrap' --include-in-header /var/folders/7q/h_jp2vj131g5799gfnpzhdp80000gn/T//RtmpuVrPHP/rmarkdown-strf941660774e1.html --mathjax --variable 'mathjax-url:https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'

    ## 
    ## Output created: Buzz_score_example.html

00448\_example\_11.6\_of\_section\_11.3.1.R

``` r
# example 11.6 of section 11.3.1 
# (example 11.6 of section 11.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
# Title: Example code comment 

#    Return the pseudo logarithm of x, which is close to
# sign(x)*log10(abs(x)) for x such that abs(x) is large
# and doesn't "blow up" near zero.  Useful
# for transforming wide-range variables that may be negative
# (like profit/loss).
# See: http://www.win-vector.com/blog
#  /2012/03/modeling-trick-the-signed-pseudo-logarithm/
#    NB: This transform has the undesirable property of making most
# signed distributions appear bimodal around the origin, no matter
# what the underlying distribution really looks like.
# The argument x is assumed be numeric and can be a vector.
pseudoLog10 <- function(x) { asinh(x/2)/log(10) }
```

00449\_example\_11.7\_of\_section\_11.3.1.R

``` r
# example 11.7 of section 11.3.1 
# (example 11.7 of section 11.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
# Title: Useless comment 

#######################################
# Function: addone
# Author: John Mount
# Version: 1.3.11
# Location: RSource/helperFns/addone.R
# Date: 10/31/13
# Arguments: x
# Purpose: Adds one
#######################################
addone <- function(x) { x + 1 }
```

00450\_example\_11.8\_of\_section\_11.3.1.R

``` r
# example 11.8 of section 11.3.1 
# (example 11.8 of section 11.3.1)  : Documentation and deployment : Using comments and version control for running documentation : Writing effective comments 
# Title: Worse than useless comment 

# adds one
addtwo <- function(x) { x + 2 }
```

00463\_example\_11.17\_of\_section\_11.4.2.R

``` r
# example 11.17 of section 11.4.2 
# (example 11.17 of section 11.4.2)  : Documentation and deployment : Deploying models : Deploying models by export 
# Title: Exporting the random forest model 

library("randomForest")     # Note: 1 

lst <- readRDS("../Buzz/../Buzz/thRS500.RDS")   # Note: 2 
varslist <- lst$varslist
fmodel <- lst$fmodel
buzztest <- lst$buzztest
rm(list = "lst")

extractTrees <- function(rfModel) {     # Note: 3 
   ei <- function(i) {
      ti <- getTree(rfModel,k=i,labelVar=T)
      ti$nodeid <- 1:dim(ti)[[1]]
      ti$treeid <- i
      ti
   }
   nTrees <- rfModel$ntree
   do.call('rbind',sapply(1:nTrees,ei,simplify=F))
}

write.table(extractTrees(fmodel),       # Note: 4 
   file='rfmodel.tsv',
   row.names=F,
   sep='\t',
   quote=F)

# Note 1: 
#   Load the random forest library (loading the 
#   workspace doesn’t load the library). 

# Note 2: 
#   Load the saved buzz data (includes the 
#   random forest model). 

# Note 3: 
#   Define a function that joins the tree tables 
#   from the random forest getTree() method into one 
#   large table of trees. 

# Note 4: 
#   Write the table of trees as a tab-separated 
#   values table (easy for other software to 
#   read). 
```
