
library(readr)
library(dplyr)

deaths <- read_csv("data-raw/deaths/rc13_dths9716_rr3.csv") %>%
    mutate(age = substr(age_grp, start = 1, stop = 2),
           age = as.integer(age),
           age = ifelse(age < 90, paste(age, age + 4, sep = "-"), "90+"),
           age = factor(age, levels = unique(age))) %>%
    mutate(region = gsub(" Region", "", rc13desc),
           region = recode(region, "Area Outside" = "Area Outside Region"),
           region = factor(region, levels = unique(region))) %>%
    rename(time = year) %>%
    xtabs(count ~ age + sex + region + time,
          data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(deaths,
     file = "data/deaths.rda",
     compress = "xz")
