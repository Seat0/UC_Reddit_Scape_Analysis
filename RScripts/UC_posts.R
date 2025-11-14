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


# Ipeds data 

library(RODBC)
IPEDS <- odbcConnectAccess2007("../data/IPEDS_Data/IPEDS202324.accdb") 

EF2023A <- sqlFetch(IPEDS, "EF2023A") %>% 
  filter(EFALEVEL == 1)
  
DRVEF2023 <- sqlFetch(IPEDS, "DRVEF2023")
  
SFA2223_P1 <- sqlFetch(IPEDS, "SFA2223_P1")


IPEDS2324 <- EF2023A %>% 
  left_join(DRVEF2023, by = "UNITID") %>% 
  left_join(SFA2223_P1, by = "UNITID") %>% 
  filter(UNITID %in% c(110653, 110635, 110644, 110662, 445188, 110671, 110705, 110714, 110680))

# irvine 110653
# Berkely 110635
# Davis 110644
# UCLA 110662
# Merced 445188
# Riverside 110671
# Santa Barb 110705
# Santa Cruz 110714
# San Diego 110680




