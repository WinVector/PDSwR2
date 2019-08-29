# informalexample 5.72 of section 5.5.2 
# (informalexample 5.72 of section 5.5.2)  : Data engineering and data shaping : Reshaping transforms : Moving data from tall to wide form 

library("tidyr")

ChickWeight_wide1 <- spread(ChickWeight, 
                            key = Time, 
                            value = weight)

head(ChickWeight_wide1)

##     Chick  0  2  4  6  8  10  12  14  16  18  20  21
## 1 Chick01 42 51 59 64 76  93 106 125 149 171 199 205
## 2 Chick02 40 49 58 72 84 103 122 138 162 187 209 215
## 3 Chick03 43 39 55 67 84  99 115 138 163 187 198 202
## 4 Chick04 42 49 56 67 74  87 102 108 136 154 160 157
## 5 Chick05 41 42 48 60 79 106 141 164 197 199 220 223
## 6 Chick06 41 49 59 74 97 124 141 148 155 160 160 157

