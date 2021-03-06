

library(tidyverse) #First step to be able to read files open tidyverse: library(tidyverse)


BOM_data <- read_csv(Data/BOM_data.csv)#To read a csv file into R: file_name <- read_csv(Data/file_name.csv")


BOM_data  #To open a csv file: file_name and run

#Q1 For each station, how many days have a minimum temperature, a maximum temperature and a rainfall measurement recorded?
#This question can be answered using just the BOM_data file.


#You will first need to separate() a column to access both the minimum and maximum temperature data.
BOM_separated <- BOM_data %>%
  separate(Temp_min_max, into = c("Temp_min", "Temp_max"), sep = "/")

BOM_separated


#Then, you can filter() the data to keep only rows that have minimum temperature, maximum temperature, and rainfall measurements.
BOM_filtered <- BOM_separated %>% 
  filter(Temp_min != "-" , Temp_max != "-", Rainfall != "-")

BOM_filtered


#A group_by() followed by summarise() will then allow you to count the number of rows remaining for each station.
BOM_grouped_by_station <- group_by(BOM_filtered, Station_number)

BOM_grouped_by_station

summarise(
  BOM_grouped_by_station, n_days = n())

#piped answer
Answer_to_Q1 <- 
  separate(BOM_data, Temp_min_max, into = c("Temp_min", "Temp_max"), sep = "/") %>% 
  filter(Temp_min != "-" , Temp_max != "-", Rainfall != "-") %>% 
  group_by(Station_number) %>% 
  summarise (n_days = n())


