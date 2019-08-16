# informalexample 5.68 of section 5.5.2 
# (informalexample 5.68 of section 5.5.2)  : Data engineering and data shaping : Reshaping transforms : Moving data from tall to wide form 

# aggregate count and mean weight by time
ChickSummary <- as.data.table(ChickWeight)
ChickSummary <- ChickSummary[, 
             .(count = .N, 
               weight = mean(weight),
               q1_weight = quantile(weight, probs = 0.25),
               q2_weight = quantile(weight, probs = 0.75)), 
             by = Time]
head(ChickSummary)

##    Time count    weight q1_weight q2_weight
## 1:    0    50  41.06000        41        42
## 2:    2    50  49.22000        48        51
## 3:    4    49  59.95918        57        63
## 4:    6    49  74.30612        68        80
## 5:    8    49  91.24490        83       102
## 6:   10    49 107.83673        93       124

