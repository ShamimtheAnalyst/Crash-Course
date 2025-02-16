

## Lubridate: dealing with time and date

## require libraries
library(tidyverse)
library(lubridate)

### creating time and date object

#input the date and time right now
now()

#install.packages("nycflights13")
library(nycflights13)
glimpse(flights)
names(flights)


flights %>% 
  select(origin, year, month, day, hour, minute) %>% 
  head()



flights %>% 
  mutate(flight_date = ymd_hm(paste(year, month, day, hour, minute))) %>% 
  select(origin, dest, flight_date) %>%
  head(4)




flights %>% 
  mutate(flight_date = make_datetime(year, month, day, hour, minute)) %>% 
  select(origin, dest, flight_date) %>%
  head(4)




### Extracting datetime data

flights %>% 
  mutate(flight_date = make_datetime(year, month, day)) %>% 
  mutate(weekday = wday(flight_date, label = TRUE),
         month_name = month(flight_date, label = TRUE)) %>% 
  select(origin, flight_date, weekday, month_name) %>%
  head(4)



###3 Arrhythmic with date-time data

# the daye and time exactly 30years from now

now() + years(30)



## filter for the month of september

flights %>% 
  filter(time_hour >= ymd("2013-09-01") &
           time_hour < ymd("2013-10-01")) %>% 
  select(origin, month) %>%
  head(4)




###4 time span (durations, periods, intervals)

my_duration <-  dseconds(15)

print(my_duration)

dminutes(4)


# using duration

ymd("2016-01-01") + dyears(1)



# using a period

ymd("2016-01-01") + years(1)



# adding period

months(3) + days(1) + minutes(8)

## multiply or divide a period

months(3) * 2



## intervals

start <- ymd_hms("2024-01-01 12:00:00")
end <- ymd_hms("2024-05-01 12:00:00")
iv <- interval(start, end)

print(iv)


## inclusion check and comparisons vector

ymd_hms("2024-04-01 12:00:00") %within% iv



# or use simply mathematical operators to compare two intervals

start2 <- ymd_hms("2024-01-01 12:00:00")
end2 <- ymd_hms("2024-05-01 12:00:00")
iv2 <- interval(start2, end2)

iv > iv2




## convert interval into duration/period

as.duration(iv)



unique(flights$carrier)


## working with ggplot2


flights %>% 
  filter(carrier %in% c("9E", "US", "AA", "MQ")) %>% 
  mutate(weekday = wday(time_hour, label = TRUE)) %>% 
  ggplot(aes(weekday)) +
  geom_bar(fill = "steelblue", alpha = 0.8) +
  facet_wrap( ~carrier) +
  theme_bw() +
  labs(title = "Number of flights by carrier and weekday",
       x = "Weekdays",
       y = "") +
  theme(plot.title = element_text(hjust = 0.5))



## working with frequency plot

flights %>% 
  filter(time_hour < ymd("2013-10-01"),
         carrier %in% c("9E", "US", "AA", "MQ")) %>% 
  ggplot(aes(time_hour, color = carrier)) +
  geom_freqpoly(linewidth = 1.2) +
  theme_bw() +
  labs(title = "Number of flights by carrier",
       x = "",
       y = "") +
  theme(plot.title = element_text(hjust = 0.5))
  


