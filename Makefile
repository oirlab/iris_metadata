download : 
	wget -O new_IRIS_telemetry_and_FITS_metadata.csv https://docs.google.com/spreadsheets/d/1D-e615yT1MA8fyRQeD7jPNMoNALHDM8_dgA1VQUbqO0/gviz/tq?tqx=out:csv&sheet={union}

csvdiff : IRIS_telemetry_and_FITS_metadata.csv new_IRIS_telemetry_and_FITS_metadata.csv
	csv-diff IRIS_telemetry_and_FITS_metadata.csv new_IRIS_telemetry_and_FITS_metadata.csv --key=Id > csvdiff/$$(date '+%Y.%m.%d').txt
