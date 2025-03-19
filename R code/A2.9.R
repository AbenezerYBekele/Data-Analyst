
library(readr)
library(tidyverse)
library(janitor)
library(dplyr)
library(ggplot2)
# Import the Data

# Replace the space provided with the file path or use GUI options of RStudio to import the data as an Excel file

rental_Data <- read_csv("C:/Users/abiye/OneDrive - University of Wisconsin-River Falls/Spring Semester 2024/Data Science/datas/Active_Rental_Licenses.csv")

rental_Data |> 
  glimpse()

rental_Data <- rental_Data |> 
  clean_names()

rental_Data <- rental_Data |> 
  select (license_number, milestone, issue_date, expiration_date, owner_name, owner_city, licensed_units, community_desc, short_term_rental)

# Check for any duplicate records
# http://jenrichmond.rbind.io/post/digging-into-the-janitor-package/
rental_Data |> 
  get_dupes() |> 
  View()

# Remove duplicates
rental_Data <- rental_Data |> 
  distinct() 

rental_Data <- rental_Data |> 
  mutate(issue_date = ymd_hms(issue_date), expiration_date = ymd_hms(expiration_date)) |> 
  mutate(numberOfDays = as.double(difftime( expiration_date,issue_date, units = "days")))


rental_Data |> 
  group_by(short_term_rental) |> 
  tally()

rental_Data |> 
  filter(short_term_rental == "Yes") |> 
  group_by(owner_city) |> 
  tally() |> 
  arrange(desc(n))

# Task 1

rental_Data <- rental_Data |>  
  mutate(year_issued = format(issue_date, format = "%Y")) 

rental_Data <- rental_Data |>  
  mutate(month_issued = format(issue_date, format = "%m")) 

rental_Data <- rental_Data |>  
  mutate(day_issued = format(issue_date, format = "%d")) 

# https://lubridate.tidyverse.org/reference/day.htmlLinks to an external site.

rental_Data <- rental_Data |>  
  mutate(week_day_issued = wday(issue_date, label = TRUE)) 


# Task 2
rental_Data <- rental_Data |>
  group_by(community_desc) |>
  summarize(number_of_properties = n()) |>
  arrange(desc(number_of_properties))

print(rental_Data)

# Task 3

rental_Data |>
  filter(!is.na(community_desc)) |>
  group_by(community_desc) |>
  summarise(numberOfRecords = n()) |>
  arrange(desc(numberOfRecords)) |>
  ungroup()


#Task 4
result <- rental_Data |>
  filter(!is.na(community_desc)) |>
  group_by(community_desc) |>
  summarize(number_of_properties = n()) |>
  arrange(desc(number_of_properties))

# Create a bar chart
ggplot(result, aes(x = reorder(community_desc, -number_of_properties), y = number_of_properties)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Number of Rental Properties by Community",
       subtitle = "Top communities with the highest rental properties",
       x = "Community",
       y = "Number of Properties") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Task 5
result <- rental_Data |>
  group_by(year_issued) |>
  summarize(number_of_applications = n())
#Task 6
rental_Data |>
  group_by(year_issued) |>
  summarize(numberOfRecords = n()) |>
  arrange(desc(numberOfRecords)) |>
  ungroup() |>
  ggplot(aes(x = lubridate::ymd(year_issued, truncated = 2L), y = numberOfRecords)) +
  geom_line(linetype = "dashed", color = "#0099f9", linewidth = 2) +
  geom_point(color = "#0099f9", size = 5) +
  labs( title = "Growth in Rental License Applications", subtitle = "Data from 1991 to 2024", caption = "Source: Minneapolis Data Portal" ) +
  labs( x = "Year", y = "Number of Rental Applications" )

#Task 7
rental_Data |>
  filter(year_issued == '1999') |>
  group_by(month_issued) |>
  summarize(numberOfRecords = n()) |>
  arrange(desc(numberOfRecords)) |>
  ungroup()