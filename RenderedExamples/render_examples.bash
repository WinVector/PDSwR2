

/usr/local/bin/R -e 'knitr::knit("c01_The_data_science_process.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c02_Starting_with_R_and_data.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c03_Exploring_data.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c04_Managing_data.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c05_Data_Engineering_and_Data_Shaping.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c06_Choosing_and_evaluating_models.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c07_Linear_and_logistic_regression.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c08_Advanced_Data_Preparation.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c09_Unsupervised_methods.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c10_Exploring_advanced_methods.Rmd")'
/usr/local/bin/R -e 'knitr::knit("c11_Documentation_and_deployment.Rmd")'
/usr/local/bin/R -e 'knitr::knit("x0A_Starting_with_R_and_other_tools.Rmd")'
/usr/local/bin/R -e 'knitr::knit("x0B_Important_statistical_concepts.Rmd")'

rm *.RDS
rm *.csv

