# Does the westmost (lowest longitude) or eastmost (highest longitude) weather station in our dataset have a higher average solar exposure?
# This question will need both the BOM_data and the BOM_stations file.
# You will not need any new verbs other than what you have used in previous answers.
# If answering this is final question is easy, spend some time reviewing your entire script to see if there are any ways you can improve it. Are there any repeated steps that you could save as an intermediate variable? Could you add some comments to make your code understandable?

Merged_Data

Answer_to_Q4 <- Merged_Data %>% 
  filter(Solar_exposure != "-") %>% 
  mutate(Solar_exposure = as.numeric(Solar_exposure)) %>% 
  group_by(Station_number, lon) %>% 
  summarise(Solar_exposure = mean(Solar_exposure)) %>% 
  arrange(lon)%>%
  ungroup() %>% 
  slice(-2:- (n()-1))

Answer_to_Q4


Answer_to_Q4alt <- Merged_Data %>% 
  filter(Solar_exposure != "-") %>% 
  mutate(Solar_exposure = as.numeric(Solar_exposure)) %>% 
  group_by(Station_number, lon) %>% 
  summarise(Solar_exposure = mean(Solar_exposure)) %>% 
  arrange(lon)%>%
  ungroup() %>% 
  filter(lon==max(lon)|lon==min(lon))


Answer_to_Q4alt
  
  
  



