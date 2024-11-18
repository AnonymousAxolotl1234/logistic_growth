#Script to plot exponential
library(ggplot2)



exponential_fun <- function(t) {
  N <- (N0 * exp(r*t))
  return(N)
}

N0 <- 982.401417218 #
r <- 0.0100086#

ggplot() +
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun=exponential_fun, colour ='black') +
  xlim(0, 5000) +
  scale_y_continuous(trans='log10')
