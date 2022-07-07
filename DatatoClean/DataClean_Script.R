library(dplyr)

setwd("GitHub/TeamLump")


# MA_DMF DATA CLEAN -------------------------------------------------------
MA_DMF <- data.frame(read.csv("DatatoClean/MA_DMF/MA_DMF_combined.csv"))

#Getw rid of negative catch.change 0 weights to NA's- Reduces from 8087 to 65 datapoints
MA_DMF_clean <- MA_DMF %>%
  filter(NUM !=0 ) %>%
  mutate(WT = na_if(WT, 0))

#Read BEGIN_EST as Date in R
MA_DMF_clean$BEGIN_EST <- as.POSIXct(MA_DMF_clean$BEGIN_EST, format = "%d-%b-%y")


#Renaming Columns and make DATASOURCE COL
MA_DMF_clean <- MA_DMF_clean %>%
  rename(SURVEY_ID = CRUISE,
         DATE = BEGIN_EST,
         STRATUM = ST,
         STATION = STAT,
         DEPTH = SETDEPTH,
         TEMP_BOTTOM = BOTTEMP,
         NO_TOW = NUM,
         WEIGHT_TOT = WT) %>%
  mutate(DATA_SOURCE = "MA_DMF", .before = LON)

#Survey ID's are not unique - Address later?
MA_DMF_clean %>% count(SURVEY_ID, sort = TRUE)
  
#Duplicate columns based on no of lumpfish caught
MA_DMF_clean <- as.data.frame(lapply(MA_DMF_clean, rep, MA_DMF_clean$NO_TOW))

MA_DMF_clean <- MA_DMF_clean %>%
  mutate(WEIGHT_AVG = WEIGHT_TOT/NO_TOW)


#Bigger questions/to do:
  
  #Check metadata for what number sin STRATUM and STATION refer to
  #Check metadata for NUM/WT explanation
  #Survey ID's are not unique so some duplicate rows are from the same tow and others are different. What do?
      #MA_DMF_clean %>% count(SURVEY_ID, sort = TRUE)
  #Is this sufficiently clean?


