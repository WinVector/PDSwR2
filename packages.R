
# Answer "n" to:
# Do you want to install from sources the packages which need compilation?
update.packages(ask = FALSE, checkBuilt = TRUE)

pkgs <- c(
    "DBI", "RSQLite", "WVPlots", "arules", "bitops", "caTools",
    "cdata", "data.table", "dplyr", "ggplot2", "gridExtra",
    "hexbin", "kernlab", "knitr", "mgcv", "plotly", "pwr",
    "randomForest", "readr", "readxls", "rmarkdown", "rpart",
    "rpart.plot",
    "rquery", "sigr", "sqldf", "tidyr", "vtreat", "wrapr",
    "xgboost" )
install.packages(pkgs)

   
