library(tidyverse)

data <- read.csv("Data/owid-covid-data.csv")

data$date <- as.Date(data$date)

data_india <- data %>%
  filter(location == "India" & !is.na(total_cases) & !is.na(total_deaths) & !is.na(total_vaccinations)) %>%
  select(date, total_cases, total_deaths, total_vaccinations)

p1 <- ggplot(data_india, aes(x = date, y = total_cases)) +
  geom_line(color = "blue") +
  labs(title = "Total COVID-19 Cases in India", x = "Date", y = "Total Cases")

p2 <- ggplot(data_india, aes(x = date, y = total_deaths)) +
  geom_line(color = "red") +
  labs(title = "Total COVID-19 Deaths in India", x = "Date", y = "Total Deaths")

p3 <- ggplot(data_india, aes(x = date, y = total_vaccinations)) +
  geom_line(color = "green") +
  labs(title = "Total COVID-19 Vaccinations in India", x = "Date", y = "Total Vaccinations")

ggsave("Total_Cases_India.png", plot = p1, width = 8, height = 5, dpi = 300)
ggsave("Total_Deaths_India.png", plot = p2, width = 8, height = 5, dpi = 300)
ggsave("Total_Vaccinations_India.png", plot = p3, width = 8, height = 5, dpi = 300)
