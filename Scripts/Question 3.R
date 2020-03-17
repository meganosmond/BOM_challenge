# Q3 Which state saw the lowest average daily temperature difference?
# State information is found in the BOM_stations file. So we will need to join this with our previous dataset.
# The station data is not in a tidy format however, as each station is recorded in it’s own column. (Why is this data not tidy?)
# To tidy it before merging, you will need to gather() the station data into an intermediate form that has three columns, one for the station ID number, one for the type of data being recorded (the info column in the original data), and one for the actual recorded value itself. (Is this intermediate data tidy?)
# This data frame can then be spread() into a shape with one row for each station. Remember that the key argument to spread() identifies the column that will provide the data for the new column names, and the value argument identifies the column that will provide the data for the new cells.
# Finally, you will want to join the two datasets together to identify the state of each weather station. If you run into errors at this step, check that the two data frames have a shared column to merge, and that they are the same data type (eg. you can’t merge a character column with a numeric column).

BOM_data <-read_csv("Data/BOM_data.csv")
BOM_stations <-read_csv("Data/BOM_stations.csv")

BOM_stations_data <- BOM_stations %>% 
  gather(station_ID, Miscellaneous, -info) %>% 
 spread(key = info, value = Miscellaneous)
  
BOM_stations_data

BOM_station_rename <- rename(BOM_stations_data, Station_number=station_ID) 

BOM_station_rename

BOM_station_rename <- mutate(BOM_station_rename, Station_number = as.numeric(Station_number))

BOM_station_rename


Merged_Data <- full_join(BOM_station_rename, BOM_data)

Merged_Data

Answer_to_Q3 <- Merged_Data %>% 
  separate(Merged_Data, Temp_min_max, into = c("Temp_min", "Temp_max"), sep = "/") %>% 
  mutate(Temp_Diff = as.numeric(Temp_max)-as.numeric(Temp_min)) %>% 
  group_by(State) %>% 
  summarise(Temp_Diff = mean(Temp_Diff, na.rm = TRUE)) %>% 
  arrange(Temp_Diff)


