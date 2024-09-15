# Load necessary libraries
library(ggplot2)
library(wordcloud)
library(dplyr)
library(scatterplot3d)
library(reshape2)

# Load the dataset
housing_data <- read.csv("Experiment 5\\Bangalore  house data.csv")

# View the first few rows of the dataset
head(housing_data)

# Create word frequency data for 'location'
location_freq <- housing_data %>%
  count(location, sort = TRUE) %>%
  top_n(20, n)

# Create Wordcloud for top 20 locations
wordcloud(words = location_freq$location, freq = location_freq$n, min.freq = 1,
          max.words = 50, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))

# Boxplot for price vs. number of bathrooms
ggplot(housing_data, aes(x = factor(bath), y = price)) + 
  geom_boxplot(fill = "lightblue", color = "darkblue", alpha = 0.7) +
  xlab("Number of Bathrooms") + 
  ylab("Price (in Lakhs)") +
  ggtitle("Price Distribution by Number of Bathrooms") +
  theme_minimal()

# Violin plot for price vs. area type
ggplot(housing_data, aes(x = area_type, y = price)) + 
  geom_violin(fill = "purple", alpha = 0.7) +
  xlab("Area Type") + 
  ylab("Price (in Lakhs)") +
  ggtitle("Price Distribution by Area Type") +
  theme_minimal()

# Linear regression plot for price vs total_sqft
ggplot(housing_data, aes(x = total_sqft, y = price)) + 
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(x = "Total Sqft", y = "Price (in Lakhs)", title = "Linear Regression: Price vs Total Sqft") +
  theme_minimal()

# Nonlinear regression plot for price vs total_sqft using LOESS
ggplot(housing_data, aes(x = total_sqft, y = price)) + 
  geom_point(color = "green", alpha = 0.5) +
  geom_smooth(method = "loess", color = "red") +
  labs(x = "Total Sqft", y = "Price (in Lakhs)", title = "Nonlinear Regression: Price vs Total Sqft") +
  theme_minimal()

# 3D Scatter plot for price, total_sqft, and bath
scatterplot3d(housing_data$total_sqft, housing_data$bath, housing_data$price, 
              color = "blue", pch = 19,
              xlab = "Total Sqft", ylab = "Number of Bathrooms", zlab = "Price (in Lakhs)")

# Jitter plot for price vs number of balconies
ggplot(housing_data, aes(x = factor(balcony), y = price)) + 
  geom_jitter(color = "darkred", width = 0.2, alpha = 0.7) +
  xlab("Number of Balconies") + 
  ylab("Price (in Lakhs)") +
  ggtitle("Price Distribution by Number of Balconies") +
  theme_minimal()