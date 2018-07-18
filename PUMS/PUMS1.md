PUMS1
================
Win-Vector LLC
4/26/2018

``` r
library("DBI")
library("dplyr") 
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library("rquery")
```

    ## Loading required package: wrapr

``` r
db <- dbConnect(RSQLite::SQLite(), ":memory:")  
dbWriteTable(db, "dpus", readRDS("ss16pus.RDS"))    
dbWriteTable(db, "dhus", readRDS("ss16hus.RDS"))


dbGetQuery(db, "SELECT * FROM dpus LIMIT 5")
```

    ##   RT  SERIALNO SPORDER  PUMA         ST  ADJINC AGEP              CIT
    ## 1  P 000000338      03 02701 Alabama/AL 1007588   06 Born in the U.S.
    ## 2  P 000000338      05 02701 Alabama/AL 1007588   08 Born in the U.S.
    ## 3  P 000000343      03 01400 Alabama/AL 1007588   12 Born in the U.S.
    ## 4  P 000000539      04 01400 Alabama/AL 1007588   11 Born in the U.S.
    ## 5  P 000002284      02 00600 Alabama/AL 1007588   08 Born in the U.S.
    ##   CITWP  COW DDRS DEAR DEYE DOUT DPHY DRAT DRATX DREM  ENG  FER  GCL  GCM
    ## 1  <NA> <NA>   No   No   No <NA>   No <NA>  <NA>   No <NA> <NA> <NA> <NA>
    ## 2  <NA> <NA>   No   No   No <NA>   No <NA>  <NA>   No <NA> <NA> <NA> <NA>
    ## 3  <NA> <NA>   No   No   No <NA>   No <NA>  <NA>  Yes <NA> <NA> <NA> <NA>
    ## 4  <NA> <NA>   No   No   No <NA>   No <NA>  <NA>  Yes <NA> <NA> <NA> <NA>
    ## 5  <NA> <NA>   No   No   No <NA>   No <NA>  <NA>   No <NA> <NA> <NA> <NA>
    ##    GCR HINS1 HINS2 HINS3 HINS4 HINS5 HINS6 HINS7 INTP JWMNP JWRIP JWTR
    ## 1 <NA>    No    No    No   Yes    No    No    No <NA>  <NA>  <NA> <NA>
    ## 2 <NA>    No    No    No   Yes    No    No    No <NA>  <NA>  <NA> <NA>
    ## 3 <NA>    No    No    No   Yes    No    No    No <NA>  <NA>  <NA> <NA>
    ## 4 <NA>    No    No    No   Yes    No    No    No <NA>  <NA>  <NA> <NA>
    ## 5 <NA>   Yes    No    No    No    No    No    No <NA>  <NA>  <NA> <NA>
    ##   LANP                    LANX                                 MAR MARHD
    ## 1 <NA> No, speaks only English Never married or under 15 years old  <NA>
    ## 2 <NA> No, speaks only English Never married or under 15 years old  <NA>
    ## 3 <NA> No, speaks only English Never married or under 15 years old  <NA>
    ## 4 <NA> No, speaks only English Never married or under 15 years old  <NA>
    ## 5 <NA> No, speaks only English Never married or under 15 years old  <NA>
    ##   MARHM MARHT MARHW MARHYP                         MIG  MIL MLPA MLPB
    ## 1  <NA>  <NA>  <NA>   <NA> Yes, same house (nonmovers) <NA> <NA> <NA>
    ## 2  <NA>  <NA>  <NA>   <NA> Yes, same house (nonmovers) <NA> <NA> <NA>
    ## 3  <NA>  <NA>  <NA>   <NA> Yes, same house (nonmovers) <NA> <NA> <NA>
    ## 4  <NA>  <NA>  <NA>   <NA> Yes, same house (nonmovers) <NA> <NA> <NA>
    ## 5  <NA>  <NA>  <NA>   <NA> Yes, same house (nonmovers) <NA> <NA> <NA>
    ##   MLPCD MLPE MLPFG MLPH MLPI MLPJ MLPK NWAB NWAV NWLA NWLK NWRE  OIP  PAP
    ## 1  <NA> <NA>  <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 2  <NA> <NA>  <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 3  <NA> <NA>  <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 4  <NA> <NA>  <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 5  <NA> <NA>  <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ##                         RELP RETP                                  SCH
    ## 1 Biological son or daughter <NA> Yes, public school or public college
    ## 2    Stepson or stepdaughter <NA> Yes, public school or public college
    ## 3 Biological son or daughter <NA> Yes, public school or public college
    ## 4 Biological son or daughter <NA> Yes, public school or public college
    ## 5             Other relative <NA> Yes, public school or public college
    ##      SCHG         SCHL SEMP    SEX SSIP  SSP WAGP WKHP  WKL  WKW  WRK YOEP
    ## 1 Grade 1 Kindergarten <NA> Female <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 2 Grade 2      Grade 1 <NA> Female <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 3 Grade 6      Grade 5 <NA> Female <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 4 Grade 4      Grade 4 <NA>   Male <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ## 5 Grade 1 Kindergarten <NA>   Male <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
    ##            ANC            ANC1P        ANC2P DECADE                  DIS
    ## 1       Single African American Not reported   <NA> Without a disability
    ## 2       Single African American Not reported   <NA> Without a disability
    ## 3     Multiple African American        Irish   <NA>    With a disability
    ## 4 Not reported     Not reported Not reported   <NA>    With a disability
    ## 5 Not reported     Not reported Not reported   <NA> Without a disability
    ##   DRIVESP                         ESP  ESR FHICOVP FOD1P FOD2P
    ## 1    <NA> Both parents in labor force <NA>      No  <NA>  <NA>
    ## 2    <NA> Both parents in labor force <NA>      No  <NA>  <NA>
    ## 3    <NA>   Mother in the labor force <NA>      No  <NA>  <NA>
    ## 4    <NA> Both parents in labor force <NA>      No  <NA>  <NA>
    ## 5    <NA>                        <NA> <NA>     Yes  <NA>  <NA>
    ##                            HICOV                        HISP INDP JWAP
    ## 1 With health insurance coverage Not Spanish/Hispanic/Latino <NA> <NA>
    ## 2 With health insurance coverage Not Spanish/Hispanic/Latino <NA> <NA>
    ## 3 With health insurance coverage Not Spanish/Hispanic/Latino <NA> <NA>
    ## 4 With health insurance coverage Not Spanish/Hispanic/Latino <NA> <NA>
    ## 5 With health insurance coverage Not Spanish/Hispanic/Latino <NA> <NA>
    ##   JWDP MIGPUMA MIGSP  MSP NAICSP NATIVITY
    ## 1 <NA>    <NA>  <NA> <NA>   <NA>   Native
    ## 2 <NA>    <NA>  <NA> <NA>   <NA>   Native
    ## 3 <NA>    <NA>  <NA> <NA>   <NA>   Native
    ## 4 <NA>    <NA>  <NA> <NA>   <NA>   Native
    ## 5 <NA>    <NA>  <NA> <NA>   <NA>   Native
    ##                                            NOP               OC OCCP PAOC
    ## 1 Living with two parents: Both parents NATIVE              Yes <NA> <NA>
    ## 2 Living with two parents: Both parents NATIVE              Yes <NA> <NA>
    ## 3       Living with mother only: Mother NATIVE              Yes <NA> <NA>
    ## 4 Living with two parents: Both parents NATIVE              Yes <NA> <NA>
    ## 5                                         <NA> No (includes GQ) <NA> <NA>
    ##   PERNP PINCP       POBP POVPIP POWPUMA POWSP
    ## 1  <NA>  <NA> Alabama/AL    158    <NA>  <NA>
    ## 2  <NA>  <NA> Alabama/AL    158    <NA>  <NA>
    ## 3  <NA>  <NA> Alabama/AL    072    <NA>  <NA>
    ## 4  <NA>  <NA> Alabama/AL    003    <NA>  <NA>
    ## 5  <NA>  <NA> Alabama/AL    079    <NA>  <NA>
    ##                                     PRIVCOV                         PUBCOV
    ## 1 Without private health insurance coverage    With public health coverage
    ## 2 Without private health insurance coverage    With public health coverage
    ## 3 Without private health insurance coverage    With public health coverage
    ## 4 Without private health insurance coverage    With public health coverage
    ## 5    With private health insurance coverage Without public health coverage
    ##                  QTRBIR                           RAC1P
    ## 1    April through June Black or African American alone
    ## 2 January through March Black or African American alone
    ## 3    April through June               Two or More Races
    ## 4 January through March                     White alone
    ## 5    April through June                     White alone
    ##                             RAC2P                            RAC3P RACAIAN
    ## 1 Black or African American alone  Black or African American alone      No
    ## 2 Black or African American alone  Black or African American alone      No
    ## 3               Two or More Races White; Black or African American      No
    ## 4                     White alone                      White alone      No
    ## 5                     White alone                      White alone      No
    ##   RACASN RACBLK RACNH RACNUM RACPI RACSOR RACWHT  RC SCIENGP SCIENGRLP
    ## 1     No    Yes    No      1    No     No     No Yes    <NA>      <NA>
    ## 2     No    Yes    No      1    No     No     No Yes    <NA>      <NA>
    ## 3     No    Yes    No      2    No     No    Yes Yes    <NA>      <NA>
    ## 4     No     No    No      1    No     No    Yes Yes    <NA>      <NA>
    ## 5     No     No    No      1    No     No    Yes Yes    <NA>      <NA>
    ##    SFN  SFR SOCP  VPS                     WAOB FAGEP FANCP FCITP FCITWP
    ## 1 <NA> <NA> <NA> <NA> US state (POB = 001-059)    No    No    No     No
    ## 2 <NA> <NA> <NA> <NA> US state (POB = 001-059)    No    No    No     No
    ## 3 <NA> <NA> <NA> <NA> US state (POB = 001-059)    No    No    No     No
    ## 4 <NA> <NA> <NA> <NA> US state (POB = 001-059)    No    No    No     No
    ## 5 <NA> <NA> <NA> <NA> US state (POB = 001-059)    No    No    No     No
    ##   FCOWP FDDRSP FDEARP FDEYEP FDISP FDOUTP FDPHYP FDRATP FDRATXP FDREMP
    ## 1    No     No     No     No    No     No     No     No      No     No
    ## 2    No     No     No     No    No     No     No     No      No     No
    ## 3    No     No     No     No    No     No     No     No      No     No
    ## 4    No     No     No     No    No     No     No     No      No     No
    ## 5    No    Yes    Yes    Yes   Yes     No    Yes     No      No    Yes
    ##   FENGP FESRP FFERP FFODP FGCLP FGCMP FGCRP FHINS1P FHINS2P FHINS3C
    ## 1    No    No    No    No    No    No    No      No      No    <NA>
    ## 2    No    No    No    No    No    No    No      No      No    <NA>
    ## 3    No    No    No    No    No    No    No      No      No    <NA>
    ## 4    No    No    No    No    No    No    No      No      No    <NA>
    ## 5    No    No    No    No    No    No    No     Yes     Yes    <NA>
    ##   FHINS3P FHINS4C FHINS4P FHINS5C FHINS5P FHINS6P FHINS7P FHISP FINDP
    ## 1      No      No      No    <NA>      No      No      No    No    No
    ## 2      No      No      No    <NA>      No      No      No    No    No
    ## 3      No      No      No    <NA>      No      No      No    No    No
    ## 4      No      No      No    <NA>      No      No      No    No    No
    ## 5     Yes    <NA>     Yes    <NA>     Yes     Yes     Yes    No    No
    ##   FINTP FJWDP FJWMNP FJWRIP FJWTRP FLANP FLANXP FMARHDP FMARHMP FMARHTP
    ## 1    No    No     No     No     No    No     No      No      No      No
    ## 2    No    No     No     No     No    No     No      No      No      No
    ## 3    No    No     No     No     No    No     No      No      No      No
    ## 4    No    No     No     No     No    No     No      No      No      No
    ## 5    No    No     No     No     No    No     No      No      No      No
    ##   FMARHWP FMARHYP FMARP FMIGP FMIGSP FMILPP FMILSP FOCCP FOIP FPAP FPERNP
    ## 1      No      No    No    No     No     No     No    No   No   No     No
    ## 2      No      No    No    No     No     No     No    No   No   No     No
    ## 3      No      No    No    No     No     No     No    No   No   No     No
    ## 4      No      No    No    No     No     No     No    No   No   No     No
    ## 5      No      No    No    No     No     No     No    No   No   No     No
    ##   FPINCP FPOBP FPOWSP FPRIVCOVP FPUBCOVP FRACP FRELP FRETP FSCHGP FSCHLP
    ## 1     No    No     No        No       No    No    No    No     No     No
    ## 2     No    No     No        No       No    No    No    No     No     No
    ## 3     No    No     No        No       No    No    No    No     No     No
    ## 4     No    No     No        No       No    No    No    No     No     No
    ## 5     No    No     No       Yes      Yes    No    No    No     No     No
    ##   FSCHP FSEMP FSEXP FSSIP FSSP FWAGP FWKHP FWKLP FWKWP FWRKP FYOEP
    ## 1    No    No    No    No   No    No    No    No    No    No    No
    ## 2    No    No    No    No   No    No    No    No    No    No    No
    ## 3    No    No    No    No   No    No    No    No    No    No    No
    ## 4    No    No    No    No   No    No    No    No    No    No    No
    ## 5    No    No    No    No   No    No    No    No    No    No    No

