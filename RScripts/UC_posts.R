library(tidyverse)
library(jsonlite)
library(readr)

uci <- fromJSON("../data/UC_data//posts_v2/uci_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "uci")

berkeley <- fromJSON("../data/UC_data//posts_v2/berkeley_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "berkeley")

UCDavis <- fromJSON("../data/UC_data//posts_v2/UCDavis_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "UCDavis")

ucla <- fromJSON("../data/UC_data//posts_v2/ucla_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "ucla")

ucmerced <- fromJSON("../data/UC_data//posts_v2/ucmerced_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "ucmerced")

ucr <- fromJSON("../data/UC_data//posts_v2/ucr_posts.JSON") %>% distinct() %>%
  distinct() %>%
  mutate(subreddit = "ucr")

UCSantaBarbara <- fromJSON("../data/UC_data//posts_v2/UCSantaBarbara_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "UCSantaBarbara")

UCSC <- fromJSON("../data/UC_data//posts_v2/UCSC_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "UCSC")

ucsd <- fromJSON("../data/UC_data//posts_v2/ucsd_posts.JSON") %>%
  distinct() %>%
  mutate(subreddit = "ucsd")

UC_data <- bind_rows(
  uci,
  berkeley,
  UCDavis,
  ucla,
  ucmerced,
  ucr,
  UCSantaBarbara,
  UCSC,
  ucsd
)

write_csv(UC_data, "../data/UC_data/UC_posts.csv")

