
library(readr)
library(dplyr)
library(MASS)

internal.mig <- read_csv("data-raw/internal.mig/migr_transitions_rc13_9613_rr3.csv",
                         na = c("", "..C")) %>%
    rename(region_dest = rc13desc,
           region_orig = ur5_rc13desc,
           age = age_grp) %>%
    mutate(region_dest = sub(" Region", "", region_dest),
           region_dest = sub("Area Outside", "Area Outside Region", region_dest),
           region_dest = factor(region_dest, levels = unique(region_dest))) %>%
    mutate(region_orig = ifelse(is.na(region_orig), "Not stated", region_orig),
           region_orig = sub(" Region", "", region_orig),
           region_orig = sub("Area Outside", "Area Outside Region", region_orig),
           region_orig = factor(region_orig, levels = c(levels(region_dest), "Not stated"))) %>%
    mutate(age = substr(age, start = 1, stop = 2),
           age = as.integer(age),
           age = ifelse(age < 90, paste(age - 5, age + 1, sep = "-"), "85+"),
           age = factor(age, levels = unique(age))) %>%
    mutate(time = paste(census_year - 4, census_year, sep = "-")) %>%
    mutate(count = as.integer(count)) %>%
    with(., tapply(count, data.frame(age, sex, region_orig, region_dest, time), sum))

## Impute suppressed values.  Values are suppressed if they are less than 6.
## The mean of the suppressed values is approximately 2.5.
set.seed(0)
prob.above.med <- 0.7
prob.below.med <- 0.1
is.missing <- is.na(internal.mig)
tmp <- internal.mig
tmp[is.missing] <- 1
mod <- loglm(count ~ age + sex + region_orig + region_dest + time,
             data = tmp,
             fitted = TRUE)
fitted.missing <- mod$fitted[is.missing]
median.fitted <- median(fitted.missing)
n.missing <- sum(is.missing)
imputed.missing <- rep(0, n.missing)
imputed.missing[(fitted.missing > median.fitted) & (runif(n.missing) < 0.7)] <- 3
imputed.missing[(fitted.missing < median.fitted) & (runif(n.missing) < 0.1)] <- 3
internal.mig[is.missing] <- imputed.missing

save(internal.mig,
     file = "data/internal.mig.rda")



