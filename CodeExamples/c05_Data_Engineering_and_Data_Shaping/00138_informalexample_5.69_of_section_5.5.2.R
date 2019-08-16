# informalexample 5.69 of section 5.5.2 
# (informalexample 5.69 of section 5.5.2)  : Data engineering and data shaping : Reshaping transforms : Moving data from tall to wide form 

library("ggplot2")

ChickSummary <- cdata::unpivot_to_blocks(                              	# Note: 1 
  ChickSummary,
  nameForNewKeyColumn = "measurement",
  nameForNewValueColumn = "value",
  columnsToTakeFrom = c("count", "weight"))

ChickSummary$q1_weight[ChickSummary$measurement=="count"] <- NA    	# Note: 2 
ChickSummary$q2_weight[ChickSummary$measurement=="count"] <- NA
CW <- ChickWeight
CW$measurement <- "weight"

ggplot(ChickSummary, aes(x = Time, y = value, color = measurement)) +   	# Note: 3 
  geom_line(data = CW, aes(x = Time, y = weight, group = Chick),
            color="LightGray") +
  geom_line(size=2) + 
  geom_ribbon(aes(ymin = q1_weight, ymax = q2_weight), 
              alpha = 0.3, colour = NA) +
  facet_wrap(~measurement, ncol=1, scales = "free_y") +
  theme(legend.position = "none") +
  ylab(NULL) +
  ggtitle("Chick Weight and Count Measurements by Time",
          subtitle = "25% through 75% quartiles of weight shown shaded around mean")

# Note 1: 
#   Unpivot into tall form for plotting. 

# Note 2: 
#   Make sure we have the exact set of columns needed for plotting. 

# Note 3: 
#   Make the plot. 

