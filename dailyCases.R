library(tidyverse)

data <- read.csv("Data/owid-covid-data.csv")

data$date <- as.Date(data$date)

data_india <- data %>%
  filter(location == "India" & !is.na(total_cases)) %>%
  select(date, total_cases) %>%
  arrange(date) %>%
  mutate(daily_cases = c(NA, diff(total_cases)))

p_daily <- ggplot(data_india, aes(x = date, y = daily_cases)) +
  geom_line(color = "purple") +
  labs(title = "Daily COVID-19 Cases in India", x = "Date", y = "Daily Cases")

ggsave("Daily_Cases_India.png", plot = p_daily, width = 8, height = 5, dpi = 300)
