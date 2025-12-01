# Load necessary libraries for data analysis
library(dplyr)
library(readr)
library(ggplot2)
library(knitr)

# Read CSV files
# Needed to use files with d2024_c20250818 ending because location file w/ d2025 had no data when analysis was conducted
details <- read.csv("C:/Users/rjani/Downloads/StormEvents - Details/StormEvents_details-ftp_v1.0_d2024_c20250818.csv")
fatalities <- read.csv("C:/Users/rjani/Downloads/StormEvents - Fatalities/StormEvents_fatalities-ftp_v1.0_d2024_c20250818.csv")
locations <- read.csv("C:/Users/rjani/Downloads/StormEvents - Locations/StormEvents_locations-ftp_v1.0_d2024_c20250818.csv")

# Merge data files by event ID
StormEvents_joined_data <- merge(details, fatalities, by = "EVENT_ID")
StormEvents_joined_data <- merge(StormEvents_joined_data, locations, by = "EVENT_ID")

# 1 Harmful events for population
health_impact <- StormEvents_joined_data %>%
  group_by(EVENT_TYPE) %>%
  summarise(
    total_fatalities = sum(DEATHS_DIRECT, DEATHS_INDIRECT, na.rm = TRUE),
    total_injuries = sum(INJURIES_DIRECT, INJURIES_INDIRECT, na.rm = TRUE),
    total_harmed = total_fatalities + total_injuries
  ) %>%
  arrange(desc(total_harmed))
head(health_impact, 8)

event_graph <- ggplot(data=health_impact, aes(x=reorder(EVENT_TYPE, -total_harmed), y=total_harmed, fill=EVENT_TYPE))
event_graph <- event_graph + geom_bar(stat="identity")
event_graph <- event_graph + theme(axis.text.x = element_text(angle=90)) + xlab("Type of Event")
event_graph <- event_graph + ylab("Combined Injuries & Fatalities") + ggtitle("Most Harmful Events") + theme(legend.position = "none")
event_graph <- event_graph + ylim(c(0,850))
event_graph

# 2 Events by state
event_counts_by_state <- StormEvents_joined_data %>%
  group_by(STATE, EVENT_TYPE) %>%
  summarise(event_count = n(), .groups = "drop") %>%
  arrange(desc(event_count))

most_common_event_state <- event_counts_by_state %>%
  group_by(STATE) %>%
  slice_max(event_count, n = 1) %>%
  select(STATE, EVENT_TYPE,event_count) %>%
  arrange(desc(event_count))
print(most_common_event_state, n = Inf)

#3  Events by month
event_month_summary <- StormEvents_joined_data %>%
  group_by(MONTH_NAME, EVENT_TYPE) %>%
  summarise(event_count = n(), .groups = "drop") %>%
  arrange(MONTH_NAME, desc(event_count))
print(event_month_summary, n = Inf)

# 4 Most Common Events by month, and event total
most_common_event_month <- event_month_summary %>%
  group_by(MONTH_NAME) %>%
  slice_max(event_count, n = 1) %>%
  select(MONTH_NAME, EVENT_TYPE,event_count) %>%
  arrange(desc(event_count))
print(most_common_event_month, n = Inf)
