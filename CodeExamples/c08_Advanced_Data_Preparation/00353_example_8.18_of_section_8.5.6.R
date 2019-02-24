# example 8.18 of section 8.5.6 
# (example 8.18 of section 8.5.6)  : Advanced Data Preparation : The vtreat package in general : Splines 
# Title: Building a spline variable 

treatments <- vtreat::designTreatmentsN(
  d, 
  varlist = "x", 
  outcomename = "y", 
  customCoders = list('n.spline.num' = vtreat::spline_variable),
  codeRestriction = c("spline",
                      "clean", "isBAD"),
  verbose = FALSE)

d_treated <- vtreat::prepare(treatments, d)


ggplot(data = d_treated, mapping = aes(x = x_spline, y = y)) + 
  geom_point()

