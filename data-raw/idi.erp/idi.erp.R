
library(readr)
library(dplyr)

idi.erp <- read_csv("data-raw/idi.erp/exp-pop-estimates-2007-16-csv.csv") %>%
    mutate(age = ifelse(age == "90", "90+", age),
           age = factor(age, levels = c(0:89, "90+"))) %>%
    rename(time = year, count = idierp) %>%
    xtabs(count ~ age + sex + time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(idi.erp,
     file = "data/idi.erp.rda",
     compress = "xz")
