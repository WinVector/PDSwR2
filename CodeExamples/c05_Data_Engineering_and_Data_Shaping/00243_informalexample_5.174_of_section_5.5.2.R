# informalexample 5.174 of section 5.5.2 
# (informalexample 5.174 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 

# unpivot into tall form for plotting
ChickSummary <- cdata::unpivot_to_blocks(
  ChickSummary,
  nameForNewKeyColumn = "measurement",
  nameForNewValueColumn = "value",
  columnsToTakeFrom = c("count", "weight"))

# make sure we have the exac set of columns needed for plotting
ChickSummary$q1_weight[ChickSummary$measurement=="count"] <- NA
ChickSummary$q2_weight[ChickSummary$measurement=="count"] <- NA
CW <- ChickWeight
CW$measurement <- "weight"

# plot                                      
ggplot(ChickSummary, aes(x=Time, y=value, color=measurement)) + 
  geom_line(data = CW, aes(x=Time, y=weight, group=Chick),
            color="LightGray") +
  geom_line(size=2) + 
  geom_ribbon(aes(ymin = q1_weight, ymax = q2_weight), 
              alpha = 0.3, colour = NA) +
  facet_wrap(~measurement, ncol=1, scales = "free_y") +
  theme(legend.position = "none") +
  ylab(NULL) +
  ggtitle("Chick Weight and Count Measurements by Time",
          subtitle = "25% through 75% quartiles of weight shown shaded around mean")

