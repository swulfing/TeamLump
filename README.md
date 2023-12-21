# TeamLump

This is the repository for the analyses of the Lumpfish Distribution in the Gulf of Maine project. 

## DatatoClean Folder

### Data Folders

This folder contains folders of all of the datasets that are used in this analysis. Within each folder there is just the usable data files and a Notes.txt file. These Notes files will contain total number of data points, note whether it's positive or negative catch, any questions/comments I had, and the column names, units, and datatype of each of the variables in the dataset. Refer to these and metadata files if present for questions about datasets.

Due to file size reasons, the NEFSC data is not included in this repository. Instead, it must be downloaded from directly from the NOAA Bottom Trawl Survey website: https://www.fisheries.noaa.gov/inport/item/22557 using the application WInSCP. Settings for downloading the data with WinSCP are shown in the PNG file in the NEFSC raw data folder as well as the cleaned data folders. Any questions about downloading data can be redirected to Paul Kostovick at NOAA Federal: paul.kostovick@noaa.gov.

For confidentiality, NOAA_Observer data is also not included in this repository. To access this data, please download it from the project's OneDrive in the NOAA observer data folder and download the NOAA observer data_3_28_2023.xlsx file. Otherwise, a formal request must be submitted to Gina Shield at NOAA Federal: gina.shield@noaa.gov

### DataClean_Script

This markdown file is the code for compiling all of the datasets. Each code chunk is the code to clean data from each source, while the final code chunk combines these datasets and does some further cleaning. When running the script, ensure that all the packages in the setup chunk are downloaded. Also, because the NOAA Observer data is not included in the repository, the file locations to the catch and length datasets must be changed to whatever directory they were downloaded into. The NEFSC data is similar and must be changed to the directory they were found in, except the file locations are within a for loop as the code goes through each season folder to extract data. To change this, change the fileLocation object to be a character string of the location of the downloaded data, and this will be used within the for loop for data cleaning.

This script will create three documents: NOAAObserver_gearCount.csv which counts the number of lumpfish found with each geartype in the NOAA Observer dataset, and Lumpfish_Data_clean.csv which is the final product of the datacleaning script. Lumpfish_Data_clean.csv has it's own Notes.txt file that outlines the columns and units used in the final dataset. It's this file that is used in the analyses and visualization files. Finally, Lumpfish_Data_occurrences is created, which combines rows of the same tow to only include occurrence data.

## RawData Folder

Contains all raw data directly downloaded from sources. Copies of the relevant files are included in the Data folders. These folders are for storage purposes and are not directly used in any analyses.

## Main Folder

This is where all of the analyses and visualization files are located. DataSourceCheck is a markdown file which is a preliminary exploration of what several of the datasets contains. NHSG-Symposium-Visuals are the visuals used when presenting the data at the New Hampshire Sea Grant Research Symposium in February 2023. LumpVisualizations is also a preliminary exploration of the compiled data while LumpVisualizations_Manuscript contains the figures we're considering for the manuscript and have been revised to look more appropriate for publication. 