# Load necessary libraries
library(ggplot2)

# Load the dataset
crime_data <- read.csv("path_to_your_file.csv")

# Summarize murders by district
murders_by_district <- aggregate(Murder ~ District, data = crime_data, sum)

# Bar chart of murders by district
ggplot(murders_by_district, aes(x = reorder(District, -Murder), y = Murder)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +  # Flip for better readability
  labs(title = "Total Murders by District", x = "District", y = "Number of Murders")

# Summarize crime types (e.g., Murder, Rape, etc.)
crime_summary <- colSums(crime_data[, c("Murder", "Rape", "Robbery")])  # You can add more crime columns

# Create a pie chart
pie(crime_summary, labels = names(crime_summary), main = "Crime Distribution by Type", col = rainbow(length(crime_summary)))

# Histogram of murders
ggplot(crime_data, aes(x = Murder)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Murders across Districts", x = "Number of Murders", y = "Frequency")

# Summarize murders by year
murders_by_year <- aggregate(Murder ~ Year, data = crime_data, sum)

# Line plot (timeline chart)
ggplot(murders_by_year, aes(x = Year, y = Murder)) +
  geom_line(color = "red", size = 1) +
  labs(title = "Murders over Time", x = "Year", y = "Number of Murders")

# Scatter plot of Murders vs Rapes
ggplot(crime_data, aes(x = Murder, y = Rape)) +
  geom_point(color = "darkgreen", size = 3) +
  labs(title = "Scatter plot of Murders vs Rapes", x = "Murders", y = "Rapes")

# Bubble plot: Murders vs Rapes, with size based on Robberies
ggplot(crime_data, aes(x = Murder, y = Rape, size = Robbery)) +
  geom_point(alpha = 0.5, color = "purple") +
  labs(title = "Bubble plot of Murders, Rapes, and Robberies", x = "Murders", y = "Rapes", size = "Robberies")

