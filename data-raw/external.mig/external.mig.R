
library(readr)
library(dplyr)

external.mig <- read_csv("data-raw/external.mig/rc13_pltmig_9716.zip") %>%
    rename(age = age_grp) %>%
    mutate(age = substr(age, start = 1, stop = 2),
           age = as.integer(age),
           age = ifelse(age < 90, paste(age, age + 4, sep = "-"), "90+"),
           age = factor(age, levels = unique(age))) %>%
    mutate(region = gsub(" Region", "", rc13desc),
           region = recode(region, "Area Outside" = "Area Outside Region"),
           region = factor(region, levels = unique(region)),
           region = recode(region, "Area outside region/ not stated" = "Area Outside Region / Not Stated")) %>%
    rename(time = year) %>%
    xtabs(count ~ age + sex + region + time + direction,
          data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(external.mig,
     file = "data/external.mig.rda",
     compress = "xz")
