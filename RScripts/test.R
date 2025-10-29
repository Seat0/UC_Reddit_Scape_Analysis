library(tidyverse)
library(jsonlite)
library(readr)

test <- fromJSON("../data/UC_data//posts_v2/uci_posts.JSON")

test2 <- n_distinct(test$title)

duplicates <- test %>%
  add_count(title) %>%
  filter(n > 1) %>%
  select(-n)