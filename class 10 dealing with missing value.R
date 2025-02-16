
## Dealing with missing value

No_missing <- complete.cases(msleep)

missing <- !complete.cases(msleep)

# gives you which rows contains missing data
msleep[missing, ]  


### Dealing with Missing Data
# gives you "NA" if there any missing data
mean(starwars$height) 

# na means not available, rm = remove
mean(starwars$height, na.rm = TRUE) 

### Alternative way
median(starwars$height)
median(starwars$height, na.rm = TRUE)

# filter missing values/NA
ms <- msleep %>% 
  select(name, conservation, sleep_total) %>%
  filter(is.na(conservation))


# filter without missing values/NA
ms <- msleep %>% 
  select(name, conservation, sleep_total) %>%
  filter(!is.na(conservation))


## another way to Deal with Missing Data
view(starwars[is.na(starwars$hair_color), ])

# sort table in descending order (high -> low)
view(sort(table(starwars$hair_color), decreasing = TRUE))



