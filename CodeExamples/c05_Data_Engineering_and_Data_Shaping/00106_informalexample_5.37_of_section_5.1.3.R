# informalexample 5.37 of section 5.1.3 
# (informalexample 5.37 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("data.table")

# make new data.table example
as.data.table(data)[
  order(-x, -y), .(y = y, running_y_sum = cumsum(y)), by = "x"]
##    x y running_y_sum
## 1: 1 1             1
## 2: 1 1             2
## 3: 1 0             2
## 4: 0 1             1
## 5: 0 0             1
## 6: 0 0             1

# in-place data.table example
DT_dat <- as.data.table(data)
DT_dat[order(-x, -y), running_y_sum := cumsum(y), by = "x"]
print(DT_dat)
##    x y running_y_sum
## 1: 1 1             1
## 2: 0 0             1
## 3: 1 0             2
## 4: 0 1             1
## 5: 0 0             1
## 6: 1 1             2

