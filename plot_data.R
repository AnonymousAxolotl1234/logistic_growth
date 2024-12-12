#Script to plot the logistic growth data
library(ggplot2)
growth_data <- read.csv("experiment.csv")

#Logistic plot
ggplot(aes(t,N), data = growth_data) +
  geom_point() +
  xlab("Time (min)") +
  ylab("Pop. Size") +
  theme_bw()

#Semilog plot
ggplot(aes(t,N), data = growth_data) +
  geom_point() +
  xlab("Time (min)") +
  ylab("Pop. Size") +
  scale_y_continuous(trans='log10') +
  theme_bw()
  
#Semilog plot - distinguishing when t small or large 

growth_data$threshold <- ifelse(
  growth_data$t<=2000, 'Below', 'Above'
)

ggplot(aes(t,N, color = threshold), data = growth_data) +
  geom_point() +
  xlab("Time (min)") +
  ylab("Pop. Size") +
  scale_y_continuous(trans='log10') +
  theme_bw() +
  theme(legend.position = 'none')

