ReadDataDict
================
Win-Vector LLC
4/21/2018

Convert the data dictionary into usable form.

``` r
dd <- readLines("PUMSDataDict16.txt")
```

    ## Warning in readLines("PUMSDataDict16.txt"): incomplete final line found on
    ## 'PUMSDataDict16.txt'

``` r
# get rid of any weird characaters
dd <- enc2utf8(dd)
dd <- trimws(dd, which = "right")

# skip until housing record
i <- match("HOUSING RECORD", dd)
dd <- dd[(i+1):length(dd)]

# cut off ending
i <- match("Note for both Industry and Occupation lists in Data Dictionary:", dd)
dd <- dd[1:(i-1)]

# strip out "Note:" lines
i <- grep("^Note:", dd, invert=TRUE)
dd <- dd[i]

# strip out "This line intentionally blank"
i <- grep("^This line intentionally blank", dd, invert=TRUE)

# split out housing defs and person defs
i <- match("PERSON RECORD", dd)
hdefs <- data.frame(text = dd[1:(i-1)],
                    stringsAsFactors = FALSE)
pdefs <- data.frame(text = dd[(i+1):length(dd)],
                    stringsAsFactors = FALSE)

process_block <- function(b) {
  n <- nrow(b)
  if(n<3) {
    return(NULL)
  }
  fld_name <- gsub("[[:space:]]+.*$", "", b$text[[1]])
  fld_name <- trimws(fld_name, which = "both")
  note <- trimws(b$text[[2]], which = "both")
  flds <- trimws(b$text[3:nrow(b)], which = "both")
  flds <- strsplit(flds, "[[:space:]]+")
  fld_vals <- as.character(vapply(flds, 
                                  function(fi) {
                                    paste(fi[2:length(fi)], collapse = " ")
                                  }, character(1)))
  fld_vals <- gsub("^\\.", "", fld_vals)
  fld_vals <- trimws(fld_vals, which = "both")
  fld_keys <- as.character(vapply(flds, 
                                  function(fi) {
                                    fi[[1]]
                                  }, character(1)))
  fld_keys <- trimws(fld_keys, which = "both")
  data.frame(field_name = fld_name,
             note = note,
             field_keys = fld_keys,
             field_values = fld_vals,
             stringsAsFactors = FALSE)
}

process_frame <- function(d) {
  # identify and split into blocks blocks
  d$block <- cumsum(ifelse(nchar(d$text)<=0, 1, 0))
  d <- d[nchar(d$text)>0, , drop = FALSE]
  blks <- split(d, d$block)
  blks2 <- lapply(blks, process_block)
  res <- do.call(rbind, blks2)
  rownames(res) <- NULL
  res
}

hdefs <- process_frame(hdefs)
hdefs$table <- "hus"

pdefs <- process_frame(pdefs)
pdefs$table <- "pus"

data_dict <- rbind(hdefs, pdefs)

# copy to use
saveRDS(data_dict, "data_dict.RDS")

# copy to look at
write.csv(data_dict, "../data_dict.csv", 
          row.names = FALSE, sep = ",")
```

    ## Warning in write.csv(data_dict, "../data_dict.csv", row.names = FALSE, sep
    ## = ","): attempt to set 'sep' ignored
