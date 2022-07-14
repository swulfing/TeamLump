library(dplyr)
library(magrittr)
library(sp)

setwd("C:/Users/sophi/Documents/GitHub/TeamLump")


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


# ## Making sure tows with the same survey id can still be identified individualle. I.e. no two tows have same SURVEY_ID AND LAT/LON
# #Survey ID's are not unique - Address later?
# MA_DMF_test <- MA_DMF_clean %>%
#   group_by(SURVEY_ID) %>%
#   filter(n() > 1)
# #Making sure those with same ID's don't have same Lat/Lon
# MA_DMF_test <- MA_DMF_test %>%
#   group_by(SURVEY_ID, LON, LAT) %>%
#   mutate(dupe = n() > 1) %>%
#   filter(dupe == TRUE)


#Duplicate columns based on no of lumpfish caught
MA_DMF_clean <- as.data.frame(lapply(MA_DMF_clean, rep, MA_DMF_clean$NO_TOW))

MA_DMF_clean <- MA_DMF_clean %>%
  mutate(WEIGHT_AVG = WEIGHT_TOT/NO_TOW)

#remove all object names except final product
rm(list=setdiff(ls(), "MA_DMF_clean"))

#Bigger questions/to do:
  
  #Check metadata for what number sin STRATUM and STATION refer to
  #Check metadata for NUM/WT explanation
  #Is this sufficiently clean?


# ME_DMR DATA CLEAN -------------------------------------------------------
Bio_check <- data.frame(read.csv("DatatoClean/ME_DMR/Lumpfish_Bio_check.csv"))
Trawl_Length <- data.frame(read.csv("DatatoClean/ME_DMR/MaineDMR_Trawl_Survey_Catch_at_Length_Data_2022.05.21.csv"))
Trawl_Catch <- data.frame(read.csv("DatatoClean/ME_DMR/MaineDMR_Trawl_Survey_Catch_Data_2022.05.21.csv"))
Trawl_Tow <- data.frame(read.csv("DatatoClean/ME_DMR/MaineDMR_Trawl_Survey_Tow_Data_2022.05.21.csv"))


# #Each survey ID is unique to year and season
# ME_DMR_test <- Trawl_Tow %>%
#   group_by(Year, Survey) %>%
#   mutate(dupe = n() > 1) %>%
#   filter(dupe == TRUE)

#  #Tow numbers aren't repeated within years
# ME_DMR_test <- Trawl_Tow %>%
#   group_by(Survey, Tow_Number) %>%
#   mutate(dupe = n() > 1) %>%
#   filter(dupe == TRUE)

#SKIP FOR NOW. UNCLEAR ON SOME OF THE ENTRIES


# NHFG DATA CLEAN -------------------------------------------------------
NHFG_Catch <- data.frame(read.csv("DatatoClean/NH_FG/NHFG_Catch.csv"))
NHFG_Length <- data.frame(read.csv("DatatoClean/NH_FG/NHFG_Lengths.csv"))

# # All sample ID's unique
# NHFG_test <- NHFG_Catch %>%
#     group_by(SampleID) %>%
#     mutate(dupe = n() > 1) %>%
#     filter(dupe == TRUE)


# Not all fish caught have length data
NHFG_test1 <- NHFG_Length %>%
  count(SampleID)

NHFG_test2 <- NHFG_Catch %>%
  select(SampleID, NumberCaught)

# Dataframe of differeces in samples
NHFG_test <- left_join(NHFG_test1, NHFG_Catch,
                       by = "SampleID") %>%
  mutate(Diff = NumberCaught - n) %>%
  rename(SubstrateName = Substrate)
  
  
# Multiply rows to account for fish not lengthed then add back to dataframe
NHFG_Unlengthed <- data.frame(lapply(NHFG_test, rep, NHFG_test$Diff))
NHFG_Unlengthed <- select(NHFG_Unlengthed, -one_of("n", "NumberCaught", "Diff", "Species"))

NH_FG_clean <- bind_rows(NHFG_Length, NHFG_Unlengthed)

#Read Date as Date in R
test <- NH_FG_clean$Date
NH_FG_clean$Date <- as.POSIXlt(NH_FG_clean$Date, format = "%e/%d/%Y")

#Convert Lat/Lon from DMS to DD
NH_FG_clean$Latitude <- NH_FG_clean$Latitude %>%
  sub('o ', 'd', .) %>%
  sub(' ', '\'', .) %>%
  sub(' ', '" ', .) %>%
  char2dms %>%
  as.numeric

NH_FG_clean$Longitude <- NH_FG_clean$Longitude %>%
  sub('o ', 'd', .) %>%
  sub(' ', '\'', .) %>%
  sub(' ', '" ', .) %>%
  char2dms %>%
  as.numeric

#Renaming Columns and make DATASOURCE COL
NH_FG_clean <- NH_FG_clean %>%
  rename(LON = Longitude,
         LAT = Latitude,
         DATE = Date,
         SUBSTRATE = SubstrateName,
         SURVEY_ID = SampleID,
         STATION = StationName,
         SALINITY = Salinity,
         TEMP_SURFACE = Temp,
         LENGTH = Length) %>%
  mutate(DATA_SOURCE = "NH_FG", .before = LON) %>%
  select(-CommonName)


#Next Steps:
#Season - can add
#Are these salinities surgace or depth. I've been assuming depth

#remove all object names except final product
rm(list=setdiff(ls(), c("MA_DMF_clean", "NH_FG_clean")))

