Negative Catch
TO DO:
Check that depth is in meters

Data Downloaded from:
https://www.fisheries.noaa.gov/inport/item/22557 

Folder Names:
22560 - Fall Bottom Trawl Survey
22561 - Spring Bottom Trawl Survey
22562 - Summer Bottom Trawl Survey
22563 - Winter Bottom Trawl Survey

SAME COLUMNS:
All: CRUISE6 - Probably cruise ID

	STRATUM - BIO, CAT, LEN, STA
	TOW - BIO, CAT, LEN, STA
	STATION - BIO, CAT, LEN, STA
	ID - BIO, CAT, LEN, STA

#_SVDBS_CRUISES - Cruise info?
59 Rows

COLUMN NAMES:
	CRUISE6 - Cruise ID?
	PURPOSE_CODE - No. all 10
	PURPOSE - String "NMFS NEFSC BOTTOM TRAWL SURVEY"
	STATUS_CODE - No. all 10
	STATUS - String "Audited"
	SEASON - String
	YEAR - Survey year

#_UNION_FSCS_SVSTA - I think this is environ info?
19456 Rows
	COLUMN NAMES:
	CRUISE6 - No. Cruise ID
	STRATUM - No.
	TOW - No. Tow ID within cruise?
	STATION - No. 
	ID - 9 No. code?
	AREA - No. What is this?
	SVVESSEL - String. Vessel ID?
	CRUNUM - No. What is this?
	SVGEAR - No.  GearType Code
	BEGIN_EST_TOWDATE - Beginning time EST. Format: mm/dd/yyyy HH:mm:ss
	END_EST_TOWDATE - End time EST. Format: mm/dd/yyyy HH:mm:ss
	BEGIN_GMT_TOWDATE - Beginning time GMT. Format: mm/dd/yyyy HH:mm:ss
	END_GMT_TOWDATE - End time GMT. Format: mm/dd/yyyy HH:mm:ss
	EST_YEAR - No.
	EST_MONTH - No.
	EST_DAY - No.
	EST_JULIAN_DAY - No.
	EST_TIME - No. Format HH:mm:ss
	GMT_YEAR - No.
	GMT_MONTH - No.
	GMT_DAY - No.
	GMT_JULIAN_DAY - No.
	GMT_TIME - No. Format HH:mm:ss
	TOWDUR - No. Tow duration?
	SETDEPTH - No. Beginning depth. Units?
	ENDDEPTH - No. End depth. Units?
	MINDEPTH - No. Minimum depth. Units?
	MAXDEPTH - No. Maximum depth. Units?
	AVGDEPTH - No. Avg depth. Units?
	BEGLAT - Beginning lat Format?
	BEGLON - Beginning lon Format?
	ENDLAT - End lat Format?
	ENDLON - End lon Format?
	DECDEG_BEGLAT - Beginning lat. Dec Degrees. Note: Watch for blanks
	DECDEG_BEGLON - Beginning lon Dec Degrees. Note: Watch for blanks
	DECDEG_ENDLAT - End lat Dec Degrees. Note: Watch for blanks
	DECDEG_ENDLON - End lon Dec Degrees. Note: Watch for blanks
	CABLE - No. What is this?
	PITCH - No. What is this?
	HEADING - No. What is this?
	COURSE - No. What is this?
	RPM - No. What is this?
	DOPDISTB - No. What is this?
	DOPDISTW - No. What is this?
	DESSPEED - No. What is this?
	AIRTEMP - No. Units?
	CLOUD - No. What is this?
	BAROPRESS - Air pressure. Units?
	WINDDIR - No. Units?
	WINDSP - No. Units?
	WEATHER - No. What is this? 0, 1, 2
	WAVEHGT - No. Units?
	SWELLDIR - No. Units?
	SWELLHGT - No. Units?
	BKTTEMP - No. What is this?
	XBT - No. What is this?
	SURFTEMP - Surface temp. Units?
	SURFSALIN - Surface salinity. Units?
	BOTTEMP - Bottom temp. Units?
	BOTSALIN - Bottom Salinity. Units?

#_UNION_FSCS_SVCAT - I think this is catch info?
298711 rows

COLUMN NAMES:
	CRUISE6 - No. Cruise ID
	STRATUM - No.
	TOW - No. Tow ID within cruise?
	STATION - No. 
	ID - 9 No. code?
	LOGGED_SPECIES_NAME - String Different from SVLEN?
	SVSPP - No. What is this?
	CATCHSEX - 0, 1, 2?
	EXPCATCHNUM - No. What is this?
	EXPCATCHWT - No. What is this?

#_UNION_FSCS_SVBIO - Bio info?
584641 rows
COLUMN NAMES:
	CRUISE6 - No. Cruise ID
	STRATUM - No.
	TOW - No. Tow ID within cruise?
	STATION - No. 
	ID - 9 No. code?
	SVSPP - No. ?
	CATCHSEX - No. 0, 1, 2?
	INDID - No. ?
	LENGTH - No. Units?
	INDWT - No. Units?
	SEX - No. 0, 1, 2?
	MATURITY - String?
	AGE - No. Units?
	STOM_VOLUME - No. What's this?
	STOM_WGT - No. What's this

#_UNION_FSCS_SVLEN - Length info?
Note: error message says dataset is too large for excel grid. It says if I save the file that some data will be lost. Does that mean I've lost it?
1048576 Rows

COLUMN NAMES:
CRUISE6 - No. Cruise ID
	STRATUM - No.
	TOW - No. Tow ID within cruise?
	STATION - No. 
	ID - 9 No. code?
	LOGGED_SPECIES_NAME - String. Different from SVCAT?
	SVSPP - No. Same as SVBIO?
	CATCHSEX - No. 0, 1, 2? 
	LENGTH - No. Units?
	EXPNUMLEN - No. What is this
