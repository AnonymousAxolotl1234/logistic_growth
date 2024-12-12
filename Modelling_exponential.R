#Script to plot exponential
library(ggplot2)

#Defining logistic function
logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}
#Defining exponential function
exponential_fun <- function(t) {
  N <- (N0 * exp(r*t))
  return(N)
}

#Setting parameters obtained from linear models for both exponential and logistic functions.
N0 <- 982.401417218
r <- 0.0100086
K <- 60000000000 #

#Plotting both functions.
ggplot() +
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun=exponential_fun, colour ='black') +
  xlim(0, 5000) +
  scale_y_continuous(trans='log10') +
  xlab("Time (min)") +
  ylab("Pop. Size") +
  theme_bw()
  