``` r
dpus <- tbl(db, "dpus") 
dhus <- tbl(db, "dhus")

# print(dpus)   
# glimpse(dpus)

# view(rsummary(db, "dpus")) 




dpus <- dbReadTable(db, "dpus") 

dpus <- dpus[, c("AGEP", "COW", "ESR",  "PERNP", 
                 "PINCP","SCHL", "SEX", "WKHP")]

                 
for(ci in c("AGEP", "PERNP", "PINCP", "WKHP")) {    
  dpus[[ci]] <- as.numeric(dpus[[ci]])
}
```

    ## Warning: NAs introduced by coercion

    ## Warning: NAs introduced by coercion

``` r
dpus$COW <- strtrim(dpus$COW, 50) 

# str(dpus) 




target_emp_levs <- c(  
  "Employee of a private for-profit company or busine",
  "Employee of a private not-for-profit, tax-exempt, ",
  "Federal government employee",                    
  "Local government employee (city, county, etc.)",   
  "Self-employed in own incorporated business, profes",
  "Self-employed in own not incorporated business, pr",
  "State government employee")


complete <- complete.cases(dpus) 

stdworker <- with(dpus,  
                  (PINCP>1000) & 
                    (ESR=="Civilian employed, at work") & 
                    (PINCP<=250000) & 
                    (PERNP>1000) & (PERNP<=250000) & 
                    (WKHP>=30) & 
                    (AGEP>=18) & (AGEP<=65) & 
                    (COW %in% target_emp_levs))
                    
dpus <- dpus[complete & stdworker, , drop = FALSE] 

no_advanced_degree <- is.na(dpus$SCHL) |  
  (!(dpus$SCHL %in% c("Associate's degree",
                      "Bachelor's degree",
                      "Doctorate degree",
                      "Master's degree",
                      "Professional degree beyond a bachelor's degree")))
dpus$SCHL[no_advanced_degree] <- "No Advanced Degree"

dpus$SCHL <- relevel(factor(dpus$SCHL),     
                     "No Advanced Degree")                
dpus$COW <- relevel(factor(dpus$COW), 
                    target_emp_levs[[1]])
dpus$ESR <- relevel(factor(dpus$ESR), 
                    "Civilian employed, at work")
dpus$SEX <- relevel(factor(dpus$SEX), 
                    "Male")
                    
saveRDS(dpus, "dpus_std_employee.RDS")  
                    
summary(dpus) 
```

    ##       AGEP      
    ##  Min.   :18.00  
    ##  1st Qu.:31.00  
    ##  Median :41.00  
    ##  Mean   :41.34  
    ##  3rd Qu.:52.00  
    ##  Max.   :65.00  
    ##                 
    ##                                                  COW       
    ##  Employee of a private for-profit company or busine:26101  
    ##  Employee of a private not-for-profit, tax-exempt, : 2877  
    ##  Federal government employee                       :  978  
    ##  Local government employee (city, county, etc.)    : 2589  
    ##  Self-employed in own incorporated business, profes: 1180  
    ##  Self-employed in own not incorporated business, pr: 1643  
    ##  State government employee                         : 1743  
    ##                          ESR            PERNP            PINCP       
    ##  Civilian employed, at work:37111   Min.   :  1100   Min.   :  1100  
    ##                                     1st Qu.: 24000   1st Qu.: 25000  
    ##                                     Median : 40000   Median : 40000  
    ##                                     Mean   : 50268   Mean   : 51584  
    ##                                     3rd Qu.: 65000   3rd Qu.: 66000  
    ##                                     Max.   :250000   Max.   :250000  
    ##                                                                      
    ##                                              SCHL           SEX       
    ##  No Advanced Degree                            :20461   Male  :20125  
    ##  Associate's degree                            : 3670   Female:16986  
    ##  Bachelor's degree                             : 8407                 
    ##  Doctorate degree                              :  478                 
    ##  Master's degree                               : 3386                 
    ##  Professional degree beyond a bachelor's degree:  709                 
    ##                                                                       
    ##       WKHP      
    ##  Min.   :30.00  
    ##  1st Qu.:40.00  
    ##  Median :40.00  
    ##  Mean   :42.66  
    ##  3rd Qu.:45.00  
    ##  Max.   :98.00  
    ## 

``` r
plt <- WVPlots::ScatterHist(
  dpus, "AGEP", "PINCP",
  "Expected income (PINCP) as function age (AGEP)",
  smoothmethod = "lm",
  point_alpha = 0.025)
```

![](PUMS1_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
print(plt)
```

    ## TableGrob (3 x 2) "arrange": 5 grobs
    ##   z     cells    name                grob
    ## 1 1 (2-2,1-1) arrange      gtable[layout]
    ## 2 2 (2-2,2-2) arrange      gtable[layout]
    ## 3 3 (3-3,1-1) arrange      gtable[layout]
    ## 4 4 (3-3,2-2) arrange      gtable[layout]
    ## 5 5 (1-1,1-2) arrange text[GRID.text.160]

``` r
DBI::dbDisconnect(db)
```
