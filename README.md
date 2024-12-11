## logistic_growth 
R scripts for a reproducible analysis of logistic growth

### QUESTION ONE
(10 points) Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used).

#### Plotting data

The first script (plot_data.R) plots the dataset from **experiment.csv**, a simulated experiment, visualising the logistic model. The number of bacteria (N) is on the y-axis, an time (t) on the x-axis. This was carried out using the ggplot2 package, which is a consistent, intuitive and visually appealing method of plotting data on R. The second plot in the script is a semi-log plot (x-axis linear, y-axis log-transferred), which shows an increasing linear relationship at early time points, while at later time points, the population size remains constant.
```
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

```
#### Figure 1. Logistic growth plot
<img width="638" alt="image" src="https://github.com/user-attachments/assets/5480a9c1-6ecb-4515-b30f-751629aac3f1">

#### Figure 2. Semi-log plot showing relationship between t and N
<img width="639" alt="image" src="https://github.com/user-attachments/assets/6b5f0ccd-9b32-4312-998c-8fea457af159">

#### Figure 3. Semi-log plot showing relationship between t and N with added colour separation between when t is small (blue) or large (red)

<img width="635" alt="image" src="https://github.com/user-attachments/assets/9e1b359e-9d48-4948-b5a8-ee5dbad5ac58">


### Fitting linear models 

The second script (fit_linear_model.R) produces two separate linear models for the semi-logged data - one where t is small, and one where t is large, in which there are two very different relationships which can easily be seen via the semi-log plot. To do this, we used the dplyr package to filter the dataset (using filter() when t is large or small).

To construct the linear models, we used the lm() function - generating a linear model using log_N as the response variable, and t as the explanatory variable. The summary() function then was used to obtain the parameter estimates for the slopes and intercepts of the two different linear models.

### Plotting our own models

The third script (plot_data_and_model.R) creates the logistic_fun function, which allows us to produce our own logistic curve, where we can change the N0, r, and K parameters, which are then superimposed onto the experiment.csv dataset. This allows us to test whether our own parameters match those from the logistic curve in the experiment.csv dataset.

### Results

##### Linear model 1 - when t is small
<img width="455" alt="image" src="https://github.com/user-attachments/assets/eadd9e74-2d42-40a6-8631-b5318b61a8a4">

This gives us the parameters for the linear model y = b + mx, where in this context:

**$` ln(N) = ln(N0) + rt `$**

Thus, ln(N0) is estimated to be 6.894 and r is estimated to be 0.0100086.
To get N0, we simply raise e to the power of 6.894, giving us 986.

##### Linear model 2 - when t is large
<img width="473" alt="image" src="https://github.com/user-attachments/assets/8a9b83a4-0b78-4b04-b78a-fec4b4ed0629">

The intercept here is K, which in this case is 6x10^10.

These parameters can be confirmed by mapping our linear function with these calculated parameters inputted (in red) over the plot of the dataset.

<img width="689" alt="image" src="https://github.com/user-attachments/assets/bb2fdd3a-d10e-4988-b4fc-e65314feedde">



### QUESTION TWO 

Under exponential growth: N(t) = N0 * e^{rt}.
Substituting in our values of N0 and r at t = 4980:

N is equal to 4.17 x 10^{24}

Under logistic growth:
=6.0 x 10^{10}, since it has already reached carrying capacity.

Therefore, under exponential growth the population size would be significantly larger than under logistic growth (14 orders of magnitude greater!)





### QUESTION THREE 

#### Figure x. Comparative plot contrasting exponential (black) and logistic (red) growth
<img width="634" alt="image" src="https://github.com/user-attachments/assets/c99b581c-6c8e-4d5f-bece-f64cf9be04bb">




