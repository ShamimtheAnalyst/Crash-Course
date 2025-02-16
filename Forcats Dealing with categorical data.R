
## Dealing with categorical data
#### forcats

library(tidyverse)
theme_set(theme_minimal())


view(gss_cat)


levels(gss_cat$race)


gss_cat %>% 
  select(race) %>% 
  table()
  
  
  
  
## removed unused levels  
gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  select(race) %>% 
  table()
  
  
  
  
## modifying factor order
gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  mutate(race = fct_relevel(race, c("White", "Black", "Other"))) %>% 
  select(race) %>% 
  table()

  
  



## order the factors
gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue") +
  theme_classic(base_size = 20)




## order the levels of one variable by value in another variable
gss_cat %>% 
  group_by(relig) %>% 
  summarise(TV_watchtime_mean = mean(tvhours, na.rm = TRUE)) %>% 
  #mutate(relig = fct_reorder(relig, TV_watchtime_mean)) %>% 
  ggplot(aes(TV_watchtime_mean, relig)) +
  geom_point(size = 5, color = "steelblue") +
  theme_light(base_size = 20)







## modify factor levels
gss_cat %>% 
  count(partyid)
  
  
unique(gss_cat$partyid)  



## reorder the the similar levels 
gss_cat %>% 
  mutate(partyid = fct_recode(partyid, 
                              "others" = "Other party",
                              "others" = "No answer",
                              "others" = "Don't know")) %>% 
  count(partyid)
  
  







## recode/rename the levels
gss_cat %>% 
  mutate(partyid = fct_recode(partyid, 
                              "others" = "Other party",
                              "others" = "No answer",
                              "others" = "Don't know",
                              "Not Strong republican" = "Not str republican",
                              "Slightly republican" = "Ind,near rep",
                              "Slightly democrat" = "Ind,near dem",
                              "Not Strong democrat" = "Not str democrat")) %>% 
  count(partyid)






### reorder the the similar levels with factor collaspe function
gss_cat %>% 
  mutate(partyid = fct_collapse(partyid, 
                              "others" = c("Other party",
                                           "No answer",
                                           "Don't know"),
                              "Republican" = c("Not str republican",
                                               "Strong republican"),
                              "Democrat" = c("Strong democrat",
                                             "Not str democrat"),
                              "Independent" = c("Ind,near dem", 
                                                "Ind,near rep"))) %>% 
  count(partyid)




