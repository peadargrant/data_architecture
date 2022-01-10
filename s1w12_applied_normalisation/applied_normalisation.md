# Applied normalisation notes

## Downloading data

Must be able to download data from a given URL *without* using a web browser!

Using curl (on Bash)

	curl -o "output.file" "http://url.goes/here" 

Using PowerShell:

	Invoke-WebRequest -Uri "http://url.goes/here" -OutFile "output.file"

Consider always scripting downloads. 

## Importing bookstore.csv

   	psql -f ./load.sql

## 1NF?

Is the books table in normal form?
Why / why not? 


