#First step to be able to read files open tidyverse: library(tidyverse)

library(tidyverse)

#To read a csv file into R: file_name <- read_csv(Data/file_name.csv")

BOM_data <-read_csv("Data/BOM_data.csv")
BOM_stations <-read_csv("Data/BOM_stations.csv")

#To open a csv file: file_name and run
BOM_data

#Q1 For each station, how many days have a minimum temperature, a maximum temperature and a rainfall measurement recorded?
#This question can be answered using just the BOM_data file.
#You will first need to separate() a column to access both the minimum and maximum temperature data.
#Then, you can filter() the data to keep only rows that have minimum temperature, maximum temperature, and rainfall measurements.
#A group_by() followed by summarise() will then allow you to count the number of rows remaining for each station.


BOM_separated <- BOM_data %>%
  separate(Temp_min_max, into = c("Temp_min", "Temp_max"), sep = "/")

BOM_separated

BOM_filtered <- BOM_separated %>% 
  filter(Temp_min != "-" , Temp_max != "-", Rainfall != "-")

BOM_filtered

BOM_grouped_by_station <- group_by(BOM_filtered, Station_number)

BOM_grouped_by_station

summarise(
  BOM_grouped_by_station, n_days = n())

Answer to Q1 <- 
  separate(BOM_data, Temp_min_max, into = c("Temp_min", "Temp_max"), sep = "/") %>% 
  filter(Temp_min != "-" , Temp_max != "-", Rainfall != "-") %>% 
  group_by(Station_number) %>% 
  summarise (n_days = n())


#Q2 Which month saw the lowest average daily temperature difference?
# This question can be answered using just the BOM_data file.
# In addition to the functions you used above, this question will need a mutate() to calculate the temperature diffence.
# The temperature values are stored as characters after you have run separate() (see the <chr> in the second row if you print the data frame to the console). To be able to calculate the difference without an error, you will need to convert them to numeric values with as.numeric() first.
# For rows that are missing a temperature measurement, the temperature difference will be NA. How will you deal with these in the rest of the analysis?

 
