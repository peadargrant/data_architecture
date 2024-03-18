#!/bin/bash
# COVID database setup
# Peadar Grant

DBNAME=covid

URL='https://opendata-geohive.hub.arcgis.com/datasets/d8eb52d56273413b84b0187a4e9117be_0.csv?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D'

LOADFILE=covid.csv

curl -o $LOADFILE "$URL"

dropdb $DBNAME;
createdb $DBNAME;
psql -f covid_setup.sql $DBNAME



