library(readr)
library(tidyverse)
library(janitor)
library(dplyr)

# Import data

# Replace with your own path if it is different

art_Data <- read_csv("C:/Users/abiye/OneDrive - University of Wisconsin-River Falls/Spring Semester 2024/Data Science/datas/Washington_s_State_Art_Collection_2023-10-281.csv")

# Glimpse the data 
art_Data |> 
  glimpse()

# Rename the columns 
art_Data <- art_Data |> 
  clean_names() 

# Verify the changed column names
art_Data |> 
  glimpse()


# Only select the needed columns
art_Data <- art_Data |> 
  select(city, art_site, art_title, art_type, date_made, materials, artwork_id)


# Check for any duplicate records
# http://jenrichmond.rbind.io/post/digging-into-the-janitor-package/
art_Data |> 
  get_dupes() |> 
  View()


# Remove duplicates
art_Data <- art_Data |> 
  distinct() 

# Remove the extra quotes from art_title
# http://uc-r.github.io/regex
art_Data <- art_Data |> 
  mutate(art_title = gsub('["]', '', art_title))


# Check for date values that are unusual
#https://stringr.tidyverse.org/reference/str_length.html
art_Data |> 
  filter(str_length(date_made) > 4) |> 
  View()


# Extract the year by getting the first four characters from the string
# https://stringr.tidyverse.org/reference/str_sub.html
art_Data <- art_Data |> 
  mutate(year_made = str_sub(date_made, 1, 4)) 

# Where it says Date (from Date Unknown), replace it with NA's
# https://dplyr.tidyverse.org/reference/na_if.html
art_Data <- art_Data |> 
  mutate(year_made = na_if(year_made, "Date")) 

# Treat the year_made column as a proper date data type
# https://lubridate.tidyverse.org/reference/ymd.html
art_Data |> 
  mutate(year_made = ymd(year_made, truncated = 2L))

# Get count and percentage
art_Data |> 
  tabyl(year_made)

#Task 1
art_Data |>
  filter(art_type == "Sculpture") |>
  tally()
#Task 2
result <- art_Data |>
  select(city, art_title, date_made) |>
  filter(city == "Aberdeen")
  print(result)
# Task 3
  art_Data <- art_Data |>
    mutate(title_length = str_length(art_title))
  # check the dataframe for the new column added
  art_Data |>
    glimpse()
  
# Task 4
  
  yearsD <- art_Data |>
    group_by(year_made) |>
    summarize(number_of_artworks = n()) |>
    arrange(desc(number_of_artworks))
  print(yearsD)
  
#Task 5
  
  result <- art_Data  |>
    group_by(materials) |>
    summarize(number_of_artworks = n()) |>
    arrange(desc(number_of_artworks))
            print(result)
            
#Task6
            
  result <- art_Data  |>
  group_by(art_type) |>
  summarize(number_of_artworks = n()) |>
  arrange(desc(number_of_artworks))
  print(result)            
  
#Task 7 
  art_Data |>
    group_by(art_type) |>
    summarize(numberOfRecords = n()) |>
    arrange(desc(numberOfRecords)) |>
    ungroup() |>
    mutate(percentage = 100 * (numberOfRecords / sum(numberOfRecords)))
#task 8
  art_Data |>
    group_by(art_type) |>
    summarize(numberOfRecords = n()) |>
    arrange(desc(numberOfRecords)) |>
    ungroup() |>
    ggplot(aes(x = reorder(art_type, numberOfRecords), y = numberOfRecords)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(
      title = "State of Washington Art Collection",
      subtitle = "Years Made: 1930 - 2023",
      caption = "Source: data.wa.gov"
    ) +
    labs(
      x = "Art Type",
      y = "Number of Art Works"
    ) +
    coord_flip()
  
  #Task 9 
  art_Data |>
    group_by(year_made) |>
    summarize(numberOfRecords = n()) |>
    arrange(desc(numberOfRecords)) |>
    ungroup() |>
    ggplot(aes(x = lubridate::ymd(year_made, truncated = 2L), y = numberOfRecords)) +
    geom_line(linetype = "dashed", color = "#0099f9", linewidth = 2) +
    geom_point(color = "#0099f9", size = 5) +
    labs(
      title = "State of Washington Art Collection",
      subtitle = "Years Made: 1930 - 2023",
      caption = "Source: data.wa.gov"
    ) +
    labs(
      x = "Year",
      y = "Number of Art Works"
    )  
#Task 10  
  art_Data |>
    group_by(art_type) |>
    summarize(meanTitleLength = mean(title_length, na.rm = TRUE)) |>
    arrange(desc(meanTitleLength)) |>
    ungroup() |>
    ggplot(aes(x = art_type, y = meanTitleLength)) +
    geom_col(fill = "#0099f9") +
    labs(
      title = "State of Washington Art Collection",
      subtitle = "Years Made: 1930 - 2023",
      caption = "Source: data.wa.gov"
    ) +
    labs(
      x = "Art Type",
      y = "Mean - Length of Title"
    )
  
  
