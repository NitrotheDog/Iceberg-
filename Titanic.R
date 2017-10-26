library(tidyr)
library(dplyr)

titanic_df <- tbl_df(titanic_original)

# Filling blank (NA) embarkation column with "S"

titanic_df$embarked[is.na(titanic_df$embarked)] <- "S"

# filling in NA's of age column with mean age.

titanic_df$age[is.na(titanic_df$age)] <- mean(titanic_df$age, na.rm = TRUE)

# filling Boat column's NAs with "None"

titanic_df$boat[is.na(titanic_df$boat)] <- "None"

# adding new column to indicate if cabin number was recorded

titanic_df <- titanic_df %>% 
  mutate(has_cabin_number = ifelse(is.na(titanic_df$cabin), 0, 1))

write.csv(titanic_df, "titanic_clean.csv")
