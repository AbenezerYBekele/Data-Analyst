library(readr)
library(tidyverse)
library(janitor)
library(dplyr)



art_Data <- read_csv("C:/Users/abiye/OneDrive - University of Wisconsin-River Falls/Spring Semester 2024/Data Science/datas/Washington_s_State_Art_Collection_2023-10-281.csv")
 
art_Data |> 
  glimpse()

art_Data <- art_Data |> 
  clean_names() 

art_Data |> 
  glimpse()

art_Data <- art_Data |> 
  select(city, art_site, art_title, art_type, date_made, materials, artwork_id)

art_Data |> 
  get_dupes() |> 
  View()


art_Data <- art_Data |> 
  distinct() 

art_Data <- art_Data |> 
  mutate(art_title = gsub('["]', '', art_title))

art_Data |> 
  filter(str_length(date_made) > 4) |> 
  View()

art_Data <- art_Data |> 
  mutate(year_made = str_sub(date_made, 1, 4)) 

art_Data <- art_Data |> 
  mutate(year_made = na_if(year_made, "Date")) 

art_Data |> 
  mutate(year_made = ymd(year_made, truncated = 2L))

art_Data |> 
  tabyl(year_made)

art_Data |>
  filter(art_type == "Sculpture") |>
  tally()

result <- art_Data |>
  select(city, art_title, date_made) |>
  filter(city == "Aberdeen")
  print(result)

  art_Data <- art_Data |>
    mutate(title_length = str_length(art_title))

  art_Data |>
    glimpse()
  
  
  yearsD <- art_Data |>
    group_by(year_made) |>
    summarize(number_of_artworks = n()) |>
    arrange(desc(number_of_artworks))
  print(yearsD)
  

  result <- art_Data  |>
    group_by(materials) |>
    summarize(number_of_artworks = n()) |>
    arrange(desc(number_of_artworks))
            print(result)
            
 
  result <- art_Data  |>
  group_by(art_type) |>
  summarize(number_of_artworks = n()) |>
  arrange(desc(number_of_artworks))
  print(result)            
  

  art_Data |>
    group_by(art_type) |>
    summarize(numberOfRecords = n()) |>
    arrange(desc(numberOfRecords)) |>
    ungroup() |>
    mutate(percentage = 100 * (numberOfRecords / sum(numberOfRecords)))

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
  
  
