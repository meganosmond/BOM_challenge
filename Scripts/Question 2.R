#Q2 Which month saw the lowest average daily temperature difference?
# This question can be answered using just the BOM_data file.
# In addition to the functions you used above, this question will need a mutate() to calculate the temperature diffence.
# The temperature values are stored as characters after you have run separate() (see the <chr> in the second row if you print the data frame to the console). To be able to calculate the difference without an error, you will need to convert them to numeric values with as.numeric() first.
# For rows that are missing a temperature measurement, the temperature difference will be NA. How will you deal with these in the rest of the analysis?

Answer_to_Q2 <- BOM_separated %>% 
  mutate(Temp_Diff = as.numeric(Temp_max)-as.numeric(Temp_min)) %>% 
  group_by(Month) %>% 
  summarise(Temp_Diff = mean(Temp_Diff, na.rm = TRUE)) %>% 
  arrange(Temp_Diff)
             




