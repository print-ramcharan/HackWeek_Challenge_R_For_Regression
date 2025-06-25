# Load required libraries
library(ggplot2)

# Create folder for plots
if (!dir.exists("plots")) dir.create("plots")

# earthquake
data(attenu, package = "datasets")

model_attenu <- lm(log(accel) ~ log(dist), data = attenu)
summary(model_attenu)

p1 <- ggplot(attenu, aes(x = log(dist), y = log(accel))) +
  geom_point(color = "orange") +
  geom_smooth(method = "lm", color = "darkred", se = FALSE) +
  labs(title = "Log-Log Regression: Acceleration vs Distance",
       x = "log(Distance from Epicenter)",
       y = "log(Ground Acceleration)") +
  theme_minimal()

ggsave("plots/earthquake_regression.png", p1)

# cars
data(mtcars)

model_mtcars <- lm(mpg ~ wt + hp, data = mtcars)
summary(model_mtcars)

p2 <- ggplot(mtcars, aes(x = wt, y = mpg, color = hp)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "steelblue") +
  labs(title = "MPG vs Weight with HP as Color",
       x = "Weight",
       y = "Miles Per Gallon") +
  scale_color_gradient(low = "green", high = "red") +
  theme_minimal()

ggsave("plots/mtcars_regression.png", p2)
