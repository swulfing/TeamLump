library(dplyr)

setwd("GitHub/TeamLump/DatatoClean")


# MA_DMF DATA CLEAN -------------------------------------------------------
MA_DMF <- data.frame(read.csv("MA_DMF/MA_DMF_combined.csv"))

#Get rid of negative catch - Reduces from 8087 to 65 datapoints
MA_DMF_clean <- MA_DMF %>%
  filter(NUM !=0 )
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
         WEIGHT_AVG = WT) %>%
  mutate(DATASOURCE = "MA_DMF", .before = LON)

MA_DMF_clean %>% count(SURVEY_ID, sort = TRUE)

#Bigger questions/to do:
  
  #Check metadata for what number sin STRATUM and STATION refer to
  #Check metadata for NUM/WT explanation
  #I'm assuming we'll have one row/lumpfish. should I take average wt of each? or have a separate col when wt is averaged?

