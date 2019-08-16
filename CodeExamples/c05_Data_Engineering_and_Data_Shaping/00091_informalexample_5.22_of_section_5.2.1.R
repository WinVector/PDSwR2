# informalexample 5.22 of section 5.2.1 
# (informalexample 5.22 of section 5.2.1)  : Data engineering and data shaping : Basic data transforms : Add new columns 

library("wrapr")                                 	# Note: 1 

airquality %.>%                                    	# Note: 2 
  transform(., date = dmy(datestr(Day, Month, 1973))) %.>%
  subset(., !is.na(Ozone), select =  c("Ozone", "date")) %.>%
  head(.)

##   Ozone       date
## 1    41 1973-05-01
## 2    36 1973-05-02
## 3    12 1973-05-03
## 4    18 1973-05-04
## 6    28 1973-05-06
## 7    23 1973-05-07

# Note 1: 
#   Attach the wrapr package to define the wrapr dot arrow pipe: %.>%. The dot arrow pipe is 
#   another R pipe and is described in the R Journal at 
#   https://journal.r-project.org/archive/2018/RJ-2018-042/index.html 

# Note 2: 
#   Run all the steps as before using transform() and subset(), adding an extra step of filtering 
#   down to rows that do not have missing Ozone values. 

