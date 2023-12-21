NOTE: Data is confidential so will not be uploaded to github

Notes: 
	Only lengthed data tells you number of fish in the tow. Those that do not have length data, all we know is that at least one lumpfish were caught on this tow.

Also eliminated tow ID's due to confidentiality

Also some weights don't make sense

2 Datasets:
	NOAA_Observer_LengthData
	NOAA_Observer_CatchData

Connecting Columns:
	LINK3
	YEAR
	MONTH
	
Column Names:
	NOAA_Observer_LengthData - 363 Datapoints. Positive Catch
		LINK3 - Unique haul identifier (3 digit program code, 4 digit year, 2 digit month, 6 digit trip identifier, 4 digit haul number)
		YEAR - No.
		MONTH - No.
		SAMPWEIGHT - No. Total Weight of Subsample. LBS. Convert and average!
		SPECIES - Species Common Name - Check for all Lump. String
		LENAML - No. Length. Cm
		NUMLEN - No. Number of fish at that length.

	NOAA_Observer_CatchData - 10134 Datapoints. Positive Catch
		LINK3 - No. Unique haul identifier (3 digit program code, 4 digit year, 2 digit month, 6 digit trip identifier, 4 digit haul number)
		YEAR - No.
		MONTH - No.
		DATEHBEG - Date Haul Began. Format: mm-dd-yyyy hh:mm:ss
		DATEHEND - Date Haul Ended. Format: mm-dd-yyyy hh:mm:ss
		GIS_LATHBEG - Latitude Haul Began. Decimal units
		GIS_LONHBEG - Longitude Haul Began. Decimal units
		GIS_LATHEND - Latitude Haul Ended. Decimal units
		GIS_LONHEND - Longitude Haul Ended. Decimal units
		GEARNM - Gear Used on Haul. String
		HAULTARGET1 - Haul Target Species
		HAULTARGET2 - Haul Target Species
		DEPTH - Depth of Haul in Fathoms - Convert!
		WTMP - Sea Surface Temperatuer in Fahrenheight - Convert!
		SPECIES - Species Common Name - Check for all Lump. String
		HAILWT - Total Weight of Catch. LBS. Convert!
		FISHDISPDESC - Fish Disposition Description
	
		