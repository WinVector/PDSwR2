LoadPUMS\_h
================
John Mount, Win-Vector LLC
7/14/2018

Data dowloaded 4/21/2018 from:

-   <https://www.census.gov/data/developers/data-sets/acs-1year.2016.html>
-   <https://www.census.gov/programs-surveys/acs/technical-documentation/pums.html>
-   <http://www2.census.gov/programs-surveys/acs/tech_docs/pums/data_dict/PUMSDataDict16.txt>
-   <https://www2.census.gov/programs-surveys/acs/data/pums/2016/1-Year/>

This sample draws households and then matches people.

First in a `bash` shell perform the following steps:

    wget https://www2.census.gov/programs-surveys/acs/data/pums/2016/1-Year/csv_hus.zip
    md5 csv_hus.zip
    # MD5 (csv_hus.zip) = c81d4b96a95d573c1b10fc7f230d5f7a
    wget https://www2.census.gov/programs-surveys/acs/data/pums/2016/1-Year/csv_pus.zip
    md5 csv_pus.zip
    # MD5 (csv_pus.zip) = 06142320c3865620b0630d74d74181db
    wget http://www2.census.gov/programs-surveys/acs/tech_docs/pums/data_dict/PUMSDataDict16.txt
    md5 PUMSDataDict16.txt
    # MD5 (PUMSDataDict16.txt) = 56b4e8fcc7596cc8b69c9e878f2e699aunzip csv_hus.zip
    unzip csv_pus.zip
    gzip -9 ss16*.csv

Now the files are compressed comma separted files with headers:

-   `ss16husa.csv.gz`
-   `ss16husb.csv.gz`
-   `ss16pusa.csv.gz`
-   `ss16pusb.csv.gz`

Read them in and sample down.

``` r
library("readr")
library("wrswoR")

data_dict <- readRDS("data_dict.RDS")

# re-code fields
recode_PUMS_fields <- function(data, data_dict, table_name) {
  dict <- data_dict[data_dict$table == table_name, , drop = FALSE]
  for(ci in colnames(data)) {
    di <- dict[dict$field_name==ci, , drop = FALSE]
    if(nrow(di)>1) {
      matches_key <- data[[ci]] %in% di$field_keys
      if(any(matches_key)) {
        mp <- di$field_values
        names(mp) <- di$field_keys
        data[[ci]][matches_key] <- mp[data[[ci]][matches_key]]
      }
    }
  }
  data
}

wtcol <- "WGTP"




# load households
ss16husa <- read_csv("ss16husa.csv.gz",
                     col_types = cols(.default = "c"))
dim(ss16husa)
```

    ## [1] 769324    230

``` r
wtcols <- colnames(ss16husa)[grep("^wgtp", 
                                 colnames(ss16husa),
                                 ignore.case = TRUE)]
for(ci in setdiff(wtcols, wtcol)) {
  ss16husa[[ci]] <- NULL
}
ss16husb <- read_csv("ss16husb.csv.gz",
                     col_types = cols(.default = "c"))
dim(ss16husb)
```

    ## [1] 735762    230

``` r
for(ci in setdiff(wtcols, wtcol)) {
  ss16husb[[ci]] <- NULL
}
ss16hus <- rbind(ss16husa, ss16husb)
rm(list = c("ss16husa", "ss16husb"))
# draw a sample of households proportional to positive weights
wts <- pmax(0, as.numeric(ss16hus[[wtcol]]))
summary(wts)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00   41.00   72.00   90.16  116.00 1746.00

``` r
set.seed(2018)
sel <- sort(sample_int_crank(length(wts), 
                             50000, 
                             wts/sum(wts)))
ss16hus <- ss16hus[sel, , drop = FALSE]
rownames(ss16hus) <- NULL
ss16hus[[wtcol]] <- NULL
ss16hus <- recode_PUMS_fields(ss16hus, data_dict, "hus")

dim(ss16hus)
```

    ## [1] 50000   149

``` r
serialnos <- unique(ss16hus$SERIALNO)
length(serialnos)
```

    ## [1] 50000

``` r
saveRDS(as.data.frame(ss16hus),
        file = "../ss16hus_h.RDS")
rm(list = c("ss16hus"))






# load people 
ss16pusa <- read_csv("ss16pusa.csv.gz",
                     col_types = cols(.default = "c"))
dim(ss16pusa)
```

    ## [1] 1623216     284

``` r
pcols <- colnames(ss16pusa)
extra_wts <- pcols[grep("^pwgtp", pcols, ignore.case = TRUE)]
for(ci in extra_wts) {
  ss16pusa[[ci]] <- NULL
}
ss16pusa <- ss16pusa[ss16pusa$SERIALNO %in% serialnos, , drop = FALSE]
rownames(ss16pusa) <- NULL

ss16pusb <- read_csv("ss16pusb.csv.gz",
                     col_types = cols(.default = "c"))
dim(ss16pusb)
```

    ## [1] 1533271     284

``` r
for(ci in extra_wts) {
  ss16pusb[[ci]] <- NULL
}
ss16pusb <- ss16pusb[ss16pusb$SERIALNO %in% serialnos, , drop = FALSE]
rownames(ss16pusb) <- NULL

# concatinate tables together
ss16pus <- rbind(ss16pusa, ss16pusb)
rm(list = c("ss16pusa", "ss16pusb"))

rownames(ss16pus) <- NULL
dim(ss16pus)
```

    ## [1] 109696    203

``` r
ss16pus <- recode_PUMS_fields(ss16pus, data_dict, "pus")
saveRDS(as.data.frame(ss16pus),
        file = "../ss16pus_h.RDS")
rm(list = "ss16pus")
```
