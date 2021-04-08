download : 
	wget -O new_IRIS_telemetry_and_FITS_metadata.csv https://docs.google.com/spreadsheets/d/1D-e615yT1MA8fyRQeD7jPNMoNALHDM8_dgA1VQUbqO0/gviz/tq?tqx=out:csv&sheet={union}

csvdiff : IRIS_telemetry_and_FITS_metadata.csv new_IRIS_telemetry_and_FITS_metadata.csv
	csv-diff IRIS_telemetry_and_FITS_metadata.csv new_IRIS_telemetry_and_FITS_metadata.csv --key=Id > csvdiff/$$(date '+%Y.%m.%d').txt

update :
	mv new_IRIS_telemetry_and_FITS_metadata.csv IRIS_telemetry_and_FITS_metadata.csv

.PHONY: list
.DEFAULT_GOAL := list

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
