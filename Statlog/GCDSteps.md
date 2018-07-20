GCDSteps
================

``` r
# From: http://archive.ics.uci.edu/ml/datasets/Statlog+(German+Credit+Data)
d <- read.table('german.data',
                sep  =  " ",
                stringsAsFactors  =  FALSE, header  =  FALSE)

colnames(d) <- c('Status_of_existing_checking_account', 'Duration_in_month',
                 'Credit_history', 'Purpose', 'Credit_amount', 'Savings_account_bonds', 
                 'Present_employment_since',
                 'Installment_rate_in_percentage_of_disposable_income',
                 'Personal_status_and_sex', 'Other_debtors_guarantors',
                 'Present_residence_since', 'Property', 'Age_in_years',
                 'Other_installment_plans', 'Housing',
                 'Number_of_existing_credits_at_this_bank', 'Job',
                 'Number_of_people_being_liable_to_provide_maintenance_for',
                 'Telephone', 'foreign_worker', 'Good_Loan')
str(d)
```

    ## 'data.frame':    1000 obs. of  21 variables:
    ##  $ Status_of_existing_checking_account                     : chr  "A11" "A12" "A14" "A11" ...
    ##  $ Duration_in_month                                       : int  6 48 12 42 24 36 24 36 12 30 ...
    ##  $ Credit_history                                          : chr  "A34" "A32" "A34" "A32" ...
    ##  $ Purpose                                                 : chr  "A43" "A43" "A46" "A42" ...
    ##  $ Credit_amount                                           : int  1169 5951 2096 7882 4870 9055 2835 6948 3059 5234 ...
    ##  $ Savings_account_bonds                                   : chr  "A65" "A61" "A61" "A61" ...
    ##  $ Present_employment_since                                : chr  "A75" "A73" "A74" "A74" ...
    ##  $ Installment_rate_in_percentage_of_disposable_income     : int  4 2 2 2 3 2 3 2 2 4 ...
    ##  $ Personal_status_and_sex                                 : chr  "A93" "A92" "A93" "A93" ...
    ##  $ Other_debtors_guarantors                                : chr  "A101" "A101" "A101" "A103" ...
    ##  $ Present_residence_since                                 : int  4 2 3 4 4 4 4 2 4 2 ...
    ##  $ Property                                                : chr  "A121" "A121" "A121" "A122" ...
    ##  $ Age_in_years                                            : int  67 22 49 45 53 35 53 35 61 28 ...
    ##  $ Other_installment_plans                                 : chr  "A143" "A143" "A143" "A143" ...
    ##  $ Housing                                                 : chr  "A152" "A152" "A152" "A153" ...
    ##  $ Number_of_existing_credits_at_this_bank                 : int  2 1 1 1 2 1 1 1 1 2 ...
    ##  $ Job                                                     : chr  "A173" "A173" "A172" "A173" ...
    ##  $ Number_of_people_being_liable_to_provide_maintenance_for: int  1 1 2 2 2 2 1 1 1 1 ...
    ##  $ Telephone                                               : chr  "A192" "A191" "A191" "A191" ...
    ##  $ foreign_worker                                          : chr  "A201" "A201" "A201" "A201" ...
    ##  $ Good_Loan                                               : int  1 2 1 1 2 1 1 1 1 2 ...

``` r
d$Good_Loan <- as.factor(ifelse(d$Good_Loan == 1, 'GoodLoan', 'BadLoan'))

mapping <- c('A11'  =  '... < 0 DM',
             'A12'  =  '0 < =  ... < 200 DM',
             'A13'  =  '... > =  200 DM / salary assignments for at least 1 year',
             'A14'  =  'no checking account',
             'A30'  =  'no credits taken/all credits paid back duly',
             'A31'  =  'all credits at this bank paid back duly',
             'A32'  =  'existing credits paid back duly till now',
             'A33'  =  'delay in paying off in the past',
             'A34'  =  'critical account/other credits existing (not at this bank)',
             'A40'  =  'car (new)',
             'A41'  =  'car (used)',
             'A42'  =  'furniture/equipment',
             'A43'  =  'radio/television',
             'A44'  =  'domestic appliances',
             'A45'  =  'repairs',
             'A46'  =  'education',
             'A47'  =  '(vacation - does not exist?)',
             'A48'  =  'retraining',
             'A49'  =  'business',
             'A410'  =  'others',
             'A61'  =  '... < 100 DM',
             'A62'  =  '100 < =  ... < 500 DM',
             'A63'  =  '500 < =  ... < 1000 DM',
             'A64'  =  '.. > =  1000 DM',
             'A65'  =  'unknown/ no savings account',
             'A71'  =  'unemployed',
             'A72'  =  '... < 1 year',
             'A73'  =  '1 < =  ... < 4 years',
             'A74'  =  '4 < =  ... < 7 years',
             'A75'  =  '.. > =  7 years',
             'A91'  =  'male : divorced/separated',
             'A92'  =  'female : divorced/separated/married',
             'A93'  =  'male : single',
             'A94'  =  'male : married/widowed',
             'A95'  =  'female : single',
             'A101'  =  'none',
             'A102'  =  'co-applicant',
             'A103'  =  'guarantor',
             'A121'  =  'real estate',
             'A122'  =  'if not A121 : building society savings agreement/life insurance',
             'A123'  =  'if not A121/A122 : car or other, not in attribute 6',
             'A124'  =  'unknown / no property',
             'A141'  =  'bank',
             'A142'  =  'stores',
             'A143'  =  'none',
             'A151'  =  'rent',
             'A152'  =  'own',
             'A153'  =  'for free',
             'A171'  =  'unemployed/ unskilled - non-resident',
             'A172'  =  'unskilled - resident',
             'A173'  =  'skilled employee / official',
             'A174'  =  'management/ self-employed/highly qualified employee/ officer',
             'A191'  =  'none',
             'A192'  =  'yes, registered under the customers name',
             'A201'  =  'yes',
             'A202'  =  'no')
for(ci in colnames(d)) {
  if(is.character(d[[ci]])) {
    d[[ci]] <- as.factor(mapping[d[[ci]]])
  }
}



vars <- setdiff(colnames(d), 'Good_Loan')
creditdata <- d

saveRDS(creditdata, "creditdata.RDS")

# not part of GCD data- notional example for listing 1.3
tab1 <- as.table(matrix(data = c(50, 6, 0, 44), nrow = 2, ncol = 2))
dimnames(tab1) <- list('loan_as_pct_disposable_income' = c('LT.15pct','GT.15pct'),
                       'loan_quality_pop1' = c('goodloan', 'badloan'))
tab2 <- as.table(matrix(data = c(34,18,16,32), nrow = 2, ncol = 2))
dimnames(tab2) <- list('loan_as_pct_disposable_income' = c('LT.15pct', 'GT.15pct'),
                       'loan_quality_pop2' = c('goodloan', 'badloan'))

save(list = ls(), file = 'GCDData.RData')
```
