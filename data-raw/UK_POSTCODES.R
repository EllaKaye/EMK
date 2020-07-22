library(readr)
library(dplyr)
UK_POSTCODES <- read_csv("/Users/ellakaye/Dropbox/Misc/UK_postcodes.csv") %>%
  select(-id) %>%
  rename(POSTCODE = postcode, LAT = latitude, LONG = longitude)

usethis::use_data(UK_POSTCODES, overwrite = "TRUE")
rm(UK_POSTCODES)
