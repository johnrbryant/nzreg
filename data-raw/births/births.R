
library(readr)
library(dplyr)

births <- read_csv("data-raw/births/rc13_bths9716_rr3.csv") %>%
    mutate(age = substr(age_grp_mother, start = 1, stop = 2),
           age = as.integer(age),
           age = paste(age, age + 4, sep = "-")) %>%
    mutate(region = gsub(" Region", "", rc13desc),
           region = recode(region, "Area Outside" = "Area Outside Region"),
           region = factor(region, levels = unique(region))) %>%
    rename(time = year) %>%
    xtabs(count ~ age + sex + region + time,
          data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(births,
     file = "data/births.rda",
     compress = "xz")
