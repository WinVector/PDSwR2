# example 10.24 of section 10.3.1 
# (example 10.24 of section 10.3.1)  : Exploring advanced methods : Solving “inseparable” problems using support vector machines : Using a SVM to solve a problem 
# Title: SVM with a good choice of kernel 

mSVMG <- svm(class ~ x + y, data = sTrain, kernel = 'radial', type = 'nu-classification') 		# Note: 1 
sTest$predSVMG <- predict(mSVMG, newdata = sTest, type = 'response')

shading <- expand.grid(
  x = seq(-1.5, 1.5, by = 0.01),
  y = seq(-1.5, 1.5, by = 0.01))
shading$predSVMG <- predict(mSVMG, newdata = shading, type = 'response')

ggplot(mapping = aes(x = x, y = y)) +
  geom_tile(data = shading, aes(fill = predSVMG),
            show.legend = FALSE, alpha = 0.5) +
  scale_color_manual(values = c("#d95f02", "#1b9e77")) +
  scale_fill_manual(values = c("white", "#1b9e77")) +
  geom_text(data = sTest, aes(label = predSVMG), 
            size = 12) +
  geom_text(data = s,aes(label = class, color = class),
            alpha = 0.7) +
  coord_fixed() + 
  theme_bw() + 
  theme(legend.position = 'none') +
  ggtitle("radial/Gaussian kernel")

# Note 1: 
#   This time use the “radial” or Gaussian kernel, which is a nice geometric distance measure. 

