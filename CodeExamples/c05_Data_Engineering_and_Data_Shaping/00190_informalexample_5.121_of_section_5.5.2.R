# informalexample 5.121 of section 5.5.2 
# (informalexample 5.121 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 

# aggregate count and mean weight by time
ChickSummary <- as.data.table(ChickWeight)
ChickSummary <- ChickSummary[, 
             .(count = .N, 
               weight = mean(weight),
               q1_weight = quantile(weight, probs = 0.25),
               q2_weight = quantile(weight, probs = 0.75)), 
             by = Time]
head(ChickSummary)

